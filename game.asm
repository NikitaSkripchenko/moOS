mov ah, 0x0e
[org 0x7c00]
;#1 -- fails because we refer to the pointer
mov al, "1"
int 0x10
mov al, the_secret
int 0x10

;#2  -- fails without org directive vecause  BIOS places our bootsector binary at address 0x7c00
; and we need add padding// with org it is correct answer
mov al, '2'
int 0x10
mov al, [the_secret]
int 0x10

;++ adding padding, so now it works as well// with org it isnt working because we add padding twice
mov bx, the_secret
add bx, 0x7c00  ;need to use bx because register can't be used as source and destination for the same command
mov al, [bx]
int 0x10

;-- working, but we need to recalculate padding every time// still works with org
mov al, '4'
int 0x10
mov al, [0x7c29]
int 0x10

jmp $

the_secret:
    ; ASCII code 0x58 ('X')
    db "X"

;padding
jmp $
times 510 - ($-$$) db 0
dw 0xaa55
