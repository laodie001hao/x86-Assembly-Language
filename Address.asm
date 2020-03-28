jmp near _start

Prefix db '0', 'x'
Addr db \
    0, 1, 2, 3, 4
    
_start:
    
    mov ax, 0x07C0
    mov ds, ax
    mov ax, 0xB800
    mov es, ax
    
    mov ax, Addr
    mov bx, ax
    mov si, 0x10
    mov di, 0x04
    mov cx, 0x05
ToHEX:
    xor dx, dx
    div si
    mov [bx+di], dl
    dec di
    loop ToHEX
    
    
    mov si, 0x00
    mov di, 0x00
    mov bx, Prefix
    cld
    mov cx, 0x01    
PrintStr:
    mov al, [ds:bx+si]
    mov ah, 0x0F
    mov [es:di], ax
    add si, 0x01
    add di, 0x02
    dec cx
    jns PrintStr
    
    cld
    mov cx, 0x04    
PrintNum:
    mov al, [ds:bx+si]
    add al, 0x30
    mov ah, 0x0F
    mov [es:di], ax
    add si, 0x01
    add di, 0x02
    dec cx
    jns PrintNum
    
    jmp near $
    
    times 510-($-$$) nop
    
    db 0x55, 0xAA
