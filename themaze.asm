DrawHeart macro X,Y,pic
local draw 
    push cx
    mov cx , X
    mov dx , Y
    mov si , pic
    mov ah ,0ch 
    mov bh , 16
    mov bl , 16
draw:
    mov al, [si]
    int 10h
    inc cx 
    inc si 
    dec bl 
    jnz draw
    mov bl ,16 
    pop cx
    mov cx ,X
    push cx
    inc dx
    dec bh 
    jnz draw
    
    
endm DrawHeart

.MODEL LARGE
.stack 64
.DATA
    
    startgame db 'Press F1 to play','$'
    startchat db 'Press F2 to chat','$'
    Exit db 'Press esc to exit','$'
;==================================================================================================================================================
       maze  db 0,0,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,0,0,0,9,9,9,0,0,0,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,0,9,9,9,9,9,9,0
             db 0,0,9,1,1,1,1,1,1,9,9,1,1,9,9,1,1,9,9,1,1,1,1,9,0,0,0,9,1,1,9,0,9,1,1,9,9,1,1,1,1,1,9,1,1,1,1,1,1,1,9,9,1,1,1,1,9,0
             db 0,0,9,1,1,1,1,1,1,9,9,1,1,9,9,1,1,9,9,1,1,1,1,9,0,0,0,9,1,1,1,9,1,1,1,9,9,1,1,1,1,1,9,1,1,1,1,1,1,1,9,9,1,1,1,1,9,0
             db 0,0,9,1,1,1,1,1,1,9,9,1,1,9,9,1,1,9,9,1,1,9,9,9,0,0,0,9,1,1,1,1,1,1,1,9,9,1,1,9,1,1,9,9,9,9,9,1,1,9,0,9,1,1,9,9,9,0
             db 0,0,9,9,9,1,1,9,9,9,9,1,1,1,1,1,1,9,9,1,1,1,1,9,0,0,0,9,1,1,9,1,9,1,1,9,9,1,1,9,1,1,9,0,0,9,1,1,9,0,0,9,1,1,1,1,9,0
             db 0,0,0,0,9,1,1,9,0,0,9,1,1,1,1,1,1,9,9,1,1,1,1,9,0,0,0,9,1,1,9,9,9,1,1,9,9,1,1,1,1,1,9,0,9,1,1,9,0,0,0,9,1,1,1,1,9,0
             db 0,0,0,0,9,1,1,9,0,0,9,1,1,9,9,1,1,9,9,1,1,9,9,9,0,0,0,9,1,1,9,0,9,1,1,9,9,1,1,1,1,1,9,9,1,1,9,9,9,9,9,9,1,1,9,9,9,0
             db 0,0,0,0,9,1,1,9,0,0,9,1,1,9,9,1,1,9,9,1,1,1,1,9,0,0,0,9,1,1,9,0,9,1,1,9,9,1,1,9,1,1,9,1,1,1,1,1,1,1,9,9,1,1,1,1,9,0
             db 0,0,0,0,9,1,1,9,0,0,9,1,1,9,9,1,1,9,9,1,1,1,1,9,0,0,0,9,1,1,9,0,9,1,1,9,9,1,1,9,1,1,9,1,1,1,1,1,1,1,9,9,1,1,1,1,9,0
             db 0,0,0,0,9,9,9,9,0,0,9,9,9,9,9,9,9,9,9,9,9,9,9,9,0,0,0,9,9,9,9,0,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,0
;===============================================================================================================================
    boss   db  0  ,0  ,0  ,0  ,0  ,14 ,14 ,14 ,14 ,14 ,0  ,0  ,0  ,0  ,0  ,0
    boss1  db  0  ,0  ,0  ,14 ,14 ,14 ,14 ,14 ,14 ,14 ,14 ,14 ,0  ,0  ,0  ,0
    boss2  db  0  ,0  ,14 ,14 ,14 ,14 ,14 ,14 ,14 ,14 ,14 ,14 ,14 ,0  ,0  ,0
    boss3  db  0  ,14 ,14 ,14 ,14 ,14 ,14 ,14 ,14 ,14 ,14 ,14 ,14 ,14 ,0  ,0
    boss4  db  0  ,14 ,14 ,14 ,14 ,14 ,14 ,14 ,14 ,14 ,14 ,14 ,14 ,14 ,14 ,0                                                                       
    boss5  db  14 ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,14
    boss6  db  14 ,14 ,0  ,15 ,15 ,0  ,0  ,0  ,0  ,0  ,15 ,15 ,0  ,0  ,14 ,14
    boss7  db  14 ,14 ,0  ,15 ,0  ,0  ,0  ,14 ,0  ,0  ,15 ,0  ,0  ,0  ,14 ,14                                                                       
    boss8  db  14 ,14 ,14 ,0  ,0  ,0  ,14 ,14 ,14 ,0  ,0  ,0  ,0  ,14 ,14 ,14                                                                       
    boss9  db  14 ,14 ,14 ,14 ,14 ,14 ,14 ,14 ,14 ,14 ,14 ,14 ,14 ,14 ,14 ,14
    boss10 db  14 ,14 ,14 ,14 ,14 ,14 ,14 ,14 ,14 ,14 ,14 ,0  ,14 ,14 ,14 ,14                                                                     
    boss11 db  0  ,14 ,14 ,14 ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,14 ,14 ,14 ,14 ,0
    boss12 db  0  ,14 ,14 ,14 ,14 ,14 ,14 ,14 ,14 ,14 ,14 ,14 ,14 ,14 ,14 ,0
    boss13 db  0  ,0  ,14 ,14 ,14 ,14 ,14 ,14 ,14 ,14 ,14 ,14 ,14 ,14 ,0  ,0
    boss14 db  0  ,0  ,0  ,14 ,14 ,14 ,14 ,14 ,14 ,14 ,14 ,14 ,14 ,0  ,0  ,0
    boss15 db  0  ,0  ,0  ,0  ,0  ,14 ,14 ,14 ,14 ,14 ,14 ,0  ,0  ,0  ,0  ,0 
;========================================================
    mario   db 0,0,0,0,0,4h,4h,4h,4h,4h,4h,0,0,0,0,0
    mario1  db 0,0,0,0,4h,4h,4h,4h,4h,4h,4h,4h,4h,4h,0,0
    mario2  db 0,0,0,0,6h,6h,6h,5ah,5ah,5ah,0,5ah,0,0,0,0
    mario3  db 0,0,0,6h,5ah,6h,5ah,5ah,5ah,5ah,0,5ah,5ah,5ah,0,0
    mario4  db 0,0,0,6h,5ah,6h,6h,5ah,5ah,5ah,5ah,0,5ah,5ah,5ah,0
    mario5  db 0,0,0,6h,6h,5ah,5ah,5ah,5ah,5ah,0,0,0,0,0,0
    mario6  db 0,0,0,0,0,5ah,5ah,5ah,5ah,5ah,5ah,5ah,5ah,0,0,0
    mario7  db 0,0,0,0,4h,4h,1h,4h,4h,4h,4h,0,0,0,0,0
    mario8  db 0,0,0,4h,4h,4h,1h,4h,4h,1h,4h,4h,4h,0,0,0
    mario9  db 0,0,4h,4h,4h,4h,1h,1h,1h,1h,4h,4h,4h,4h,0,0
    mario10 db 0,0,5ah,5ah,4h,1h,0eh,1h,1h,0eh,1h,4h,5ah,5ah,0,0
    mario11 db 0,0,5ah,5ah,5ah,1h,1h,1h,1h,1h,1h,5ah,5ah,5ah,0,0
    mario12 db 0,0,5ah,5ah,1h,1h,1h,1h,1h,1h,1h,1h,5ah,5ah,0,0
    mario13 db 0,0,0,0,1h,1h,1h,0,0,1h,1h,1h,0,0,0,0
    mario14 db 0,0,0,6h,6h,6h,0,0,0,0,6h,6h,6h,0,0,0
    mario15 db 0,0,6h,6h,6h,6h,0,0,0,0,6h,6h,6h,6h,0,0
;==========================================================
    mario20  db 0,0,0,0,0,1h,1h,1h,1h,1h,1h,0,0,0,0,0
    mario21  db 0,0,0,0,1h,1h,1h,1h,1h,1h,1h,1h,1h,1h,0,0
    mario22  db 0,0,0,0,6h,6h,6h,5ah,5ah,5ah,0,5ah,0,0,0,0
    mario23  db 0,0,0,6h,5ah,6h,5ah,5ah,5ah,5ah,0,5ah,5ah,5ah,0,0
    mario24  db 0,0,0,6h,5ah,6h,6h,5ah,5ah,5ah,5ah,0,5ah,5ah,5ah,0
    mario25  db 0,0,0,6h,6h,5ah,5ah,5ah,5ah,5ah,0,0,0,0,0,0
    mario26  db 0,0,0,0,0,5ah,5ah,5ah,5ah,5ah,5ah,5ah,5ah,0,0,0
    mario27  db 0,0,0,0,1h,1h,4h,1h,1h,1h,1h,0,0,0,0,0
    mario28  db 0,0,0,1h,1h,1h,4h,1h,1h,4h,1h,1h,1h,0,0,0
    mario29  db 0,0,1h,1h,1h,1h,4h,4h,4h,4h,1h,1h,1h,1h,0,0
    mario210 db 0,0,5ah,5ah,1h,4h,0eh,4h,4h,0eh,4h,1h,5ah,5ah,0,0
    mario211 db 0,0,5ah,5ah,5ah,4h,4h,4h,4h,4h,4h,5ah,5ah,5ah,0,0
    mario212 db 0,0,5ah,5ah,4h,4h,4h,4h,4h,4h,4h,4h,5ah,5ah,0,0
    mario213 db 0,0,0,0,4h,4h,4h,0,0,4h,4h,4h,0,0,0,0
    mario214 db 0,0,0,6h,6h,6h,0,0,0,0,6h,6h,6h,0,0,0
    mario215 db 0,0,6h,6h,6h,6h,0,0,0,0,6h,6h,6h,6h,0,0
;============================================================
    p   db 0  ,0  ,0  ,0  ,0  ,0  ,0eh,0eh,0eh,0  ,0  ,0  ,0  ,0  ,0  ,0
    p1  db 0  ,0  ,0  ,0  ,0eh,0eh,13 ,13 ,13 ,0eh,0eh,0  ,0  ,0  ,0  ,0
    p2  db 0  ,0  ,0  ,0eh,13 ,13 ,13 ,13 ,13 ,13 ,13 ,0eh,0  ,0  ,0  ,0
    p3  db 0  ,0  ,0eh,13 ,13 ,13 ,13 ,13 ,13 ,13 ,13 ,13 ,0eh,0eh,0  ,0
    p4  db 0  ,0eh,13 ,13 ,13 ,13 ,14 ,14 ,13 ,13 ,13 ,13 ,14 ,14 ,0eh,0
    p5  db 0  ,0eh,13 ,13 ,13 ,14 ,1  ,1  ,14 ,13 ,13 ,14 ,1  ,1  ,14 ,0
    p6  db 0  ,0eh,13 ,13 ,13 ,14 ,1  ,1  ,14 ,13 ,13 ,14 ,1  ,1  ,14 ,0
    p7  db 0eh,13 ,13 ,13 ,13 ,13 ,14 ,14 ,14 ,13 ,13 ,13 ,14 ,14 ,0eh,0
    p8  db 0eh,13 ,13 ,13 ,13 ,13 ,13 ,13 ,13 ,13 ,13 ,13 ,13 ,13 ,0eh,0
    p9  db 0eh,13 ,13 ,13 ,13 ,13 ,13 ,13 ,13 ,13 ,13 ,13 ,13 ,13 ,0eh,0
    p10 db 0eh,13 ,13 ,13 ,13 ,13 ,13 ,13 ,13 ,13 ,13 ,13 ,13 ,13 ,0eh,0
    p11 db 0eh,13 ,13 ,13 ,13 ,13 ,13 ,13 ,13 ,13 ,13 ,13 ,13 ,13 ,0eh,0
    p12 db 0eh,13 ,0eh,13 ,13 ,13 ,0eh,13 ,13 ,13 ,13 ,0eh,13 ,13 ,0eh,0 
    p13 db 0eh,0eh,0  ,0eh,13 ,0eh,0  ,0eh,13 ,13 ,0eh,0  ,0eh,13 ,0eh,0
    p14 db 0eh,0  ,0  ,0  ,0eh,0  ,0  ,0  ,0eh,0eh,0  ,0  ,0  ,0eh,0eh,0
    p15 db 0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0 
;=============================================================
    heart   db 0 ,0 ,0 ,0 ,4 ,0 ,0 ,0 ,0 ,0 ,0 ,4 ,0 ,0 ,0 ,0
    heart1  db 0 ,0 ,0 ,4 ,4 ,4 ,0 ,0 ,0 ,0 ,4 ,4 ,4 ,0 ,0 ,0
    heart2  db 0 ,0 ,4 ,13,13,13,4 ,0 ,0 ,4 ,4 ,4 ,4 ,4 ,0 ,0
    heart3  db 0 ,4 ,13,13,4 ,4 ,4 ,4 ,4 ,4 ,4 ,4 ,4 ,4 ,4 ,0
    heart4  db 4 ,4 ,13,4 ,4 ,4 ,4 ,4 ,4 ,4 ,4 ,4 ,4 ,4 ,4 ,4
    heart5  db 4 ,4 ,13,4 ,4 ,4 ,4 ,4 ,4 ,4 ,4 ,4 ,4 ,4 ,4 ,4
    heart6  db 0 ,4 ,4 ,4 ,4 ,4 ,4 ,4 ,4 ,4 ,4 ,4 ,4 ,4 ,4 ,0
    heart7  db 0 ,4 ,4 ,4 ,4 ,4 ,4 ,4 ,4 ,4 ,4 ,4 ,4 ,4 ,4 ,0
    heart8  db 0 ,0 ,4 ,4 ,4 ,4 ,4 ,4 ,4 ,4 ,4 ,4 ,4 ,4 ,4 ,0
    heart9  db 0 ,0 ,0 ,4 ,4 ,4 ,4 ,4 ,4 ,4 ,4 ,4 ,4 ,4 ,0 ,0
    heart10 db 0 ,0 ,0 ,0 ,4 ,4 ,4 ,4 ,4 ,4 ,4 ,4 ,4 ,0 ,0 ,0
    heart11 db 0 ,0 ,0 ,0 ,0 ,4 ,4 ,4 ,4 ,4 ,4 ,4 ,0 ,0 ,0 ,0
    heart12 db 0 ,0 ,0 ,0 ,0 ,0 ,4 ,4 ,4 ,4 ,4 ,0 ,0 ,0 ,0 ,0
    heart13 db 0 ,0 ,0 ,0 ,0 ,0 ,0 ,4 ,4 ,4 ,0 ,0 ,0 ,0 ,0 ,0
    heart14 db 0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,4 ,0 ,0 ,0 ,0 ,0 ,0 ,0
    heart15 db 0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0
;===============================================================
    xh   db 0 ,0 ,0 ,0 ,9 ,0 ,0 ,0 ,0 ,0 ,0 ,9 ,0 ,0 ,0 ,0
    xh1  db 0 ,0 ,0 ,9 ,9 ,9 ,0 ,0 ,0 ,0 ,9 ,9 ,9 ,0 ,0 ,0
    xh2  db 0 ,0 ,9 ,13,13,13,9 ,0 ,0 ,9 ,9 ,9 ,9 ,9 ,0 ,0
    xh3  db 0 ,9 ,13,13,9 ,9 ,9 ,9 ,9 ,9 ,9 ,9 ,9 ,9 ,9 ,0
    xh4  db 9 ,9 ,13,9 ,9 ,9 ,9 ,9 ,9 ,9 ,9 ,9 ,9 ,9 ,9 ,9
    xh5  db 9 ,9 ,13,9 ,9 ,9 ,9 ,9 ,9 ,9 ,9 ,9 ,9 ,9 ,9 ,9
    xh6  db 0 ,9 ,9 ,9 ,9 ,9 ,9 ,9 ,9 ,9 ,9 ,9 ,9 ,9 ,9 ,0
    xh7  db 0 ,9 ,9 ,9 ,9 ,9 ,9 ,9 ,9 ,9 ,9 ,9 ,9 ,9 ,9 ,0
    xh8  db 0 ,0 ,9 ,9 ,9 ,9 ,9 ,9 ,9 ,9 ,9 ,9 ,9 ,9 ,9 ,0
    xh9  db 0 ,0 ,0 ,9 ,9 ,9 ,9 ,9 ,9 ,9 ,9 ,9 ,9 ,9 ,0 ,0
    xh10 db 0 ,0 ,0 ,0 ,9 ,9 ,9 ,9 ,9 ,9 ,9 ,9 ,9 ,0 ,0 ,0
    xh11 db 0 ,0 ,0 ,0 ,0 ,9 ,9 ,9 ,9 ,9 ,9 ,9 ,0 ,0 ,0 ,0
    xh12 db 0 ,0 ,0 ,0 ,0 ,0 ,9 ,9 ,9 ,9 ,9 ,0 ,0 ,0 ,0 ,0
    xh13 db 0 ,0 ,0 ,0 ,0 ,0 ,0 ,9 ,9 ,9 ,0 ,0 ,0 ,0 ,0 ,0
    xh14 db 0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,9 ,0 ,0 ,0 ,0 ,0 ,0 ,0
    xh15 db 0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0
;===============================================================
    skull   db 0 ,0  ,0  ,3  ,3  ,3  ,3  ,3  ,3  ,3  ,3  ,3  ,0  ,0  ,0,0
    skull1  db 0 ,0  ,3  ,7  ,7  ,7  ,7  ,7  ,7  ,7  ,7  ,7  ,3  ,0  ,0,0
    skull2  db 0 ,3  ,7  ,7  ,7  ,7  ,7  ,7  ,7  ,7  ,7  ,7  ,7  ,3  ,0,0
    skull3  db 0 ,3  ,7  ,7  ,0  ,0  ,7  ,7  ,7  ,0  ,0  ,7  ,7  ,3  ,0,0
    skull4  db 0 ,3  ,7  ,7  ,0  ,0  ,7  ,7  ,7  ,0  ,0  ,7  ,7  ,3  ,0,0  
    skull5  db 0 ,3  ,7  ,7  ,0  ,0  ,7  ,7  ,7  ,0  ,0  ,7  ,7  ,3  ,0,0
    skull6  db 0 ,3  ,7  ,7  ,0  ,0  ,7  ,7  ,7  ,0  ,0  ,7  ,7  ,3  ,0,0
    skull7  db 0 ,3  ,7  ,7  ,7  ,7  ,7  ,7  ,7  ,7  ,7  ,7  ,7  ,3  ,0,0
    skull8  db 0 ,3  ,7  ,7  ,7  ,7  ,7  ,7  ,7  ,7  ,7  ,7  ,7  ,3  ,0,0
    skull9  db 0 ,0  ,3  ,3  ,7  ,7  ,0  ,7  ,0  ,7  ,7  ,3  ,3  ,0  ,0,0
    skull10 db 0 ,0  ,0  ,3  ,7  ,7  ,7  ,0  ,7  ,7  ,7  ,3  ,0  ,0  ,0,0
    skull11 db 0 ,0  ,0  ,3  ,7  ,7  ,0  ,7  ,0  ,7  ,7  ,3  ,0  ,0  ,0,0
    skull12 db 0 ,0  ,0  ,0  ,3  ,7  ,7  ,7  ,7  ,7  ,3  ,0  ,0  ,0  ,0,0
    skull13 db 0 ,0  ,0  ,0  ,0  ,3  ,3  ,3  ,3  ,3  ,0  ,0  ,0  ,0  ,0,0
    skull14 db 0 ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0,0
    skull15 db 0 ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0,0
;=========================================================================    
    Score db 'SCORE:','$'
    score1 db '700','$'
    score2 db '700','$'
    FName db 15,?,15 dup('$') ;First byte is the size, second byte is the number of characters from the keyboard
    SName db 15,?,15 dup('$') ;First byte is the size, second byte is the number of characters from the keyboard
    Name1 db 'Please Enter your Name:',32,'$'
    play1 db 1
    play2 db 1
    x dw 6
    y dw 166
    winner db 'you win ','$'
    loser db 'Game Over','$'
    Value_S db ?
    Value_R db ?
    point    dw 0c00h
    point2   dw 0000h
    charRecived db ?
    charSent db ?
    Recived db 0 ; just a flag to know if there is any recived charchter 
    counter db 1
    xs	dw  277, 294 , 83 , 40 , 294 , 24
    ys  dw  80, 166, 81 , 132 , 30 , 115
    player db ?
    request db 'Press enter to play a game or space to refuse ','$'
    request1 db 'Press enter to start chat or space to refuse '
.CODE          
MAIN PROC FAR 
;---------------------------------------------------------------
mov ax,@data
mov ds,ax
mov es,ax 
call UARTConf
;---------------------------------------------------------------
;clearing the screen 
mov ax,0600h
mov cx , 0
mov dx,184fh
int 10h
;ask player to write his name

nameagain:

mov ah,0
mov al,13h
int 10h 

mov ax,0600h
mov cx , 0
mov dx,184fh
int 10h 

mov al,0
mov ah , 13h
mov bh,0
mov cx , 23
mov dl ,8
mov dh ,5 
mov bp , offset Name1
mov bl , 0fh
int 10h

mov ah , 2
mov dx , 0a0fh
int 10h

mov ah,0AH        ;Read from keyboard
mov dx,offset FName                  
int 21h

cmp Fname[2] , 0dh
je nameagain
begin:
;making the start menu
mov ah,0
mov al,13h
int 10h 
mov di , offset maze
    mov cx , 130                                    
    mov dx , 80
    mov bl , 10
    mov bh , 58
    mov ah , 0ch 
gamename:
    mov al , [di]
    int 10h
    inc di
    inc cx 
    cmp cx , 188
    jnz gamename
    mov cx , 130
    inc dx
    cmp dx , 90
    jnz gamename

mov ah,2
mov dx,0D1Ah
int 10h
 
mov al,0
mov ah , 13h
mov bh,0
mov cx , 16
mov dl ,12
mov dh ,12 
mov bp , offset startgame
mov bl , 0fh
int 10h

mov al,0
mov ah , 13h
mov bh,0
mov cx , 17
mov dl,12
mov dh,14 
mov bp , offset exit
mov bl , 0fh
int 10h

mov al,0
mov ah , 13h
mov bh,0
mov cx , 16
mov dl,12
mov dh,13 
mov bp , offset startchat
mov bl , 0fh
int 10h

;if f1 is pressed then game is entered and esc to exit and f2 to chat
press: 
 mov ah,1
 int 16h
 jz nosend1

mov ah,0
int 16h
cmp al,1Bh ;if key pressed is esc
jnz go
mov ah , 4ch
int 21h 
go:
cmp ah,3bh
jnz chat
;--------------------------
;request
;-------------------------

mov dl,1
mov player,dl
mov charsent,ah
call  senddata
estna:
call recievedata 

cmp recived,0
jz estna
cmp charRecived,0Dh
jz playgame1
jmp press
nosend1:
call recievedata
cmp recived,0
jz press
cmp charRecived,3bh
jnz nosend2
mov dl,2
mov player,dl
mov ah,2
mov dx,0A0Ah
int 10h
mov ah,9
mov dx,offset request;5aleeh ytb3 deh msh 3aref atb3ha 3ala el shasha
int 21
checks:
mov ah,1
 int 16h
 jz checks
mov ah,0
int 16h
mov charsent,al
call senddata
cmp al,32
jz press
cmp al,0Dh
jnz press

playgame1:
jmp playgame 

chat:
cmp ah, 3ch
jnz lalala
mov dl,1
mov player,dl
mov charsent,ah
call  senddata
estna1:
call recievedata 

cmp recived,0
jz estna1
cmp charRecived,0Dh
jnz lalala
call chatmode
nosend2:
cmp charRecived,3ch
jnz lalala
mov dl,2
mov player,dl
mov ah,2
mov dx,0A0Ah
int 10h
mov ah,9
mov dx,offset request;5aleeh ytb3 deh msh 3aref atb3ha 3ala el shasha
int 21
checks1:
mov ah,1
 int 16h
 jz checks1
mov ah,0
int 16h
mov charsent,al
call senddata
cmp al,32
jz lalala
cmp al,0Dh
jnz lalala
call chatmode

lalala:
jmp press
;----------------------------------------------------------

presss:
jmp far ptr press
;-------------------------------------------------------------

;change to video mode to begin drawing the maze
playgame: 
mov ah,0
mov al,13h
int 10h
;----------------------------------------------------------------
mov ah,2
mov dx,28
int 10h
mov ah,2
mov dl,39
int 21h
mov ah,2
mov dl,'s'
int 21h
mov ah,2
mov dl,32
int 21h
mov ah,9
lea dx,score
int 21h 
mov ah,2
mov dx,37
int 10h
mov ah,9
lea dx,score1
int 21h
mov ah,2
mov dx,28
sub dl,Fname+1
int 10h
mov ah,9
lea dx,Fname+2
int 21h 
;TODO: send the other player name
mov ah,2
mov dl,28
mov dh,23
int 10h
mov ah,2
mov dl,39
int 21h
mov ah,2
mov dl,'s'
int 21h
mov ah,2
mov dl,32
int 21h
mov ah,9
lea dx,score
int 21h 
mov ah,2
mov dl,37
mov dh,23
int 10h
mov ah,9
lea dx,score2
int 21h
mov ah,2
mov dl,28
mov dh,23
sub dl,Sname+1
int 10h
mov ah,9
lea dx,Sname+2
int 21h 

;TODO: Need to call function Random
call random
mov bx , offset skull
DrawHeart cx,ax,bx
  mov di,3  
delay:
    mov cx , 0000h
    mov dx , 0c350h
    mov ax , 8600h
    int 15h 
    dec di
    jnz delay
call random
mov bx , offset xh
DrawHeart cx,ax,bx
  mov di,3  
delay1:
    mov cx , 0000h
    mov dx , 0c350h
    mov ax , 8600h
    int 15h 
    dec di
    jnz delay1
call random
mov bx , offset heart
DrawHeart cx,ax,bx
  mov di,2  
delay2:
    mov cx , 0000h
    mov dx , 0c350h
    mov ax , 8600h
    int 15h 
    dec di
    jnz delay2
call random
mov bx , offset xh
DrawHeart cx,ax,bx
call random
mov bx , offset heart
DrawHeart cx,ax,bx
call random
mov bx , offset xh
DrawHeart cx,ax,bx
;---------------------------------------------------------------
;draw vertical line from (5,12)to(5,182)
mov cx,5
mov dx,12
mov al,0fh
mov ah,0ch
back:
int 10h
inc dx
cmp dx,182
jnz back
;----------------------------------------------------------------
;draw horizontal line from (5,182) to (310,182)
mov cx,5
b:
int 10h
inc cx
cmp cx,310
jnz b
;------------------------------------------------------------------
;draw vertical line from (315,182) to (315,17)
a:
int 10h
dec dx
cmp dx,12
jnz a
;-----------------------------------------------------------------
;draw horizontal line from (315,18) to (5,18)
c:
int 10h
dec cx
cmp cx,5
jnz c
;----------------------------------------------------------------
;strt of drawing the maze
;------------------------------------------------------------------
;horzontal lines   
;;l1
    MOV CX,6
    MOV DX,29
    h1:
    INT 10H
    INC CX
    CMP CX,294
    JNE h1
;;l2
    mov cx,6
    MOV DX,46
    h2:
    INT 10H
    INC CX
    CMP CX,69
    JNE h2

    add cx,17
    h3:
    INT 10H
    INC CX
    CMP CX,294
    JNE h3
;;l3
    
    mov cx,22
    mov dx,63
    h12345:
    INT 10H
    INC CX
    CMP CX,51
    JNE h12345
    
    add cx , 17
    h5:
    INT 10H
    INC CX
    CMP CX,117
    JNE h5

    add cx,16
    h61:
    INT 10H
    INC CX
    CMP CX,150
    JNE h61
    add cx,16
    h6:
    INT 10H
    INC CX
    CMP CX,294
    JNE h6
    
;;l4 
    mov cx,6
    h17:
    MOV DX,80
    INT 10H
    INC CX
    CMP CX,22
    JNE h17

    add cx,17
    h7:
    MOV DX,80
    INT 10H
    INC CX
    CMP CX,100
    JNE h7

    add cx,17
    h8:
    INT 10H
    INC CX
    CMP CX,294
    JNE h8
    ;;l5
    mov cx,6
    h9:
    MOV DX,97
    INT 10H
    INC CX
    CMP CX,54
    JNE h9

    add cx,16
    ha:
    INT 10H
    INC CX
    CMP CX,294
    JNE ha
    
    ;;l6
    mov cx,23
    hb:
    MOV DX,114
    INT 10H
    INC CX
    CMP CX,134
    JNE hb
    
    add cx,16
    hba:
    INT 10H
    INC CX
    CMP CX,230
    JNE hba
    
    
    add cx,16
    hbb:
    INT 10H
    INC CX
    CMP CX,310
    JNE hbb
    ;;l7
    mov cx,6
    hg:
    MOV DX,131
    INT 10H
    INC CX
    CMP CX,23
    JNE hg
    
    add cx,17
    hha:
    INT 10H
    INC CX
    CMP CX,198
    JNE hha
    
    add cx,16
    hh:
    INT 10H
    INC CX
    CMP CX,278
    JNE hh
    
    add cx,16
    hhv:
    INT 10H
    INC CX
    CMP CX,310
    JNE hhv
    
    
    ;;l8
    mov cx,6
    he:
    MOV DX,148
    INT 10H
    INC CX
    CMP CX,246
    JNE he

    add cx,16
    hf:
    INT 10H
    INC CX
    CMP CX,310
    JNE hf
    
    ;;l9
    
    mov cx,23
    mov dx,165
    omg:
    INT 10H
    INC CX
    CMP CX,51
    JNE omg
    
    add cx , 17
    rick:
    INT 10H
    INC CX
    CMP CX,118
    JNE rick

    add cx,16
    MR:
    INT 10H
    INC CX
    CMP CX,150
    JNE MR
    add cx,16
    robot:
    INT 10H
    INC CX
    CMP CX,294
    JNE robot
;---------------------------------------------------------------

;draw vertical lines    
   
    
    mov cx,68
    mov dx,46
    v34:
    int 10h
    inc dx
    cmp dx,63
    jne v34
    
    mov cx,133
    mov dx,46
    v35:
    int 10h
    inc dx
    cmp dx,63
    jne v35
    
    mov cx,149
    mov dx,63
    v351:
    int 10h
    inc dx
    cmp dx,80
    jne v351
     
    mov cx,51
    mov dx,63
    v710:
    int 10h
    inc dx
    cmp dx,80
    jne v710

    mov cx,100
    mov dx,80
    v711:
    int 10h
    inc dx
    cmp dx,97
    jne v711
     
    mov cx,293
    mov dx,80
    v712:
    int 10h
    inc dx
    cmp dx,97
    jne v712
    
    mov cx,229
    mov dx,97
    v7123:
    int 10h
    inc dx
    cmp dx,114
    jne v7123
   
    mov cx,22
    mov dx,114
    v7120:
    int 10h
    inc dx
    cmp dx,131
    jne v7120
    
    mov cx,262
    mov dx,131
    v7121:
    int 10h
    inc dx
    cmp dx,148
    jne v7121
    
    mov cx,39
    mov dx,131
    v712q:
    int 10h
    inc dx
    cmp dx,148
    jne v712q
    
    mov cx,68
    mov dx,148
    messi:
    int 10h
    inc dx
    cmp dx,165
    jne messi 
    
    mov cx,166
    mov dx,148
    messi1:
    int 10h
    inc dx
    cmp dx,165
    jne messi1
    
    mov cx,50
    mov dx,165
    messi2:
    int 10h
    inc dx
    cmp dx,182
    jne messi2
    
    mov cx,134
    mov dx,165
    messi3:
    int 10h
    inc dx
    cmp dx,182
    jne messi3
    

;----------------------------------------------------------------
;phantom for the winner                  
    mov cx, 6
    mov dx, 115
    call DrawPhantom
 
;----------------------------------------------------------------
;game           
mov recived,0
mov charsent,0
;call UARTConf
call game
    

 
;----------------------------------------------------------------
Esc2:
jmp Esc2
hlt
MAIN ENDP


DrawPhantom Proc near

mov si , offset p
loop1p:
    mov al , [si]
    mov ah , 0ch
    int 10h
    inc si 
    inc cx
    cmp cx , 22
    jnz loop1p
    sub cl,16
    inc dx 
    cmp dx , 131
    jnz loop1p
    ret

DrawPhantom endp


myA proc near 
    pop bx ;store address to get back in main
    push cx ;push x so we return the beginning value of x in main
    push dx ;push y so we return the beginning value of y in main
    push bx ;to make address at top of stack
    mov bx,cx
    add bx,16;let bx the end of x of drawing
    mov di,dx
    add di,16;let bx the end of y of drawing 
  myloop1m:
    mov al , [si]
    mov ah , 0ch
    int 10h
    inc si 
    inc cx
    cmp cx , bx
    jnz myloop1m
    sub bx,16
    mov cx,bx
    add bx,16
    inc dx 
    cmp dx , di
    jnz myloop1m
    lea si,mario ;let Si point at beginning of array so we can use it again  
     
    ret
myA endp

myC proc near
    pop bx ;store address to get back in main
    push cx ;push x so we return the beginning value of x in main
    push dx ;push y so we return the beginning value of y in main
    push bx ;to make address at top of stack
    mov bx,cx
    add bx,16;let bx the end of x of drawing
    mov di,dx
    add di,16;let bx the end of y of drawing
  myloop2m:
    mov al , 0
    mov ah , 0ch
    int 10h 
    inc cx
    cmp cx , bx
    jnz myloop2m
    sub bx,16
    mov cx,bx
    add bx,16
    inc dx 
    cmp dx , di
    jnz myloop2m
    ret
myC endp

DrawMario2 proc  
    mov si , offset mario20
    mov bx,cx
    add bx,16;let bx the end of x of drawing
    mov di,dx
    add di,16;let di the end of y of drawing
loopOp:
    mov al , [si]
    mov ah , 0ch
    int 10h
    inc si 
    inc cx
    cmp cx , bx
    jnz loopOp
    sub cx,16
    inc dx 
    cmp dx , di
    jnz loopOP
    ret    
         
DrawMario2 endp

Clear proc
    mov bx,cx
    add bx,16;let bx the end of x of drawing
    mov di,dx
    add di,16;let bx the end of y of drawing
  loopclear:
    mov al , 0
    mov ah , 0ch
    int 10h 
    inc cx
    cmp cx , bx
    jnz loopclear                                  
    sub bx,16
    mov cx,bx
    add bx,16
    inc dx 
    cmp dx , di
    jnz loopclear
    ret
Clear endp

game proc near
    mov cx,x
    mov dx,y
    call DrawMario2  
    mov si , offset mario                            
    mov cx, 6
    mov dx, 13

    call myA
    pop dx
    pop cx
move: 

cmp player, 1
jnz nngz1       
    mov ah,1
    int 16h
    jz nosend
    
    
    mov ah,0
    int 16h 
    
    cmp ah,4Dh
    jz rightq1
    
   
    cmp ah,50h
    jz  downq1
    
    cmp ah,4Bh
    jz leftq1
    
    cmp ah,48h
    jz upq1
    
    cmp al,1Bh ;if key pressed is esc
    jnz nosend
    
    mov charsent,al
    
    push dx
    push cx
    
    
   call SendData 
    
    pop cx
    pop dx        
   
    mov charsent,1
mov bx , offset score1   
mov al , '7'
    mov [bx] , al
    inc bx 
mov al , '0'
    mov [bx] , al
    inc bx
    mov [bx] , al
    mov bx , offset score2   
mov al , '7'
    mov [bx] , al
    inc bx 
mov al , '0'
    mov [bx] , al
    inc bx
    mov [bx] , al
    jmp far ptr begin
 nngz1:
jmp far ptr nngz
rightq1:
jmp far ptr rightq
downq1:  
jmp far ptr downq  
leftq1:
jmp far ptr leftq
 upq1:
jmp far ptr upq
receiveb2a:    
           
    push dx
    push cx
    
    
   call SendData 
    
    pop cx
    pop dx        
    
    
    
nosend:    
   
    push cx
    push dx
    call RecieveData
    pop dx
    pop cx
    cmp Recived,0 
    jz t3
  
    
    cmp charRecived,50h
    jz GoDownq

    cmp charRecived,48h 
    jz GoUpq
    
    cmp charRecived,4Bh
    jz GoLeftq
    
    cmp charRecived,4Dh
    jz GoRightq

    cmp charRecived,27 ;if key pressed is esc
    jnz t3
    mov recived,0
    mov bx , offset score1   
mov al , '7'
    mov [bx] , al
    inc bx 
mov al , '0'
    mov [bx] , al
    inc bx
    mov [bx] , al
    mov bx , offset score2   
mov al , '7'
    mov [bx] , al
    inc bx 
mov al , '0'
    mov [bx] , al
    inc bx
    mov [bx] , al
    jmp far ptr begin
nngz:
jmp nngzq    
t3: 
jmp far ptr move    
    downq:
jmp down1
rightq:
jmp right1  
leftq:
jmp left1
upq:
jmp up1
GoDownq:
jmp GoDown1 
GoUPq:
jmp GoUP1
GoRightq:
jmp GoRight1
GoLeftq:
jmp GoLeft1

    
nngzq:
    mov ah,1
    int 16h
    jz nosendn
    
    
    mov ah,0
    int 16h 
   
     
     
    cmp ah,50h
    jz GoDown1s

    cmp ah,48h 
    jz GoUp1s
    
    cmp ah,4Bh
    jz GoLeft1s
    
    cmp ah,4Dh
    jz GoRight1s

    
    cmp al,1Bh ;if key pressed is esc
    
    jnz nosendn
    
    mov charsent,al
    
    push dx
    push cx
    
    
   call SendData 
    
    pop cx
    pop dx        
   
    mov charsent,1
mov bx , offset score1   
mov al , '7'
    mov [bx] , al
    inc bx 
mov al , '0'
    mov [bx] , al
    inc bx
    mov [bx] , al
    mov bx , offset score2   
mov al , '7'
    mov [bx] , al
    inc bx 
mov al , '0'
    mov [bx] , al
    inc bx
    mov [bx] , al
    jmp far ptr begin
GoDown1s:
jmp far ptr GoDown1
GoUp1s:
jmp far ptr GoUp1
GoRight1s:
jmp far ptr GoRight1
GoLeft1s:
jmp far ptr GoLeft1  
        
receiveb2an:    
            
    push dx
    push cx
    
    
   call SendData 
    
    pop cx
    pop dx        
   
     
     

nosendn:    
   
    push cx
    push dx
    call RecieveData
    pop dx
    pop cx
    cmp Recived,0 
    jz return1
    
    cmp charRecived,4Dh
    jz right1
    
   
    cmp charRecived,50h
    jz down1
    
    cmp charRecived,4Bh
    jz left1
    
    cmp charRecived,48h
    jz up1

    cmp charRecived,1Bh ;if key pressed is esc
    jnz return1
    
    mov recived,0
    mov bx , offset score1   
mov al , '7'
    mov [bx] , al
    inc bx 
mov al , '0'
    mov [bx] , al
    inc bx
    mov [bx] , al
    mov bx , offset score2   
mov al , '7'
    mov [bx] , al
    inc bx 
mov al , '0'
    mov [bx] , al
    inc bx
    mov [bx] , al
    jmp far ptr begin 
    

    
return1:     
    jmp move
down1:
jmp down
right1:
jmp right  
left1:
jmp left2
up1:
jmp up2
GoDown1:
jmp GoDown 
GoUP1:
jmp GoUP
GoRight1:
jmp GoRight
GoLeft1:
jmp GoLeft

;-----------------------------------------------------------------
down:
mov charsent,ah
     cmp score1,'0' 
     jnz continue
     cmp score1[1],'0'
     jnz continue
     cmp score1[2],'0'
     jnz continue
     jmp move
continue:   
         
     push dx
     push cx
     add dx,16
     cmp cx,6
     jnz sad
     cmp dx,115
     jnz sad
     mov si,16
     jmp DrawD

sad:     
     mov si,0 ;no of rows
Ren:
     mov di,0 ; no of pixels in a row
dmg: 
         
     mov ah,0dh
     mov bh,0
     int 10h   ;to get color of the pixel
     cmp al,0fh
     jz drawD
     cmp al , 4
     jz UPDATEHd
     cmp al,9
     jz thedog
     cmp al , 7
     jz takeskull
     inc di ;increase no of checked picxels in row
     inc cx ;move to next pixel
     cmp di,16 ;if we checked 16 pixel in a row mov to nxt rw
     jnz dmg
     sub cx,16;to return to beginning of row
     inc dx ;mov to nxt row
     inc si ;increse no of checked columns
     cmp si,17;if we checked 16 row then we checked all area , 17 not 16 cause there a line which is draw so u want to check after it
     jnz Ren ;to strt counting checked pixels in new row 
;---------------------------------------------------------------   
drawD:
     pop cx
     pop dx     
     call myC
     pop dx
     pop cx
     add dx,si;to move down by si
     cmp si,0
     jz increase
     call update1 
increase:
     lea si,mario
     call myA
     pop dx
     pop cx
     cmp cx,6
     jnz cont1
     cmp dx,115
     jnz cont1
     
     
     call senddata
     
          
     mov ah,0
     mov al,6
     int 10h
     
     mov ah , 2
     mov dx , 0a1eh
     int 10h  
     mov ah ,9
     cmp player,2
     jz loserr
     
     lea dx , winner
     int 21h
     loserr:
     lea dx , loser
     int 21h
     MOV AH, 4CH
     INT 21H
 cont1:
 cmp player,1    
     jz zeft6
     jmp go1
     zeft6:
     jmp zeft5

UPDATEHd:
call updated1heart
jmp drawD
takeskull:
call updated1skull
jmp drawD
thedog:
call update2
add si,16
jmp drawD

left2: 
jmp left

up2: 
jmp up
GoDown: jmp DownMario
GoUp: jmp UpMario
GoLeft: jmp LeftMario
GoRight: jmp RightMario  
      

;-----------------------------------------------------------------   
 right:        
 mov charsent,ah
     cmp score1,'0' 
     jnz continue1
     cmp score1[1],'0'
     jnz continue1
     cmp score1[2],'0'
     jnz continue1
     jmp move
continue1:
     
         
     push dx
     push cx
    
     
     add cx,16
     mov si,0 ;no of rows
RenR:
     mov di,0 ; no of pixels in a row
dmgR: 
         
     mov ah,0dh
     mov bh,0
     int 10h   ;to get color of the pixel
    
     cmp al,0fh
     jz drawR
      cmp al , 4
     jz UPDATEHr
     cmp al,9
     jz thedog1
     cmp al , 7
     jz takeskullr
     inc di ;increase no of checked picxels in row
     inc dx ;move to next pixel
     cmp di,16 ;if we checked 16 pixel in a row mov to nxt rw
     jnz dmgR
     sub dx,16;to return to beginning of row
     inc cx ;mov to nxt row
     inc si ;increse no of checked columns
     cmp si,16;if we checked 16 row then we checked all area
     jnz RenR ;to strt counting checked pixels in new row 
;---------------------------------------------------------------        
drawR:
    
     pop cx
     pop dx 
     call myC
     pop dx
     pop cx
     add cx,si
     cmp si,0
     jz increase1
     call update1 
increase1:
     lea si,mario
     call myA
     pop dx
     pop cx 
     cmp player,1
     jz zeft5
     jmp go1
     zeft5:
     jmp zeft4

;------------------------------------------------------  
UPDATEHr:
call updated1heart
jmp drawR
thedog1:
call update2
add si,16
jmp drawR
takeskullr:
call updated1skull
jmp drawR   
left:           
mov charsent,ah
     cmp score1,'0' 
     jnz continue2
     cmp score1[1],'0'
     jnz continue2
     cmp score1[2],'0'
     jnz continue2
     jmp move
continue2:
     
         
     push dx
     push cx
     sub cx,1
     mov si,0 ;no of rows
RenL:
     mov di,0 ; no of pixels in a row
dmgL: 
         
     mov ah,0dh
     mov bh,0
     int 10h ;to get color of the pixel
     cmp al,0fh
     jz drawL
     cmp al , 4
     jz UPDATEDHl
     cmp al,9
     jz thedog2
     cmp al , 7 
     jz takeskulll
     inc di ;increase no of checked pic=xels in row
     inc dx ;move to next pixel
     cmp di,16 ;if we checked 16 pixel in a row mov to nxt rw
     jnz dmgL
     sub dx,16;to return to beginning of row
     sub cx,1 ;mov to nxt row
     inc si ;increse no of checked columns
     cmp si,16;if we checked 16 row then we checked all area
     jnz RenL ;to strt counting checked pixels in new row 
;---------------------------------------------------------------        
drawL:
     pop cx
     pop dx 
     call myC
     pop dx
     pop cx
     sub cx,si
     cmp si,0
     jz increase2
     call update1 
increase2:
     lea si,mario
     call myA
     pop dx
     pop cx
     cmp player,1
     jz zeft4
     jmp go1 
     zeft4:
     jmp zeft3
UPDATEDHl:
call updated1heart

jmp drawL
thedog2:
call update2
add si,16
jmp drawL
takeskulll:
call updated1skull
jmp drawL     
up:            
mov charsent,ah
;---------------------------------------------------------------
     cmp score1,'0' 
     jnz continue3
     cmp score1[1],'0'
     jnz continue3
     cmp score1[2],'0'
     jnz continue3
     jmp move
continue3: 
     
         
     push dx
     push cx
     sub dx,1
     mov si,0 ;no of rows
RenU:
     mov di,0 ; no of pixels in a row
dmgU: 
         
     mov ah,0dh
     mov bh,0
     int 10h
     cmp al,0fh
     jz drawU
     cmp al , 4
     jz UPDATEDHu
     cmp al,9
     jz thedog3
     cmp al , 7 
     jz takeskullu
     inc di
     inc cx
     cmp di,16
     jnz dmgU
     sub cx,16
     dec dx
     inc si
     cmp si,17
     jnz RenU
;---------------------------------------------------------------   
drawU:
     pop cx
     pop dx     
     call myC
     pop dx
     pop cx
     sub dx,si
     cmp si,0
     jz increase3
     call update1 
increase3:
     lea si,mario
     call myA
     pop dx
     pop cx
     cmp player,1
     jz zeft3
     jmp go1
     ;--------------------------------------------------------------- 
     zeft3:
     jmp go21
UPDATEDHu:
call updated1heart
jmp drawU
thedog3:
call update2
add si,16
jmp drawU
takeskullu:
call updated1skull
jmp drawU    
DownMario:
;----------------------------------------------------------------- 
mov charsent,ah
     cmp score2,'0' 
     jnz continuea
     cmp score2[1],'0'
     jnz continuea
     cmp score2[2],'0'
     jnz continuea
     jmp move
continuea:
push cx
push dx
   
     mov cx,x
     mov dx,y
     add dx,16
     cmp cx,6
     jnz sad1
     cmp dx,115
     jnz sad1
     mov si,16
     jmp DrawD2
sad1:     
     mov si,0 ;no of rows
Ren2:
     mov di,0 ; no of pixels in a row
dmg2: 
         
     mov ah,0dh
     mov bh,0
     int 10h   ;to get color of the pixel
     cmp al,0fh
     jz drawD2
     cmp al,04h
     jz UPDATEDHD1s
     cmp al,9
     jz opas
cmp al , 7
     jz myt
     inc di ;increase no of checked pic=xels in row
     inc cx ;move to next pixel
     cmp di,16 ;if we checked 16 pixel in a row mov to nxt rw
     jnz dmg2
     sub cx,16;to return to beginning of row
     inc dx ;mov to nxt row
     inc si ;increse no of checked columns
     cmp si,17;if we checked 16 row then we checked all area
     jnz Ren2 ;to strt counting checked pixels in new row 
     jmp drawD2
;---------------------------------------------------------------   
myt :
jmp far ptr takeskulld2
UPDATEDHD1s:
jmp far ptr UPDATEDHD1
opas:
jmp far ptr opa
drawD2:

     mov cx,x
     mov dx,y
     call Clear
     mov cx,x
     mov dx,y
     add dx,si  ;to move down by si
     mov y,dx
     cmp si,0
     jz increasea
     call update2 
increasea:
     call DrawMario2
     
     mov cx,x
     mov dx,y
     cmp cx,6
     jnz cont
     cmp dx,115
     jnz cont
     
     call senddata
         
     mov ah,0
     mov al,6
     int 10h
     
     mov ah , 2
     mov dx , 0a1eh
     int 10h
       
     mov ah ,9
     cmp player,1
     jz loserrrr     
     lea dx , winner
     int 21h
     jmp e2fel
     loserrrr:
     lea dx , loser
     int 21h
     e2fel:
     MOV AH, 4CH
     INT 21H

UPDATEDHD1:
CALL updated2heart
jmp drawD2
opa:
call update1
add si,16
jmp drawD2
takeskulld2:
call updated2skull
jmp drawD2

     
cont:          
     pop dx
     pop cx
     cmp player,1
     jz zeft2
     jmp go22
;---------------------------------------------------------
zeft2:
jmp zeft1
UpMario:
;-----------------------------------------------------------------
mov charsent,ah
     cmp score2,'0' 
     jnz continueb
     cmp score2[1],'0'
     jnz continueb
     cmp score2[2],'0'
     jnz continueb
     jmp move
continueb:
push cx
push dx   
     mov cx,x
     mov dx,y
     sub dx,1
     mov si,0 ;no of rows
Ren3:
     mov di,0 ; no of pixels in a row
dmg3: 
         
     mov ah,0dh
     mov bh,0
     int 10h   ;to get color of the pixel
     cmp al,0fh
     jz drawU2

     cmp al,04h
     jz UPDATEDHU1
     cmp al,9
     jz opa2 
cmp al , 7
     jz takeskullu2
     inc di ;increase no of checked pic=xels in row
     inc cx ;move to next pixel
     cmp di,16 ;if we checked 16 pixel in a row mov to nxt rw
     jnz dmg3
     sub cx,16;to return to beginning of row
     dec dx ;mov to nxt row
     inc si ;increse no of checked columns
     cmp si,17;if we checked 16 row then we checked all area
     jnz Ren3 ;to strt counting checked pixels in new row
;---------------------------------------------------------------   
drawU2:
     mov cx,x
     mov dx,y
     call Clear
     mov cx,x
     mov dx,y
     sub dx,si;to move down by si
     mov y,dx
     cmp si,0
     jz increaseb
     call update2 
increaseb:
     call DrawMario2
     pop dx
     pop cx
    cmp player,1
     jz zeft1
     jmp go22
;---------------------------------------------------------
zeft1:
jmp zeft
UPDATEDHU1:
CALL updated2heart
jmp drawU2
opa2:
call update1
add si,16
jmp drawU2
takeskullu2:
call updated2skull
jmp drawU2

LeftMario:
;-----------------------------------------------------------------
mov charsent,ah
     cmp score2,'0' 
     jnz continuec
     cmp score2[1],'0'
     jnz continuec
     cmp score2[2],'0'
     jnz continuec
     jmp move
continuec:	
push cx
push dx

     mov cx,x
     mov dx,y
     sub cx,1
     mov si,0 ;no of rows
Ren4:
     mov di,0 ; no of pixels in a row
dmg4: 
         
     mov ah,0dh
     mov bh,0
     int 10h   ;to get color of the pixel
     cmp al,0fh
     jz drawL2
     cmp al,04h
     jz UPDATEDHL1
     cmp al,9
     jz opa1
cmp al , 7
     jz takeskulll2
     inc di ;increase no of checked pic=xels in row
     inc dx ;move to next pixel
     cmp di,16 ;if we checked 16 pixel in a row mov to nxt rw
     jnz dmg4
     sub dx,16;to return to beginning of row
     dec cx ;mov to nxt row
     inc si ;increse no of checked columns
     cmp si,16;if we checked 16 row then we checked all area
     jnz Ren4 ;to strt counting checked pixels in new row 
;---------------------------------------------------------------   
drawL2:
     mov cx,x
     mov dx,y
     call Clear
     mov cx,x
     mov dx,y
     sub cx,si;to move down by si
     mov x,cx
     cmp si,0
     jz increasec
     call update2 
increasec:
     call DrawMario2
     pop dx
     pop cx
     cmp player,1
     jz zeft
     jmp go22
;---------------------------------------------------------
zeft:
jmp go1
UPDATEDHL1:
CALL updated2heart
jmp drawL2
opa1:
call update1
add si,16
jmp drawL2
takeskulll2:
call updated2skull
jmp drawL2
RightMario:
;-----------------------------------------------------------------
mov charsent,ah
cmp score2,'0' 
     jnz continueq
     cmp score2[1],'0'
     jnz continueq
     cmp score2[2],'0'
     jnz continueq
     jmp move
continueq:
         
    
    
push cx
push dx 

     mov cx,x
     mov dx,y
     add cx,16
     mov si,0 ;no of rows
Ren5:
     mov di,0 ; no of pixels in a row
dmg5: 
         
     mov ah,0dh
     mov bh,0
     int 10h   ;to get color of the pixel
     cmp al,0fh
     jz drawR2
     ; Player Took a PowerUp " heart "
     cmp al , 4
     jz UPDATEDHR1
     cmp al,9
     jz opa5
cmp al , 7
     jz takeskullr2
     inc di ;increase no of checked pic=xels in row
     inc dx ;move to next pixel
     cmp di,16 ;if we checked 16 pixel in a row mov to nxt rw
     jnz dmg5
     sub dx,16;to return to beginning of row
     inc cx ;mov to nxt row
     inc si ;increse no of checked columns
     cmp si,16;if we checked 16 row then we checked all area
     jnz Ren5 ;to strt counting checked pixels in new row 
;---------------------------------------------------------------   
drawR2:
     mov cx,x
     mov dx,y
     call Clear
     mov cx,x
     mov dx,y
     add cx,si;to move down by si
     mov x,cx
     cmp si,0
     jz increased
     call update2 
increased:
     call DrawMario2
     pop dx
     pop cx
     cmp player,1
     jz go1
     jmp go22
;---------------------------------------------------------
UPDATEDHR1:
call updated2heart
jmp drawR2
opa5:
call update1
add si,16
jmp drawR2
takeskullr2:
call updated2skull
jmp drawR2          
go1:
mov Recived,0  
jmp move
go21:
jmp receiveb2a
go22: 
jmp receiveb2an

ret
game endp
;---------------------------------------------------------

;---------------------------------------------------------   
update1 proc near
push ax
push bx
push cx
push dx
mov bx , offset score1
inc bx
mov al , [bx]
cmp al , 48         ;if the number is zero we must add 9 and decreament the 5
jz one
mov ah , [bx]
dec ah 
mov [bx] , ah
mov al,0
mov ah , 13h
mov bh,0
mov cx , 3
mov dx , 0037
mov bp , offset score1
mov bl , 0fh
int 10h

jmp updated
one:;--------------------------------------
 dec bx
mov ah , [bx]
dec ah 
mov [bx],ah
inc bx
mov ah , [bx]
mov ah,57
mov [bx],ah
mov al,0
mov ah , 13h
mov bh,0
mov cx , 3
mov dx , 0037 
mov bp , offset score1
mov bl , 0fh
int 10h

updated:
pop dx
pop cx
pop bx 
pop ax
 ret


update1 endp
;---------------------------------------------------------  

;--------------------------------------------------------
updated1heart proc near

push ax
push dx
push bx

mov di , offset score1
mov ah ,[di]
inc ah 
mov [di] ,ah

mov ah , 13h
mov bh,0
mov cx , 3
mov dx , 0037
mov bp , offset score1
mov bl , 0fh
int 10h
add si , 16

      
pop bx
pop dx
pop ax
ret
updated1heart endp
;----------------------------------------------------------
updated2heart proc near
push ax
push dx
push bx

mov di , offset score2
mov ah ,[di]
inc ah 
mov [di] ,ah

mov ah , 13h
mov bh,0
mov cx , 3
mov dl,37
mov dh,23
mov bp , offset score2
mov bl , 0fh
int 10h
add si , 16

      
pop bx
pop dx
pop ax
 ret
updated2heart endp
;--------------------------------------------------------
updated1skull proc near
push ax
push dx
push bx

mov di , offset score1
mov ah ,[di]
cmp ah , '0'
jnz powe1
inc di
mov ah , '0'
mov [di] , ah
inc di 
mov [di] , ah
jmp lost1

powe1:
dec ah 
mov [di] ,ah
lost1:
mov ah , 13h
mov bh,0
mov cx , 3
mov dx , 0037
mov bp , offset score1
mov bl , 0fh
int 10h
add si , 15

      
pop bx
pop dx
pop ax
 ret
updated1skull endp
;--------------------------------------------------------
updated2skull proc near
push ax
push dx
push bx

mov di , offset score2
mov ah ,[di]
cmp ah , '0'
jnz powe
inc di
mov ah , '0'
mov [di] , ah
inc di 
mov [di] , ah
jmp lost

powe:
dec ah 
mov [di] ,ah
lost:
mov ah , 13h
mov bh,0
mov cx , 3
mov dl,37
mov dh,23
mov bp , offset score2
mov bl , 0fh
int 10h
add si , 15

      
pop bx
pop dx
pop ax
 ret
updated2skull endp
;--------------------------------------------------------
 update2 proc near
push ax
push bx
push cx
push dx
mov bx , offset score2
inc bx
mov al , [bx]
cmp al , 48         ;if the number is zero we must add 9 and decreament the 5
jz one1
mov ah , [bx]
dec ah 
mov [bx] , ah
mov al,0
mov ah , 13h
mov bh,0
mov cx , 3
mov dl,37
mov dh,23
mov bp , offset score2
mov bl , 0fh
int 10h

jmp updated2
one1:;--------------------------------------
 dec bx
mov ah , [bx]
dec ah 
mov [bx],ah
inc bx
mov ah , [bx]
mov ah,57
mov [bx],ah
mov al,0
mov ah , 13h
mov bh,0
mov cx , 3
mov dl,37
mov dh,23 
mov bp , offset score2
mov bl , 0fh
int 10h

updated2:
pop dx
pop cx
pop bx 
pop ax
 ret


update2 endp
;--------------------------------------------------------- 
chatmode proc near
mov ah ,0
mov al ,3
int 10h
mov ah,2
	mov dx,word ptr point
	int 10h 

	mov bl,0
	mov ax,0600h
	mov bh,01Fh
	mov cx,0
	mov dx,0B4fh
	int 10h	

	mov bl,0
	mov ax,0600h
	mov bh,4Fh
	mov cx,0C00h
	mov dx,184fh
	int 10h
	
	
	mov bh,0    
	
	call UARTConf  	
send?:
	mov dx , 3FDH    ; Line Status Register
	in al , dx 
  	test al , 1
  	JZ nextchat
	call Receive
	mov al,1 
	mov dx , 3FDH 
        out dx,al   
nextchat:
	mov ah,1
	int 16h
        jz send?
        mov ah,0
	int 16h
	call Send
	jmp send?
exit1:  	
	jmp far ptr begin  
chatmode endp
UARTConf Proc near

	mov dx,3fbh 			; Line Control Register
        mov al,10000000b		;Set Divisor Latch Access Bit
    	out dx,al			;Out it
    
        mov dx,3f8h			
    	mov al,0ch			
    	out dx,al
    
    	mov dx,3f9h
    	mov al,00h
    	out dx,al

    	mov dx,3fbh
    	mov al,00011011b
    	out dx,al
	ret
UARTConf endp

Send Proc near 
	
   	mov Value_S,al
	cmp al,27
        jz exit1
	
	mov ah,4Fh
	cmp byte ptr point,ah
	jb snot_end_line

	mov ah,18h
	cmp byte ptr point[1],ah
	jb scheck_enter1

	mov word ptr point,1800h
	mov ah,2
	mov dx,word ptr point
	int 10h 
	mov bl,0
	mov ax,0601h
	mov bh,04Fh
	mov cx,0c00h
	mov dx,184fh
	int 10h
	jmp sDisplay

snot_end_line:

	mov ah,18h
	cmp byte ptr point[1],ah
	jb scheck_enter1
	cmp al,0Dh
	jne sDisplay
	mov word ptr point,1800h
	mov bl,0
	mov ax,0601h
	mov bh,04Fh
	mov cx,0c00h
	mov dx,184fh
	int 10h
	jmp sDisplay

scheck_enter1:
	cmp al,0dh
	jne sDisplay
	mov byte ptr point,00h	
	inc byte ptr point[1]	
	jmp sDisplay
	
sDisplay:
	
	mov ah,2
	mov dx,word ptr point
	int 10h 
	mov dl , VALUE_S
	mov ah ,2 
  	int 21h

	mov ah,3h 
	mov bh,0h 
	int 10h
	mov word ptr point,dx

	mov dx ,3FDH		; Line Status Register
	AGAIN1:
  	In al,dx 			;Read Line Status
	test al , 00100000b
	jz AGAIN1

	mov dx , 3F8H		; Transmit data register
        mov  al,Value_S
  	out dx , al 
	ret
Send    endp

Receive proc near 

	mov dx , 03F8H
	in al , dx 
	mov VALUE_R , al
	
	mov ah,4Fh
	cmp byte ptr point2,ah
	jb not_end_line

	mov ah,0bh
	cmp byte ptr point2[1],ah
	jb Display

	mov word ptr point2,0B00h
	mov ah,2
	mov dx,word ptr point2
	int 10h 

	mov bl,0
	mov ax,0601h
	mov bh,01Fh
	mov cx,0
	mov dx,0B4fh
	int 10h
	jmp Display

not_end_line:

	mov ah,0bh
	cmp byte ptr point2[1],ah
	jb check_enter1
	cmp al,0Dh
	jne Display
	mov word ptr point2,0B00h
	mov bl,0
	mov ax,0601h
	mov bh,01Fh
	mov cx,0
	mov dx,0B4fh
	int 10h
	jmp Display

check_enter1:
	cmp al,0Dh
	jne Display
	mov byte ptr point2,00h	
	inc byte ptr point2[1]	
	jmp Display
	
Display:
	mov ah,2
	mov dx,word ptr point2
	int 10h 

        mov dl , VALUE_R
	mov ah ,2 
  	int 21h
	
	mov ah,3h 
	mov bh,0h 
	int 10h
	mov word ptr point2,dx
	ret
Receive endp
;-----------------------------------
SendData proc near
    ;to be done
    ;Check that Transmitter Holding Register is Empty
		mov dx , 3FDH		; Line Status Register
    In al , dx 			;Read Line Status
  		test al , 00100000b
    JZ Not_Empty ;Not empty

    ;If empty put the VALUE in Transmit data register
  		mov dx , 3F8H		; Transmit data register
        mov al,charSent
  		out dx , al  ; the charchter is in al
    Not_Empty:
    ret
SendData endp

RecieveData proc near
    ;to be done
    ;Check that Data is Ready
		mov dx , 3FDH		; Line Status Register
	    in al , dx 
  		test al , 1
  		JZ Not_Ready                                    ;Not Ready
     ;If Ready read the VALUE in Receive data register
  		mov dx , 03F8H
  		in al , dx ;value in the al display it 
        mov charRecived,al
        mov Recived,1
    Not_Ready:
    ret
RecieveData endp
random proc near
    mov ah, 2ch 
    int 21h     
    mov ax , dx  
    and ax , 3
    mov di , offset xs
    mov si , offset ys
mov bx , 2
    mul bx
    add di , ax 
    add si , ax    
    mov cx ,[di]
    mov ax ,[si]
ret
random endp
end MAIN

