jmp near _start

Text db \
    'H', 0x0F, 'e', 0x0F, 'l', 0x0F, 'l', 0x0F, 'o', 0x0F, ' ', 0x0F,\
    'W', 0x0F, 'o', 0x0F, 'r', 0x0F, 'l', 0x0F, 'd', 0x0F, '!', 0x0F

_start:
    mov ax, 0x7C0
    mov ds, ax              ;数据传送默认源寄存器
    
    mov ax, 0xB800
    mov es, ax              ;数据传送默认目的寄存器
    
    cld
    
    mov si, Text            ;源变址寄存器
    mov di, 0x00            ;目的变址寄存器
    mov cx, _start-Text     ;数据传送次数
    rep movsb
    
    jmp near $              ;“$”当前相对地址
    
    times 510-($-$$) nop    ;“$$”起始相对地址
    
    db 0x55, 0xAA
