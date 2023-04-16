
# Create an empty dictionary to store the objects
objects_dict = {}
total_count = 0
# Open the symtbl.txt file and read the objects
with open('/home/rtthread-smart/kernel/bsp/qemu-virt64-aarch64/entries.log', 'r') as f:
    for line in f:
        # Split the line into the three fields
        address, name = line.strip().split()
        address = int(address, base=16)
        objects_dict[address] = {'name': name}

cpuid = 0
while True:
    try:
        # Open the logging.txt file and read the addresses
        with open(f'/home/rtthread-smart/kernel/bsp/qemu-virt64-aarch64/logging-{cpuid}.txt', 'rb') as f:
            addresses = []
            while True:
                address = f.read(8)
                if not address:
                    break

                # Convert the address to a heximal value in little endian
                address = int.from_bytes(address, byteorder='little', signed=False)
                addresses.append(address - 12)
            total_count = len(addresses)

            # Loop through the addresses and count their occurrence
            for address in addresses:
                if address in objects_dict:
                    objects_dict[address]['count'] = objects_dict[address].get('count', 0) + 1
                else:
                    print(f'corrupted record {address:x}')

        # Open a new file called "objects_with_counts.txt" and write the objects with their counts
        with open(f'objects_with_counts-{cpuid}.txt', 'w') as f:
            # Sort the objects_dict by count in descending order
            sorted_objects = sorted(objects_dict.items(), key=lambda x: x[1].get('count', 0), reverse=True)
            for address, obj in sorted_objects:
                # Calculate the percentage of count in total
                percentage = obj.get('count', 0) / total_count * 100
                # Write the address, character, name, count, and percentage to the file
                f.write(f"{address:x} {obj['name']} {obj.get('count', 0)} {percentage:.2f}%\n")

            # Reset the count for each object in objects_dict to 0
            for obj in objects_dict.values():
                obj['count'] = 0
    except:
        break
    cpuid += 1
