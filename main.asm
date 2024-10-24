.386
.model flat,stdcall
include irvine32.inc
.data
q1r db "Enter row for printing star",0
q1 db "Enter ols for printing star",0
rows db ?
ols db ?

;Question no2
q2c db "Enter front color",0Ah,"Enter 0 for black" ,0Ah,"Enter 1 for black" ,0Ah,	 "Enter 2 for black" ,0Ah,"Enter 3 for black",0Ah,	 "Enter 4 for black",0Ah,  "Enter 5 for black",0Ah,	 "Enter 6 for black",0Ah,    "Enter 7 for black",0Ah, "Enter 8 for black",0Ah,"Enter 9 for black",0Ah,"Enter 10 for black",0Ah,"Enter 11 for black",0Ah,"Enter 12 for black",0Ah,"Enter 13 for black",0Ah,"Enter 14 for black",0

q2b db "Enter back color",0Ah,"Enter 0 for black" ,0Ah,"Enter 1 for black" ,0Ah,	 "Enter 2 for black" ,0Ah,"Enter 3 for black",0Ah,	 "Enter 4 for black",0Ah,  "Enter 5 for black",0Ah,	 "Enter 6 for black",0Ah,    "Enter 7 for black",0Ah, "Enter 8 for black",0Ah,"Enter 9 for black",0Ah,"Enter 10 for black",0Ah,"Enter 11 for black",0Ah,"Enter 12 for black",0Ah,"Enter 13 for black",0Ah,"Enter 14 for black",0
front db ?
back db ?

;Question No3:
rows3 db ?
ols3 db ?

q3r db "Enter row for printing line",0
q3z db "Enter ols for printing line",0
q3c db "Enter color for text",0Ah,"Enter 0 for black" ,0Ah,"Enter 1 for black" ,0Ah,	 "Enter 2 for black" ,0Ah,"Enter 3 for black",0Ah,	 "Enter 4 for black",0Ah,  "Enter 5 for black",0Ah,	 "Enter 6 for black",0Ah,    "Enter 7 for black",0Ah, "Enter 8 for black",0Ah,"Enter 9 for black",0Ah,"Enter 10 for black",0Ah,"Enter 11 for black",0Ah,"Enter 12 for black",0Ah,"Enter 13 for black",0Ah,"Enter 14 for black",0
textcolor db ?
line db"This is the line of question no 3",0


;Question no4
length4 db ?
width4 db ?
x4 db ?
y4 db ?
l4 db ?
w4 db ?
c4 db ?
cf4 db ?

q4l db "Enter length of retangle",0
q4w db "Enter widhth of retangle",0
q4z db "Enter color of retangle",0
q4z2 db "Enter filled olor of retangle",0
q4r db "Enter x coordinate of retangle",0
q4rr db "Enter y coordinate of retangle",0
reline db "-",0
reeline db"|",0
temp db 0
.code





main proc

;call QuestionNo1
;call crlf
;call QuestionNo2
;call crlf
;call QuestionNo3
;call crlf
call QuestionNo4

	main endp
	INVOKE EXITprocess,0
	
	QuestionNo2 proc
mov edx,offset q2c
call writestring
call readint
mov front,al


mov edx,offset q2b
call writestring
call readint
mov back,al
mov ebx,0
mov edx,0
mov bl,front
mov dl,back

imul edx,16
add ebx,edx
mov eax,ebx
call clrscr 
call gotoxy
call settextcolor
call gotoxy
mov al,'*'
call writechar
ret
QuestionNo2 endp


QuestionNo1 proc

mov edx,offset q1r
call writestring
call readint
mov rows, al
mov edx,offset q1
call writestring
call readint
mov ols,al

mov dh,rows
mov dl,ols
call gotoxy
mov al,'*'
call writechar
ret
QuestionNo1 endp

QuestionNo3 proc

mov edx,offset q3r
call writestring
call readint
mov rows3,al

mov edx,offset q3z
call writestring
call readint
mov ols3,al

mov edx,offset q3c
call writestring
call readint
mov textcolor,al

mov ebx,0
mov edx,0
mov bl,textcolor


imul edx,16
add ebx,edx
mov eax,ebx

call settextcolor
mov dl,rows3
mov dh,ols3
call gotoxy
call settextcolor

mov edx,offset line
call writestring

QuestionNo3 endp

QuestionNo4 proc
mov edx,offset q4r
call writestring
call readint
mov x4,al

mov edx,offset q4rr
call writestring
call readint
mov y4,al

mov edx,offset q4l
call writestring
call readint
mov l4,al

mov edx,offset q4w
call writestring
call readint
mov w4,al

mov edx,offset q4z
call writestring
call readint
mov c4,al

mov edx,offset q4z2
call writestring
call readint
mov cf4,al

mov dl,x4
mov dh,y4
call gotoxy 



mov edx,offset reline
call writestring
mov ecx,0
mov cl,l4 

loop1:
inc dl
inc dh
call gotoxy
mov edx,offset reline
call writestring

loop loop1






mov edx,offset reeline
call gotoxy
add y4,1
call writestring
mov ecx,0
mov cl,l4 
loop2:

inc dh
call gotoxy
mov edx,offset reeline
call writestring

loop loop2



comment @
add y4,al

loop2:
inc dl
inc dh
call gotoxy
mov edx,offset reline
call writestring
loop loop2

@

QuestionNo4 endp

	end main