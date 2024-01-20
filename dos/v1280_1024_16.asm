section .data
    VbeSignature   dw  0x4242    ; 'BB'
    VbeVersion     dw  0x0300    ; VBE version 3.0
    VbeFarPtr      dd  0         ; reserved
    OemStringPtr   dd  oem_msg   ; String far ptr seg:off
    Capabilities   dd  1<<0      ; use linear frame buffer
    VideoModePtr   dd  VideoModes ; Pointer to list of modes
    TotalMemory    dw  0         ; Total memory in 64K blocks

oem_msg db 'VESA BIOS DRIVER',0

section .bss
    buffer resw 1280*1024       ; Allocate buffer for 1280x1024 pixels

section .text
    global _start

_start:
    mov ax, 4f02h        ; Set VBE mode
    mov bx, 411h         ; 411h=1280x1024 16bpp
    int 10h

    ; Clear the screen
    mov edi, buffer      ; Destination address (screen buffer)
    mov eax, 1           ; Clear value (black)
    mov ecx, 1280*1024/2 ; Number of words to clear
    rep stosw            ; Clear screen

    ; Draw something on the screen
    ; ...

    ; Halt the CPU
;    hlt
	mov  ah, 00h          ; BIOS.GetKeystroke
	int  16h              ; -> AX
	mov  ax, 03h        ; BIOS.SetVideoMode 80x25 text
	int  10h

	int 0x20
VideoModes:
    dw  0xFFFF, 0x0000    ; End of list