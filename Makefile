object:
	as -arch arm64 -o bootloader.o bootloader.s

exec_link:
	ld -arch arm64 -lSystem -syslibroot `xcrun -sdk macosx --show-sdk-path` -e _start -o bootloader.elf bootloader.o 

exec_objcopy:
	objcopy -O binary bootloader.elf bootloader.bin

exec_objdump:
	objdump -d bootloader.elf > bootloader.dump