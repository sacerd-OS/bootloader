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

clear_screen: 
  pusha
  mov ah, 0x00
  mov al, 0x03
  int 0x10
  popa
  ret