print:
    pusha


; while (string[i] != 0) { print string[i]; i++ }

start1:
    mov al, [bx]
    cmp al, 0

    je end1

    mov ah, 0x0e
    int 0x10

    add bx, 1
    jmp start1


end1:
    popa
    ret

print_nl:
    pusha
    mov ah, 0x0e
    mov al, 0x0a ; \n
    int 0x10
    mov al, 0x0d
    int 0x10

    popa 
    ret 
