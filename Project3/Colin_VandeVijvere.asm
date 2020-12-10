
;------ INFO --------------------------------------------------------------------------------
;Name: Colin Vande Vijvere
;AuburnID: ccv0004 
;Auburn email: ccv0004@auburn.edu
;date: 09/10/2020
;Description: program that takes an array, and outputs an array where the indexes have shifted n places.
;Help received: Used Josh Coward's method for debugging mentioned on Piazza

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data 
	shift dword 3 
	input byte 1, 2, 3, 4, 5, 6, 7, 8
	output byte lengthof input dup(?)


.code
	main proc

		mov EAX, 0
		mov EBX, 0 
		mov ECX, 0 

		mov ECX, LENGTHOF input ;ECX = length of the input array
		sub ECX, shift			; ECX = ECX - shift
		mov ESI, OFFSET input   ; Store address of input in ESI
		mov EDI, OFFSET output	; Store address of output in EDI
		add EDI, shift			; address of EDI + 3

	L1:
		mov AL, [ESI] ;Move the value from input to al
		mov [EDI], AL ;Move the value from al into output
		add EDI, 1 ;increment EDI
		add ESI, 1 ;increment ESI
	loop L1

		mov ECX, shift ;This loop will iterate 'shift'-times
		mov EDI, OFFSET output ;points back at the first index of output array
		
	L2:
		mov al, [ESI] ;Move the values from input into al
		mov [EDI], AL ;Move the value from al into output index
		add ESI, 1 ;Increment the input index
		add EDI, 1 ;Increment the output index
	loop L2

		invoke ExitProcess, 0
	 main endp
end main