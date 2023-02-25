; ; bootsector prog that loops forever
bits 16
org 0x7c00
; stack
mov bp, 0x8000
mov sp, bp

; prettify
call clear_screen

; hello squirrel
mov si, HELLO_SQUIRREL
call print_str

; hang forever
loop: 
jmp loop

%include "bootloader_include.asm"

; data
HELLO_SQUIRREL: db "In the beginning, God created machine. The machine existed barren",13,10, "void of software while the spirit of God lived in the electricity", 13,10,"God said, 'Let there be a bootloader'. And there was a bootloader", 13,10,"by little augustcats x3", 0

; padding / magic no
times 510 - ($ - $$) db 0 ; fill with 0s

dw 0xaa55 ; magic number