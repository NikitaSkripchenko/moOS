[bits 16]
switch_to_pm:
    cli ; 1. disable interrupts
    lgdt [gdt_descriptor] ; 2. load the GDT descriptor
    mov eax, cr0
    or eax, 0x1 ; 3. set 32-bit mode bit in cr0
    mov cr0, eax
    jmp CODE_SEG:init_pm ; 4. far jump by using a different segment

lgdt [gdt_descriptor]

mov eax, cr0 ; To make the switch to protected mode, we set ;
or eax , 0x1 ; The first bit of CR0 , a control register
mov cr0, eax ; Update the control register

jmp CODE_SEG:init_pm 

[bits 32]
; Initialise registers and the stack once in PM.
init_pm:
    mov ax, DATA_SEG
    mov ds, ax
    mov ss, ax
    mov es, ax 
    mov fs, ax 
    mov gs, ax

    mov ebp, 0x90000 ; stack pos
    mov esp, ebp

    call BEGIN_PM