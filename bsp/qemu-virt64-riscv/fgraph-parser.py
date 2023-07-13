
class Event:
    def __init__(self, cpuid, arr):
        self.entry_address = arr[0]
        self.entry_time = arr[1]
        self.exit_time = arr[2]
        self.tid = arr[3]
        self.cpuid = cpuid


class FGraphRecord:
    def __init__(self, timestamp, record_str):
        self.timestamp = timestamp
        self.record_str = record_str


class RawFGraphText:
    def __init__(self):
        self.records = []
        self.depth = {}
        self.stacked = {}
        self.last_record_time = 0
        self.current_tid = 0
        pass

    def get_stacked(self, tid) -> list:
        # Check if tid is in timeline dictionary
        if tid not in self.stacked:
            # If it is not, save 0 in timeline for tid and return 0
            self.stacked[tid] = []
        return self.stacked[tid]
    
    def func_name_dict_set(self, func_name_dict:dict):
        self.func_name_dict = func_name_dict
        return

    def append(self, cpuid, record:Event):
        entry_record = '{tname}-{tid} [{cpuid:03d}] {sec:3d}.{msec:09d}: funcgraph_entry:       func:0x{func:x} depth:{depth}\n'
        exit_record = '{tname}-{tid} [{cpuid:03d}] {sec:3d}.{msec:09d}: funcgraph_exit:        func:0x{func:x} depth:{depth} overrun:{overrun} calltime:0x{entry_time:x} rettime=0x{exit_time:x}\n'
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

                    tname, tid = self.func_name_dict[outer.tid]
                    exit_record_formatted = exit_record.format(
                        tid = tid,
                        tname = tname,
                        cpuid = cpuid,
                        sec = exit_sec,
                        msec = exit_ms,
                        func = outer.entry_address,
                        depth = len(stack),
                        overrun = 0,
                        entry_time = outer.entry_time,
                        exit_time = outer.exit_time,
                    )
                    fgraph_record = FGraphRecord(outer.exit_time, exit_record_formatted)
                    self.records.append(fgraph_record)

                else:
                    # Break if the outest.exit_time is after current entry_time
                    break
            else:
                # Break if no stacked record
                break

        # 3. Insert the entry record
        tname, tid = self.func_name_dict[record.tid]
        entry_record_formatted = entry_record.format(
            tid = tid,
            tname = tname,
            cpuid = cpuid,
            sec = seconds,
            msec = msec,
            func = record.entry_address,
            depth = len(stack))
        fgraph_record = FGraphRecord(entry_time, entry_record_formatted)
        self.records.append(fgraph_record)

        # 4. To stack
        stack.append(record)
        return

""" stack name parser """
def parse_file_to_dict(file_path):
    result_dict = {}
    unique_id = 10
    with open(file_path, 'r') as file:
        for line in file:
            # Split the line by comma to get address and func_name
            address, func_name = line.strip().split(' ')
            address = int(address, 16)
            # Use address as key and store func_name and unique_id as a tuple
            result_dict[address] = (func_name, unique_id)
            unique_id += 1
    return result_dict
""" file path fetcher """
def get_file_paths():
    import sys
    # Check if the correct number of arguments are provided
    if len(sys.argv) != 3:
        print("Usage: python fgraph-parser.py <bin_file_path> <thr_name_file_path>")
        sys.exit(1)

    # Get the file paths from the command line arguments
    bin_file_path = sys.argv[1]
    thr_name_file_path = sys.argv[2]

    return bin_file_path, thr_name_file_path

cpuid = 0
fgraph = RawFGraphText()
events = []
while True:
    try:
        # Open the logging.txt file and read the addresses
        with open(f'./logging-{cpuid}.bin', 'rb') as f:
            while True:
                # Read 32 bytes event
                event_bytes = f.read(32)
                values = [int.from_bytes(event_bytes[i:i+8], byteorder='little', signed=False) for i in range(0, 32, 8)]
                if not event_bytes:
                    break
                events.append(Event(cpuid, values))
            total_count = len(events)

    except:
        break
    print(f'cpu {cpuid} is done')
    cpuid += 1

func_name_dict = parse_file_to_dict("./func-name-0.txt")
fgraph.func_name_dict_set(func_name_dict)

events.sort(key=lambda x: x.entry_time)
for event in events:
    fgraph.append(event.cpuid, event)
# Sort the records in fgraph.records by timestamp
fgraph.records.sort(key=lambda x: x.timestamp)
    
# All in One
with open('fgraph.txt', 'w') as f:
    # Write the sorted records to file
    for record in fgraph.records:
        record:FGraphRecord
        f.write(record.record_str)

