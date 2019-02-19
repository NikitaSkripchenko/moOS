; The formula for accessing a specific character on the 80x25 grid is:0xb8000 + 2 * (row * 80 + col)

[bits 32]
; Define some constants 
VIDEO_MEMORY equ 0xb8000
WHITE_ON_BLACK equ 0x0f
; prints a null-terminated string pointed to by EDX
print_string_pm:
    pusha
    mov edx, VIDEO_MEMORY ; Set edx to the start of vid mem.

print_string_pm_loop:
    mov al, [ebx] ; Store the char at EBX in AL 
    mov ah, WHITE_ON_BLACK ; Store the attributes in AH

    cmp al, 0 
    je print_string_pm_done

    mov [edx], ax
    add ebx, 1
    add edx, 2
; if (al == 0), at end of string, so ; jump to done
; Store char and attributes at current
; character cell.
; Increment EBX to the next char in string. ; Move to next character cell in vid mem.
    jmp print_string_pm_loop ; loop around to print the next char.

print_string_pm_done :
    popa
    ret ; Return from the function