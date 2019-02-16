; receiving data in dx (dx = 0x1234)
print_hex:
    pusha
    mov cx, 0
; and instruct == binary AND
; shr instruct == shift right
; je == jump if equal
; jle == jump when less than or equal to)
;
; Numeric ASCII values: '0' (ASCII 0x30) to '9' (0x39), so just add 0x30 to byte N.
; For alphabetic characters A-F: 'A' (ASCII 0x41) to 'F' (0x46) we'll add 0x40
; while (string[i] != 0) { print string[i]; i++ }

print_loop:
    cmp cx, 4; 4 loops
    je end2

    mov ax, dx
    and ax, 0x00f; masking first three 
    add al, 0x30; add 0x30 to N to convert it to ASCII "N"
    cmp al, 0x39; if > 9 add extra 8 bits to represent A to F
    jle start2
    add al, 7

start2:
    ; 2. get the correct position of the string to place our ASCII char
    ; bx <- base address + string length - index of char
    mov bx, HEX_OUT + 5
    sub bx, cx
    mov [bx], al
    ror dx, 4

    add cx,1
    jmp print_loop

end2:
    mov bx, HEX_OUT
    call print
    popa
    ret

HEX_OUT:
    db '0x0000', 0 ; reserve memory

