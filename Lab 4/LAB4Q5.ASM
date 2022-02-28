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
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
