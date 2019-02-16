[org 0x7c00]

mov bx, GREETINGS
call print

call print_nl

mov dx, 0x1e22
call print_hex

jmp $
; 

%include "boot_sect_print.asm"
%include "boot_sect_print_hex.asm"
GREETINGS:
    db "Hello, greedy world", 0

;

times 510 - ($-$$) db 0
dw 0xaa55
