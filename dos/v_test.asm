; Assume that VESA BIOS extension is already loaded and initialized

mov ax, 4F00h         ; VBE function 4F00h: return VBE controller information
mov di, offset VbeInfo
int 10h              ; Call VBE BIOS function

cmp ax, 4Fh           ; Check if the function was successful
jne NotSupported      ; If not, display an error message and exit

mov ax, 4F01h         ; VBE function 4F01h: return mode information
mov cx, 1280          ; Width
mov dx, 1024          ; Height
mov bx, 103h          ; 32-bit color mode
mov di, offset ModeInfo
int 10h              ; Call VBE BIOS function

cmp ax, 4Fh           ; Check if the function was successful
jne NotSupported      ; If not, display an error message and exit

test bx, 80h          ; Check bit 7 of the ModeAttributes field (bit 7 indicates a supported mode)
jz NotSupported       ; If bit 7 is not set, the mode is not supported

; The display supports the requested mode (1280x1024, 32-bit color)
jmp Supported

NotSupported:
; The display does not support the requested mode
jmp Exit

Supported:
; The display supports the requested mode
; Add your code here

Exit: