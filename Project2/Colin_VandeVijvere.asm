;name:Colin Vande Vijvere
;auburn handle: ccv0004
;email: ccv0004@auburn.edu
;Project Name:Colin_VandeVijvere.asm 
;Only sources used are the class material
;*******************************************

.386
.model flat,stdcall
.stack 4096 
ExitProcess proto,dwExitCode:dword
;Setup the input array and the shift variable
.data
input byte 1,2,3,4,5,6,7,8 
shift byte 2 
.code

main proc 
	; clear up the registers to make sure there is no old values inside them 
	mov EAX, 0
	mov EBX, 0
	mov ECX, 0
	mov EDX, 0


	; Setup EAX register with first and second values from the input array 
	mov AH, input
	add AH, shift
	mov AL, [input + 1]
	add AL, shift



	; Setup EBX register with 3rd and 4th values from the input array
	mov BH, [input + 2]
	add BH, shift
	mov BL, [input + 3]
	add BL, shift



	; Setup ECX register with 5th and 6th values from the input array
	mov CH, [input + 4]
	add CH, shift
	mov CL, [input + 5]
	add CL, shift


	; Setup EDX register with 7th and 8th values from the input array
	mov DH, [input + 6]
	add DH, shift
	mov DL, [input + 7]
	add DL, shift


; exit the program 
invoke ExitProcess, 0 
main endp 
end main