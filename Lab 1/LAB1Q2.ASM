.model small
.stack 20
.data
Org 1000H
num1 DB 80H
num2 DB 86H
res DW ?
.code
start:
mov ax, @data
mov ds,ax
mov ah,0
mov al,num1
add al,num2
adc ah,0
mov res,ax
int 3
end start

