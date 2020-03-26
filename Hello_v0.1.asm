; non operand instruction -> 1byte
; register instruction -> 2byte
; memory address with register instruction -> 4byte
; immediate with register:8 instruction -> 2byte
; immediate with register:16 instruction -> 3byte
; immediate(byte) with memory address instruction -> 6byte
; immediate(word) with memory address instruction -> 7byte
; jump instruction segment internal short -> 2byte
; jump instruction segment internal near -> 3byte
; jump instruction segment external -> 5byte

mov ax, 0xb800 ;3
mov es, ax ;2

; 7 * 12 = 84
mov word [es:0x00], 0x0F48 ; 'H'
mov word [es:0x02], 0x0F65 ; 'e'
mov word [es:0x04], 0x0F6C ; 'l'
mov word [es:0x06], 0x0F6C ; 'l'
mov word [es:0x08], 0x0F6F ; 'o'
mov word [es:0x0A], 0x0F20 ; ' '
mov word [es:0x0C], 0x0F57 ; 'W'
mov word [es:0x0E], 0x0F6F ; 'o' 
mov word [es:0x10], 0x0F72 ; 'r'
mov word [es:0x12], 0x0F6C ; 'l'
mov word [es:0x14], 0x0F64 ; 'd'
mov word [es:0x16], 0x0F21 ; '!'

label: jmp near label ;3

; 3 + 2 + 84 + 3 = 92
; 510 - 80 = 418
times 418 nop

db 0x55,0xaa
