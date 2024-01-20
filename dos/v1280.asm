	org 0x7c00       ; 设置代码加载地址
	bits 16           ; 16 位实模式
start:
    mov ax, 0x4f02 ; 设置 VBE 模式
    mov bx, 0x4118 ; 设置 1280x1024 32-bit 颜色模式
    int	0x10       ; 调用 BIOS 中断
	mov  ah, 00h          ; BIOS.GetKeystroke
	int  16h              ; -> AX
	mov  ax, 03h        ; BIOS.SetVideoMode 80x25 text
	int  10h

	int 0x20

times 510 - ($ - $$) db 0 ; 填充 0，使代码长度为 510 字节
dw 0xaa55                 ; 512 字节的启动扇区标志