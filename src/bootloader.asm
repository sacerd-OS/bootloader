; ; bootsector prog that loops forever
bits 16
org 0x7c00
; prettify
call clear_screen

; hello squirrel
mov si, HELLO_SQUIRREL
call print_str

; hang forever
loop: 
jmp loop

; string printer function
print_str:
    pusha
    xor bx,bx

    loopy:
    mov al, byte[si + bx]
    test al, al
    jz end_str
    mov ah, 0x0e
    int 0x10

    inc bx
    jmp loopy

    end_str:
    popa
    ret

; clear screen
clear_screen: 
  pusha
  mov ah, 0x00
  mov al, 0x03
  int 0x10
  popa
  ret

; data
HELLO_SQUIRREL: db "Hello, squirrel . . .",13,10, "by little augustcats x3", 0

; padding / magic no
times 510 - ($ - $$) db 0 ; fill with 0s

dw 0xaa55 ; magic number