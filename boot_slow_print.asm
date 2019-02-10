;simple print on the screen and move the cursor

mov ah, 0x0e ;scrolling teletype BIOS routine

mov al, 'H'
int 0x10    ;0x10 is interrupt for screen related devices
mov al, 'e'
int 0x10
mov al, 'l'
int 0x10
int 0x10
mov al, 'o'
int 0x10
mov al, ','
int 0x10
mov al, ' '
int 0x10
mov al, 'G'
int 0x10
mov al, 'r'
int 0x10
mov al, 'e'
int 0x10
int 0x10
mov al, 'd'
int 0x10
mov al, 'y'
int 0x10

;padding
jmp $
times 510 - ($-$$) db 0
dw 0xaa55
