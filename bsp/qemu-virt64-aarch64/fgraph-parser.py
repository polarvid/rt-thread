
class Event:
    def __init__(self, arr):
        self.entry_address = arr[0]
        self.entry_time = arr[1]
        self.exit_time = arr[2]
        self.tid = arr[3]


class RawFGraphText:
    def __init__(self):
        self.records = ''
        self.depth = {}
        self.stacked = {}
        self.last_record_time = 0
        pass

    def get_stacked(self, tid) -> list:
        # Check if tid is in timeline dictionary
        if tid not in self.stacked:
            # If it is not, save 0 in timeline for tid and return 0
            self.stacked[tid] = []
        return self.stacked[tid]

    def append(self, cpuid, record:Event):
        entry_record = '0x{tid:x} [{cpuid:03d}] {sec:3d}.{msec:09d}: funcgraph_entry:       func:0x{func:x} depth:{depth}\n'
        exit_record = '0x{tid:x} [{cpuid:03d}] {sec:3d}.{msec:09d}: funcgraph_exit:        func:0x{func:x} depth:{depth} overrun:{overrun} calltime:0x{entry_time:x} rettime=0x{exit_time:x}\n'
        # Simulate the record to stack

        # 1. Append the entry record
        entry_time = record.entry_time
        # Get the seconds and remaining msec from the entry_time in milliseconds
        seconds = entry_time // 1000000000
        msec = entry_time % 1000000000

        # 2. Compare & insert the stacked exit if they are elder
        stack = self.get_stacked(record.tid)
        while True:
            if stack:
                outer = stack[-1]
                outer:Event
                if entry_time > outer.exit_time:
                    # Insert the exit record
                    outer = stack.pop()
                    exit_sec = outer.exit_time // 1000000000
                    exit_ms = outer.exit_time % 1000000000

                    if outer.exit_time < self.last_record_time:
                        print('error detected: exit time not in order')
                    else:
                        self.last_record_time = outer.exit_time

                    self.records += exit_record.format(
                        tid = outer.tid,
                        cpuid = cpuid,
                        sec = exit_sec,
                        msec = exit_ms,
                        func = outer.entry_address,
                        depth = len(stack),
                        overrun = 0,
                        entry_time = outer.entry_time,
                        exit_time = outer.exit_time,
                    )
                else:
                    # Break if the outest.exit_time is after current entry_time
                    break
            else:
                # Break if no stacked record
                break

        # 3. Insert the entry record
        if entry_time < self.last_record_time:
            print('error detected')
        else:
            self.last_record_time = entry_time
        self.records += entry_record.format(
            tid = record.tid,
            cpuid = cpuid,
            sec = seconds,
            msec = msec,
            func = record.entry_address,
            depth = len(stack))
        
        # 4. To stack
        stack.append(record)


cpuid = 0
while True:
    try:
        # Open the logging.txt file and read the addresses
        with open(f'/home/rtthread-smart/kernel/bsp/qemu-virt64-aarch64/logging-{cpuid}.bin', 'rb') as f:
            events = []
            while True:
                # Read 32 bytes event
                event = f.read(32)
                values = [int.from_bytes(event[i:i+8], byteorder='little', signed=False) for i in range(0, 32, 8)]
                if not event:
                    break
                events.append(Event(values))
            total_count = len(events)

        fgraph = RawFGraphText()

        events = sorted(events, key=lambda x: x.entry_time, reverse=False)
        for event in events:
            fgraph.append(cpuid, event)

    except:
        break
    cpuid += 1

# All in One
with open(f'fgraph-{cpuid}.txt', 'w') as f:
    f.write(fgraph.records)
