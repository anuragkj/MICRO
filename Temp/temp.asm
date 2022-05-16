











































;to add two 2-digit hexadecimal numbers 
available in memory and store the result in memory.
DATA SEGMENT
ORG 1000H
NUM1 DB 89H
NUM2 DB 7CH
RES DW ?
DATA ENDS
CODE SEGMENT
ASSUME CS: CODE, DS: DATA
START:
MOV AX,DATA
MOV DS,AX
MOV AH,0
MOV AL, NUM1
ADD AL,NUM2
ADC AH,0
MOV RES,AX
INT 3
CODE ENDS
END START

;to add two multi-byte binary numbers stored in 
memory and also store the result in memory.
   
.MODEL SMALL
.STACK 20
.DATA
Org 1000H
NUM1 DB 25H,35H,45H,32H,56H,98H,76H,76H
NUM2 DB 90H,56H,43H,75H,89H,10H,34H,22H
ANS DB 10 DUP (?)

COUNT DW 8H
.CODE
START:
MOV AX,@DATA
MOV DS,AX
MOV CX,COUNT
MOV SI,0H
CLC
REPEAT:
MOV AL,NUM1[SI]
ADC AL,NUM2[SI]
MOV ANS[SI], AL
INC SI
LOOP REPEAT
INT 3
END START

;to subtract two multi-byte binary numbers stored in 
memory and also store the result in memory.
.MODEL SMALL
.STACK 20
.DATA
Org 1000H
NUM1 DB 89H,35H,45H,32H,56H,98H,76H,76H
NUM2 DB 32H,56H,43H,75H,89H,10H,34H,22H
ANS DB 9 DUP (0)

COUNT DW 8H
.CODE
START:
MOV AX,@DATA
MOV DS,AX
MOV CX,COUNT
MOV SI,0H
CLC
REPEAT:
MOV AL,NUM1[SI]
SBB AL,NUM2[SI]
MOV ANS[SI], AL
INC SI
LOOP REPEAT
INT 3
END START


;to multiply two 8-bit binary numbers stored in memory and also store the 
result in memory (both unsigned and signed operation).   
.MODEL SMALL
.STACK 20
.DATA
Org 1000H
N1 DB 35H
N2 DB 82H
Un_Sign_PROD DW ?
Sign_PROD DW ?
.CODE
START:
MOV AX,@DATA
MOV DS,AX
MOV AL, N1
MUL N2
MOV Un_Sign_PROD, AX
MOV AL,N1
IMUL N2
MOV Sign_PROD, AX
INT 3
END START

;to find factorial of number.

DATA SEGMENT
ORG 1000H
N DW 5
RES DW ?
DATA ENDS
CODE SEGMENT
ASSUME CS:CODE, DS:DATA
START: MOV AX,DATA
       MOV DS,AX
       MOV AX,N
       MOV CX,AX
       DEC CX
BACK: MUL CX
      DEC CX
      JNZ BACK
      MOV RES,AX
      INT 3
CODE ENDS
END START

;Write a program to add an array of eight 2-digit hexadecimal 
numbers stored in memory and store the result in memory.
.MODEL SMALL
.STACK 20
.DATA
ORG 1000H
NUM DB 25H, 35H, 45H, 32H, 56H, 98H, 76H, 76H
SUM DW ?
COUNT DW 0008H
.CODE
START:
MOV AX, @DATA
MOV DS, AX
MOV CX, COUNT
MOV SI, 0000H
MOV AX, 0000H
REPEAT:
ADD AL, NUM[SI]
JNC NEXT
ADD AH, 01
NEXT:
INC SI
LOOP REPEAT
MOV SUM, AX
INT 3
END START

;Write a program to count number of occurrences of the byte 25H in the 
given array of 16-bytes stored starting from 1200H. Also store the result in
1220H memory location.
.MODEL SMALL
.STACK 20
.DATA
ORG 1200H
ARRAY DB 25H, 35H, 45H, 32H, 56H, 25H, 76H, 76H, 28H, 56H, 05H, 35H, 25H, 00H, 98H, 21H
ORG 1220H
RES DB ?
COUNT DW 0010H
.CODE
START:
MOV AX, @DATA
MOV DS, AX
MOV CX, COUNT
MOV SI, 0000H
MOV AL, 25H
REPEAT:
CMP AL, ARRAY[SI]
JNE NEXT
INC RES
NEXT:
INC SI
LOOP REPEAT
INT 3
END START

;Write a program to exchange two data blocks of length 10-bytes stored in
memory starting from 1200H and 1220H respectively.
.MODEL SMALL
.STACK 20
.DATA
ORG 1200H
ARRAY1 DB 05H, 15H, 25H, 35H, 45H, 55H, 65H, 75H, 85H, 95H
ORG 1220H
ARRAY2 DB 0A1H, 0A2H, 0A3H, 0A4H, 0A5H, 0A6H, 0A7H, 0A8H, 0A9H, 0AAH
COUNT DW 000AH
.CODE
START:
MOV AX, @DATA
MOV DS, AX
MOV CX, COUNT
MOV SI, 0000H
REPEAT:
MOV AL, ARRAY1[SI]
XCHG AL, ARRAY2[SI]
MOV ARRAY1[SI], AL
INC SI
LOOP REPEAT
INT 3
END START

;Write a program to arrange the given array of 8-bit binary numbers stored in the
memory in ascending order.
.MODEL SMALL
.STACK 20
.DATA
ORG 1200H
ARRAY1 DB 05H, 15H, 25H, 35H, 45H, 55H, 65H, 75H, 85H, 95H
ORG 1220H
ARRAY2 DB 0A1H, 0A2H, 0A3H, 0A4H, 0A5H, 0A6H, 0A7H, 0A8H, 0A9H, 0AAH
COUNT DW 000AH
.CODE
START:
MOV AX, @DATA
MOV DS, AX
MOV CX, COUNT
MOV SI, 0000H
REPEAT:
MOV AL, ARRAY1[SI]
XCHG AL, ARRAY2[SI]
MOV ARRAY1[SI], AL
INC SI
LOOP REPEAT
INT 3
END START

;Write a program to count and separate ODD and EVEN numbers in the given
array of 8-bit binary numbers stored in the memory and also store the count separately.
.model small
.stack 20
.data
org 1000h
num db 01h, 02h, 03h, 04h, 05h, 06h, 07h, 08h, 09h
count dw 09h
even_arr db 9 dup(0)
odd_arr db 9 dup(0)
even_count db 0
odd_count db 0
.code
start:
mov ax, @data
mov ds, ax
mov si, offset num
mov di, offset even_arr
mov cx, count
repeat:                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
mov bl, [si]
ror bl, 01
jc continue
add even_count, 01h
rol bl, 01
mov [di], bl
inc di
continue:
inc si
loop repeat
the_next_part:
mov si, offset num
mov di, offset odd_arr
mov cx, count
repeat_two:                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
mov bl, [si]
ror bl, 01
jnc continue_two
add odd_count, 01h
rol bl, 01
mov [di], bl
inc di
continue_two:
inc si
loop repeat_two
int 3
end start

;Write a program to convert 4-digit BCD number to HEXADECIMAL number
and store the result in memory.
.MODEL SMALL
.STACK 20
.DATA
ORG 1000H
BCD DW 1234H
HEX DW 0
.CODE
START:
MOV AX, @DATA
MOV DS, AX
MOV AX, 0000H
MOV BX, 0001H
CALL BCD2BIN
MOV BX, 000AH
CALL BCD2BIN
MOV BX, 0064H
CALL BCD2BIN
MOV BX, 03E8H
CALL BCD2BIN
INT 3
BCD2BIN PROC NEAR
MOV AX, BCD
AND AX, 00FH
MUL BX
ADD HEX, AX
MOV CL, 04
ROR BCD, CL
RET
BCD2BIN ENDP
END START

;Write a program to convert the given HEXADECIMAL digit to ASCII byte and
store the result in memory.
.MODEL SMALL
.STACK 20
.DATA
ORG 1000H
Hex_Digit DB 38H
ASCII DB ?
.CODE
START:
MOV AX,@DATA
MOV DS,AX
MOV AL,Hex_Digit
CMP AL, 3AH
JC SUB30
SUB AL, 07H
SUB30:
SUB AL,30H
MOV ASCII, AL
INT 3
END START

; Write a program to display the hexadecimal byte 45H on the screen using
DOS interrupts.
.MODEL SMALL
.STACK 20
.CODE
START:
MOV AL, 45H
MOV BL, AL
AND AL, 0F0H
ROR AL, 4
CALL HEXASC
MOV DL, AL
MOV AH,02
INT 21H
MOV AL, BL
AND AL, 0FH
CALL HEXASC
MOV DL, AL
MOV AH, 02H
INT 21H
MOV AH, 4CH
INT 21H
HEXASC:
CMP AL, 0AH
JB NUM
ADD AL, 07
NUM:
ADD AL, 30H
RET
END START

;Write a program to input two single-digit hex numbers from keyboard and
display their product on the screen.
.MODEL SMALL
.STACK 20
.CODE
START:
CALL READKB
MOV BL,AL
CALL NXTLINE
CALL READKB
MUL BL
MOV BL, AL
CALL NXTLINE
CALL DISP
MOV AH, 4CH
INT 21H
READKB PROC NEAR
MOV AH, 01
INT 21H
CALL ASCHEX
RET
READKB ENDP
ASCHEX PROC NEAR
CMP AL, 3AH
JC SUB30
SUB AL, 07H
SUB30:
SUB AL, 30H
AND AL, 0FH
RET
ASCHEX ENDP
NXTLINE PROC NEAR
MOV AH, 2
MOV DL, 0AH
INT 21H
MOV DL, 0DH
INT 21H
RET
NXTLINE ENDP
DISP PROC NEAR
MOV AL, BL
AND AL, 0F0H
ROR AL, 4
CALL HEXASC
MOV DL, AL
MOV AH, 02
INT 21H
MOV AL, BL
AND AL, 0FH
CALL HEXASC
MOV DL, AL
MOV AH, 02
INT 21H
RET
DISP ENDP
HEXASC PROC NEAR
CMP AL, 07
NUM:
ADD AL, 30H
RET
HEXASC ENDP
END START

;Write a program to accept a character from keyboard and display its ASCII
equivalent value on the screen.
.MODEL SMALL
GETCHAR MACRO
MOV AH,01H
INT 21H
ENDM
PUTCHAR MACRO CHAR
MOV AH,02H
MOV DL,CHAR
INT 21H
ENDM
PRINTF MACRO MSG
MOV AH,09H
LEA DX,MSG
INT 21H
ENDM
.DATA
MSG1 DB "ENTER A CHARACTER:$"
MSG2 DB "",10,13,"ASCII VALUE--$" 
X DB 12
Y DB 34
.CODE
MOV AX,@DATA
MOV DS,AX
PRINTF MSG1
GETCHAR
MOV BH,AL 
MOV BL,AL
AND BL,0FH 
CMP BL,0AH
JL L1
ADD BL,07H
 L1: ADD BL,30H 
AND BH,0F0H 
MOV CL,04
SHR BH,CL
CMP BH,0AH
JL L2
ADD BH,07H
L2:ADD BH,30H 
PUSH BX 
MOV DH,X
MOV DL,Y 
MOV AH,02H
INT 10H 
PRINTF MSG2
POP BX 
PUTCHAR BH 
PUTCHAR BL                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
MOV AH,4CH 
INT 21H
CLS PROC NEAR
MOV AH,0FH 
INT 10H
MOV AH,00H 
INT 10H
RET
CLS ENDP
END

;Write a program to transfer the given string from source to destination
using string instruction and also display the destination string.
.MODEL SMALL
.STACK 20
.DATA
SRCSTR DB'ELECTRONICS'
LEN DW $-SRCSTR
MSG DB 'The Transferred String='
DSTSTR DB 40 DUP('$')
.CODE
START:
MOV AX, @DATA
MOV DS, AX
MOV ES, AX
MOV CX, LEN
LEA SI, SRCSTR
LEA DI, DSTSTR
CLD
REP MOVSB
LEA DX, MSG
MOV AH, 09
INT 21H
MOV AH, 4CH
INT 21H
END START

;Write a program to read two digit decimal number using keyboard and
search whether the number is present in an array or not. Display suitable
message.
   
.MODEL SMALL
.STACK 20
.DATA
ARRAY DB 35H, 56H, 82H, 89H, 90H, 23H, 12H, 51H, 88H
LEN DW $-ARRAY
MSG1 DB 0DH, 0AH, 'Enter two digit numbers: $'
MSG2 DB 0DH, 0AH, 'The number is present $'
MSG3 DB 0DH, 0AH, 'The number is not present $'
.CODE
START:
MOV AX, @DATA
MOV DS, AX
MOV ES, AX
MOV CX, LEN
LEA DX, MSG1
MOV AH, 09
INT 21H
CALL READKB
ROR AL, 4
MOV BL, AL
CALL READKB
ADD AL, BL
LEA DX, MSG2
LEA DI, ARRAY
CLD
REPNE SCASB
JE GO
LEA DX, MSG3
GO:
MOV AH, 09
INT 21H
MOV AH, 4CH
INT 21H
READKB PROC NEAR
MOV AH, 01
INT 21H
CMP AL, 3AH
JC SUB30
SUB AL, 07H
SUB30:
SUB AL, 30H
RET
READKB ENDP
END START

;P3. Write a program to read a string using DOS interrupts, reverse the entered
string and display the same on the screen. Use MACRO for display.
.MODEL SMALL
.STACK 20
DISP MACRO MSG
MOV AH, 09H
MOV DX, OFFSET MSG
INT 21H
ENDM
.DATA
MSG1 DB 0DH, 0AH, 'Input a string:$'
SRC DB 80
DB ?
DB 30 DUP (?)
MSG2 DB, 0DH, 0AH, 'The reversed string is:'
REV DB 30 DUP (?)
.CODE
START:
MOV AX, @DATA
MOV DS, AX
MOV ES, AX
DISP MSG1
MOV DX, OFFSET SRC
MOV AH, 0AH
INT 21H
MOV SI, OFFSET SRC+2
MOV DI, OFFSET REV-1
MOV CL, SRC+1
MOV CH, 00
ADD DI, CX
MOV BYTE PTR[DI+1],'$'
CLD
NEXT:
MOVSB
SUB DI, 0002
LOOP NEXT
DISP MSG2
MOV AH, 4CH
INT 21H
END START

;Write a program to search a character in the entered string. Display suitable
messages on the screen. Read both string and searching character using DOS
interrupts.
.MODEL SMALL
.STACK 100
PRINT MACRO MSG
MOV AH, 09
LEA DX, MSG
INT 21H
ENDM
.DATA
MSG1 DB 0DH, 0AH, 'Enter a string:$'
SRC DB 80
DB ?
DB 30 DUP (?)
MSG2 DB 0DH, 0AH, 'Enter a character:$'
MSG3 DB 0DH, 0AH, 'Character found$'
MSG4 DB 0DH, 0AH, 'Character not found$'
.CODE
START:
MOV AX, @DATA
MOV DS, AX
MOV ES, AX
PRINT MSG1
LEA DX, SRC
MOV AH, 0AH
INT 21H
PRINT MSG2
MOV AH, 01H
INT 21H
MOV CL, SRC+1
MOV CH, 00
LEA DI, SRC
ADD DI, 0002
CLD
REPNE SCASB
JE FOUND
PRINT MSG4
JMP EXIT
FOUND:
PRINT MSG3
EXIT:
MOV AH,4CH
INT 21H
END START

;Write a program to create a file and write text data into it using DOS
interrupts.
.MODEL SMALL
.STACK 20
PRINT MACRO MSG
MOV AH, 09H
LEA DX, MSG
INT 21H
ENDM
READ MACRO STR
LEA DX, STR
MOV AH, 0AH
INT 21H
ENDM
.DATA
MSG1 DB 0DH, 0AH, 'ENTER A FILENAME:$'
MSG2 DB 0DH, 0AH, 'FILE IS CREATED:$'
MSG3 DB 0DH, 0AH, 'ERROR IN FILE CREATION:$'
MSG4 DB 0DH, 0AH, 'ENTER A TEXT:$'
MSG5 DB 0DH, 0AH, 'ERROR IN FILE OPENING:$'
MSG6 DB 0DH, 0AH, 'ERROR IN WRITING:$'
MSG7 DB 0DH, 0AH, 'CREATING AND WRITING SUCCESSFUL:$'
FNAME DB 80
DB ?
DB 80 DUP(0)
TEXT DB 80
DB ?
DB 80 DUP(?)
.CODE
START:
MOV AX, @DATA
MOV DS, AX
MOV ES, AX
PRINT MSG1
READ FNAME
LEA SI, FNAME + 2
MOV CL, FNAME + 1
MOV CH, 00
ADD SI, CX
MOV BYTE PTR[SI], 00
LEA DX, FNAME + 2
MOV AH, 3CH
MOV CX, 0000H
INT 21H
JNC SUCC1
PRINT MSG3
JMP EXIT
SUCC1:
PRINT MSG2
PRINT MSG4
READ TEXT
MOV AH, 3DH
MOV AL, 02H
LEA DX, FNAME + 2
INT 21H
JNC SUCC2
PRINT MSG5
JMP EXIT
SUCC2:
MOV BX, AX
MOV AH, 40H
MOV CH, 00H
MOV CL, TEXT + 1
LEA DX, TEXT + 2
INT 21H
JNC SUCC3
PRINT MSG6
MOV AH, 3EH
INT 21H
JMP EXIT
SUCC3:
PRINT MSG7
EXIT:
MOV AH, 4CH
INT 21H
END START

;Write a program to read system time and display at the center of the screen
.MODEL SMALL
STACK 20
.DATA
MS DB "PRESENT TIME IS :$"
.CODE
START:
MOV AX, @DATA
MOV DS, AX
MOV AH, 00
MOV AL, 03H
INT 10H
MOV AH, 02
MOV BH, 0
MOV DH, 12
MOV DL, 30
INT 10H
LEA DX, MS
MOV AH, 09
INT 21H

MOV AH, 2CH
INT 21H
MOV AL, CH
CALL DISP
MOV DL,':'
MOV AH, 02
INT 21H
MOV AL, CL
CALL DISP
MOV DL,':'
MOV AH, 02
INT 21H
MOV AL, DH
CALL DISP
MOV AH, 02
MOV BH, 0
MOV DH, 24
MOV DL, 00
INT 10H
MOV AH, 4CH
INT 21H
DISP PROC NEAR
AAM
ADD AX, 3030H
MOV BX, AX
MOV DL, BH
MOV AH, 02
INT 21H
MOV DL, BL
MOV AH, 02
INT 21H
RET
ENDP
END START

;Write a program to read system date and display in this format DD-MM-
YEAR.
.MODEL SMALL
.STACK 20
PRINT MACRO MSG
MOV AH, 09H
MOV DX, OFFSET MSG
INT 21H
ENDM
.DATA
DAY DB ?,?,'-'
MONTH DB ?,?,'-'
YEAR DB ?,?,?,?,'$'
.CODE
START:
MOV AX, @DATA
MOV DS, AX
MOV ES, AX
MOV AH, 2AH
INT 21H
PUSH CX
PUSH DX
MOV AL, DL
LEA SI, DAY
MOV AH, 00H
CALL CONV
POP DX
MOV AL, DH
LEA SI, MONTH
MOV AH, 00H
CALL CONV
POP AX
LEA SI, YEAR
CALL CONV
PRINT DAY
MOV AH, 4CH
INT 21H
CONV PROC NEAR
MOV CX, 0000H
MOV BX, 000AH
NEXT:
MOV DX, 0000
DIV BX
ADD DL, 30H
PUSH DX
INC CX
CMP AX, 000AH
JGE NEXT
ADD AL, 30H
MOV[SI], AL
UP:
POP AX
INC SI
MOV [SI], AL
LOOP UP
RET
CONV ENDP
END START

;Write a program to copy content of one file to another.
    .model small
    .386
    .stack 100h

    .data

    handle      dw ? 
    handle2     dw ? 

    filename    db  26        ;MAX NUMBER OF CHARACTERS ALLOWED (25).
                db  ?         ;LENGTH (NUMBER OF CHARACTERS ENTERED BY USER).
                db  26 dup(0) ;CHARACTERS ENTERED BY USER. END WITH CHR(13).

    filename2   db  26        ;MAX NUMBER OF CHARACTERS ALLOWED (25).
                db  ?         ;LENGTH (NUMBER OF CHARACTERS ENTERED BY USER).
                db  26 dup(0) ;CHARACTERS ENTERED BY USER. END WITH CHR(13).

    prompt1 db 13,10,"ENTER FILE NAME HERE: $" 
    prompt2 db 13,10,"ENTER A SECOND FILE NAME: $" 

    mess1       db ' QUES 2 $'                                               

    buf         db ?

    .code

    main:           
    mov ax, @data       ; set up addressability of data
    mov ds, ax

;DISPLAY MESSAGE.
    lea dx, prompt1            ; load and print the string PROMPT
    mov ah, 9
    int 21h      

;CAPTURE FILENAME FROM KEYBOARD.                                    
    mov ah, 0Ah
    mov dx, offset filename ;THIS VARIABLE REQUIRES THE 3-DB FORMAT.
    int 21h                

;CAPTURED STRING ENDS WITH CHR(13), BUT TO CREATE FILE WE NEED
;THE FILENAME TO END WITH CHR(0), SO LET'S CHANGE IT.
    mov si, offset filename + 1 ;NUMBER OF CHARACTERS ENTERED.
    mov cl, [ si ] ;MOVE LENGTH TO CL.
    mov ch, 0      ;CLEAR CH TO USE CX. 
    inc cx         ;TO REACH CHR(13).
    add si, cx     ;NOW SI POINTS TO CHR(13).
    mov al, 0
    mov [ si ], al ;REPLACE CHR(13) BY 0.            

;CREATE FILE.
    mov ah, 3ch         ; dos service to create file
    mov cx, 0         ;READ/WRITE MODE.
    mov dx, offset filename + 2 ;CHARACTERS START AT BYTE 2.
    int 21h

    jc failed                           ; end program if failed

    mov handle, ax                      ; save file handle

    mov DI, 100 ;CAN'T USE CX BECAUSE WE NEED IT TO WRITE TO FILE.
    PL:
;WRITE STRING ON FILE.
    mov ah, 40h                         ; write to 
    mov bx, handle                      ; file
    mov dx, offset mess1                ; where to find data to write
    mov cx, 7 ;LENGTH OF STRING IN CX.
    int 21h

    DEC DI ;DECREASE COUNTER.
    jnz PL

;CLOSE FILE.           
    mov ah, 3Eh                         ; close file
    mov bx, handle                      ; which file
    int 21h 

;OPEN FILE TO READ FROM IT.
    mov ah, 3DH
    mov al, 0   ;READ MODE.
    mov dx, offset filename + 2
    int 21h
    mov handle, ax                      ; save file handle

;DISPLAY MESSAGE FOR SECOND FILE.
    lea dx, prompt2            ; load and print the string PROMPT
    mov ah, 9
    int 21h      

;CAPTURE FILENAME FROM KEYBOARD.                                    
    mov ah, 0Ah
    mov dx, offset filename2 ;THIS VARIABLE REQUIRES THE 3-DB FORMAT.
    int 21h                

;CAPTURED STRING ENDS WITH CHR(13), BUT TO CREATE FILE WE NEED
;THE FILENAME TO END WITH CHR(0), SO LET'S CHANGE IT.
    mov si, offset filename2 + 1 ;NUMBER OF CHARACTERS ENTERED.
    mov cl, [ si ] ;MOVE LENGTH TO CL.
    mov ch, 0      ;CLEAR CH TO USE CX. 
    inc cx         ;TO REACH CHR(13).
    add si, cx     ;NOW SI POINTS TO CHR(13).
    mov al, 0
    mov [ si ], al ;REPLACE CHR(13) BY 0.            

;CREATE FILE.
    mov ah, 3ch         ; dos service to create file
    mov cx, 0    ;READ/WRITE MODE.
    mov dx, offset filename2 + 2 ;CHARACTERS START AT BYTE 2.
    int 21h

    jc failed                           ; end program if failed

    mov handle2, ax                      ; save file handle

;READ ALL BYTES FROM FIRST FILE AND WRITE THEM TO SECOND FILE.

reading:
;READ ONE BYTE.
    mov ah, 3FH
    mov bx, handle
    mov cx, 1           ;HOW MANY BYTES TO READ.
    mov dx, offset buf  ;THE BYTE WILL BE STORED HERE.
    int 21h             ;NUMBER OF BYTES READ RETURNS IN AX.
;CHECK EOF (END OF FILE).
    cmp ax, 0  ;IF AX == 0 THEN EOF.
    je  eof              
;WRITE BYTE TO THE SECOND FILE.           
    mov ah, 40h                         ; write to 
    mov bx, handle2                     ; file
    mov dx, offset buf                  ; where to find data to write
    mov cx, 1 ;LENGTH OF STRING IN CX.
    int 21h
    jmp reading ;REPEAT PROCESS.
eof:
;CLOSE FILES.           
    mov ah, 3Eh                         ; close file
    mov bx, handle                      ; which file
    int 21h 
    mov ah, 3Eh                         ; close file
    mov bx, handle2                     ; which file
    int 21h 

    failed:

    mov ah, 4ch
    int 21h

    end main

;Write a program that examines the contents of 50 memory locations that has ASCII characters and counts
the number of Numerals, Capitalalphabets, Small Alphabets and stores them in memory locations labeled
NUMS, CAPS1, SMA1.
.model tiny
.486
.data
dat1 db 'b', '2', 'A', 'z', 'B', 'a', 'Z' , '3', 'd', '1'
count1 dw 32h
nums db ?
sma1 db ?
caps1 db ?
.code
.startup
mov cx,count1
lea si,dat1
cld
x4: lodsb
cmp al,30h
jl x1
cmp al,39h
jg x2
inc nums
x2: cmp al,41h
jl x1
cmp al,5ah
jg x3
inc caps1
x3: cmp al,61h
jl x1
cmp al,7ah
jg x1
inc sma1
x1: loop x4
.exit
End

;Write an 80486 ALP that will add the two nibbles in a data byte together and if there
is a carry in the nibble addition it will write ‘C’ into a memory location.
.model small
.486
.data
dat1 db
89h,3eh,0f1h,45h,23h,89h,3eh,0f1h,45h,23h,89h,3eh,0f1h,45h,23h,89h,3eh,0f1h,45h,23
h,89h,3eh,0f1h,45h,23h
car1 db 25 dup('N')
.code
Start:
Mov ax,@data
Mov ds,ax
Mov es,ax
lea si,dat1
lea di,car1
mov cx,25
mov dh,'C'
x1: lodsb
mov ah,al
and al,0fh
and ah,0f0h
rol al,4
add ah,al
jnc x2
mov [di],dh
x2: inc di
loop x1
int 3
end start

;Find number of times letter e exist in the string “exercise”, Store the count at memory
.model small
.data
String db exercise, $
Ans db ?
Length db $-String
.code
Start:
Mov ax,@data
Mov ds,ax
MOV AL,00H
MOV SI, offset String
MOV CX, Length
Back: MOV BH, [SI]
CMP BH, 'e'
JNZ Label
INC AL
Label: INC SI
LOOP Back
MOV Ans, AL
MOV AH, 4CH
Int 21h
End start