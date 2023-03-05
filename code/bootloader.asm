; ; bootsector prog that loops forever
bits 16
org 0x7c00
; stack / set up
mov [BOOT_DRIVE], dl
mov bp, 0x8000
mov sp, bp


; prettify
call clear_screen

; load more data
mov bx, 0x9000
mov dh, 5 ; number of sectors
mov dl, [BOOT_DRIVE]
call disk_load

; hello squirrel
mov si, HELLO_SQUIRREL
call print_str

; hang forever
jmp $

%include "bootloader_include.asm"
%include "load_sector.asm"

; data
HELLO_SQUIRREL: db "In the beginning, God created machine. The machine existed barren",13,10, "void of software while the spirit of God lived in the electricity", 13,10,"God said, 'Let there be a bootloader'. And there was a bootloader", 13,10,"by little augustcats x3", 0
BOOT_DRIVE: db 0

; padding / magic no
times 510 - ($ - $$) db 0 ; fill with 0s

dw 0xaa55 ; magic number

times 256 dw 0 xdada
times 256 dw 0 xface