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
