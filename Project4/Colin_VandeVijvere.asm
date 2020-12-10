; Author: Colin Vande Vijvere
; Student ID: ccv0004
; student email: ccv0004@auburn.edu	
; help received: none


.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data
    s1 byte "GARDEN"
    s2 byte "DANGER"
    c1 byte 26 dup(0)               
    c2 byte 26 dup(0)               
.code
    main proc
		mov eax, 0								;eax is 0, we assume they are not anagrams at the start
		mov ebx, 0								;set ebx to 0
		mov ecx, sizeof s1						;set ecx to size of s1
		
		cmp ecx, sizeof s2						;compare the length of the two anagrams
		JNE NoAnagram							;no anagram if the length of the two strings are different

		CounterLoop:                           ; iterate length of s1
			movzx edi, s1[ecx - 1]             ; move current letter from s1 into edi
			inc c1[edi - 65]                   ; make letter correct in ASCII terms
			movzx edi, s2[ecx - 1]             ; move current letter from s2 into edi
			inc c2[edi - 65]                   ; make letter correct in ASCII terms
		loop CounterLoop

		mov ecx, sizeof c1

		VerifyLoop:                            ; loop that compares s1 and s2
			mov bl, c1[ecx - 1]                ; mov c1 into bl
			cmp bl, c2[ecx - 1]                ; compare bl and c2
			JNE NoAnagram                          ; if bl and c2 aren't equal, jump to NoAnagram
		loop VerifyLoop

		mov eax, 1                             ; sets eax to 1, only hit if NoAnagram is not jumped to

		NoAnagram:                                 ; when the two strings are not an anagram, jump here
			invoke ExitProcess, 0

	main endp
end main