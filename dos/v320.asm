
	mov ax, 0x0013	; 设置 VESA 模式 13h (320x240 分辨率，16 色)
;	mov ax, 0x0101	;640*480
	int 0x10

	; 在屏幕上画一个红色方块, 显存地址 es:di
	mov ax, 0xA000
	mov es, ax
	mov di, 0
	
	mov al, 0x04    ; 将 al 寄存器设置为红色的索引号
	mov bh, 0       ; 高位画面页面号（通常为 0）
	mov cx, 3200    ;
	rep stosb       ; save to es:di

	mov  ah, 00h          ; BIOS.GetKeystroke
	int  16h              ; -> AX
	mov  ax, 03h        ; BIOS.SetVideoMode 80x25 text
	int  10h

	int 0x20
