	org  100h
	mov  ax, 4F02h        ; VESA.SetVideoMode
	mov  bx, 4115h        ; 32-bit 800x600 graphics
	mov  bx, 110h        ; 4-bit 1024*768 graphics
	int  10h              ; -> AX
	cmp  ax, 004Fh
	jne  Abort
;	call Draw32bit
	call Draw16
	mov  ah, 00h          ; BIOS.GetKeystroke
	int  16h              ; -> AX
	mov  ax, 0003h        ; BIOS.SetVideoMode 80x25 text
	int  10h
Abort:
	mov  ax, 4C00h        ; DOS.Terminate
	int  21h

Draw32bit:
	mov  cx, 800*80
;	mov  es, c000h
	mov  eax, 0C0000000h - (800+720)*4
;	mov  ebx, 800*4-36
.a:
	mov  dword [eax], 00ff0000h    ; 0RGB
;	mov  dword [0C0000000h+eax], 00ff0000h    ; 0RGB
;	mov  dword [0C0000000h+ebx], 0000ff00h    ; 0RGB
;	add  eax, 800*4
;	add  ebx, 800*4-4
	add  eax, 4
	loop .a
	ret

Draw16:
	mov  cx, 800
	mov  eax, 0C0000000h ;- (800+720)*4
.a:
	mov  dword [eax], 3h    ; 0RGB
	add  eax, 1
	loop .a
	ret
