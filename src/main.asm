org 0x7C00
bits 16 ; <--- How much patience I have now, which I'm guessing will be lost. (March 23, 2025)
%define ENDL 0x0D, 0x0A
start:
    jmp main
puts:
    push si
    push ax
.loop:
    lodsb
    or al,al
    jz .done
    mov ah,0x0e
    mov bh,0
    int 0x10
    jmp .loop
.done:
    pop ax
    pop si
    ret
main:
    mov ax,0
    mov ds,ax 
    mov es,ax
    mov ss,ax
    mov sp,0x7C00
    mov si,msg_welcome
    call puts
    hlt
.halt:
    jmp .halt
msg_welcome: db "Welcome to WynnOS! [Version: a0.0.2]",ENDL,0
times 510-($-$$)db 0
dw 0AA55h