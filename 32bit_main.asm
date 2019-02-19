; A boot sector that enters 32-bit protected mode.
[org 0x7c00]
    mov bp, 0x9000
    mov sp, bp
    mov bx, MSG_REAL_MODE
    call print
    call switch_to_pm
    jmp $

%include 'boot_sect_print.asm'
%include '32bit_printf.asm'
%include '32bit_switch.asm'
%include '32bit_gdt.asm'

[bits 32]
BEGIN_PM: ; after the switch we will get here
    mov ebx, MSG_PROT_MODE
    call print_string_pm ; Note that this will be written at the top left corner
    jmp $

MSG_REAL_MODE db "Started in 16-bit real mode", 0
MSG_PROT_MODE db "Loaded 32-bit protected mode", 0

; bootsector
times 510-($-$$) db 0
dw 0xaa55