jmp near _start

Text db \
    'H', 0x0F, 'e', 0x0F, 'l', 0x0F, 'l', 0x0F, 'o', 0x0F, ' ', 0x0F,\
    'W', 0x0F, 'o', 0x0F, 'r', 0x0F, 'l', 0x0F, 'd', 0x0F, '!', 0x0F

_start:
    mov ax, 0x7C0
    mov ds, ax
    
    mov ax, 0xB800
    mov es, ax
    
    cld
    
    mov si, Text
    mov di, 0x00
    mov cx, _start-Text
    rep movsb
    
    jmp near $
    
    times 510-($-$$) nop
    
    db 0x55, 0xAA
