%include "../lib/stud_io.inc"
global _start

section .data
string db "This is a string", 0	; string

section .text
_start:	mov esi, string		; address of begin string
	mov ecx, 0		; string len
	
	cmp byte [esi],	0	; loop begin
	jz quiet		
lp:	push dword [esi]	; loop body, push in stack a char
	inc esi			; increase address
	inc ecx			; increase string len
	cmp byte [esi], 0	; condition
	jnz lp

lp2:	pop eax			; loop reverse string begin, pop char from stack
	PUTCHAR al		; print char
	loop lp2		; condition for jump

quiet:	FINISH
