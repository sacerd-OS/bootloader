nasm bootloader.asm -f bin -o bootloader.bin 
printf "assembly compiled\nprinting binary (little endian)...\n"
od -t x1 -A n bootloader.bin