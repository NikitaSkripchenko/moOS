;infinite loop to boot the system
loop:
    jmp loop 

; Fill with 510 zeros minus the size of the previous code tell our compiler to pad out our
; program with enough zero bytes (db 0) to bring us to the ; 510th byte.
times 510-($-$$) db 0
; Magic number
dw 0xaa55 