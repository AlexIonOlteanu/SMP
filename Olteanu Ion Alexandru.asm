INCLUDE 'emu8086.inc'
jmp code

w equ 50 ; dimensiune dreptunghi
h equ 25

code:   mov ah, 0
        mov al, 13h ; trecere in mod grafic 320x200
        int 10h
                 
; afisare latura superioara
    mov cx, 100+w  ; coloana
    mov dx, 100
    mov al, 15
u1: mov ah, 0ch

    int 10h
    dec cx
    cmp cx, 100
    jae u1
    ; afisare latura inferioare
    mov cx, 100+w
    mov dx, 100+h
    mov al, 15
u2: mov ah, 0ch
    int 10h
    dec cx
    cmp cx, 100
    ja u2
    ; latura din stanga
    mov cx, 100
    mov dx, 100+h
    mov al, 15
u3: mov ah, 0ch
    int 10h
    dec dx
    cmp dx, 100
    ja u3
    ; latura din dreapta
    mov cx, 100+w
    mov dx, 100+h
    mov al, 15
u4: mov ah, 0ch
    int 10h
    dec dx
    cmp dx, 100
    ja u4
    
    ;afisare linie acoperisi dreapta
    mov cx, 100+w
    mov dx, 100
    mov al, 15 
u52: mov ah, 0ch
    int 10h
    dec dx
    dec cx
    cmp cx, 125
    ja u52 
     ;afisare linie acoperisi stanga
    mov cx, 100
    mov dx, 100
    mov al, 15 
        
u62: mov ah, 0ch
    int 10h
    dec dx
    inc cx
    cmp cx, 125
    jb u62
      
    ;efect 3D
    mov cx, 100+w
    mov dx, 100+h
    mov al, 15
u7: mov ah, 0ch
    int 10h
    dec dx
    inc cx
    cmp cx, 159
    jbe u7  
    ;efect 3D      
    mov cx, 100+w
    mov dx, 100
    mov al, 15
u8: mov ah, 0ch
    int 10h
    dec dx
    inc cx
    cmp cx, 159
    jbe u8          
    
     ;efect 3D
    mov cx, 159
    mov dx, 116
    mov al, 15
u9: mov ah, 0ch
    int 10h
    dec dx
    cmp dx, 91
    jae u9     
     ;efect 3D acoperisi
    mov cx, 159
    mov dx, 91
    mov al, 15
u10: mov ah, 0ch
    int 10h
    dec cx 
    dec cx
    dec dx
    cmp cx, 125
    ja u10
    ;afisare usa         
    mov cx, 120
    mov dx, 100+h
    mov al, 15
u11: mov ah, 0ch
    int 10h
    dec dx
    cmp dx, 109
    ja u11
    
     ;afisare usa
    mov cx, 130
    mov dx, 100+h
    mov al, 15
u12: mov ah, 0ch
    int 10h
    
    dec dx
    cmp dx, 109
    ja u12 
    
    ;afisare usa        
    mov cx, 130
    mov dx, 109
    mov al, 15
    u131: mov ah, 0ch
    int 10h
    dec cx 
    cmp cx, 120
    jae u131           
    
    ;afisare geam dreapta
     mov cx, 145
    mov dx, 105
    mov al, 15

    u151: mov ah, 0ch
    int 10h
    dec cx 
    cmp cx, 135
    jae u151 
    ;afisare geam dreapta
    mov cx, 145
    mov dx, 115
    mov al, 15

    u152: mov ah, 0ch
    int 10h
    dec cx 
    cmp cx, 135
    jae u152
    
    ;afisare geam dreapta
    mov cx, 145
    mov dx, 115
    mov al, 15

    u153: mov ah, 0ch
    int 10h
    dec dx 
    cmp dx, 105
    jae u153
    
    ;afisare geam dreapta
    mov cx, 135
    mov dx, 115
    mov al, 15

    u154: mov ah, 0ch
    int 10h
    dec dx 
    cmp dx, 105
    jae u154
      
    ;afisare geam stanga
    mov cx, 115
    mov dx, 105
    mov al, 15
    
    u171: mov ah, 0ch
    int 10h
    dec cx 
    cmp cx, 105
    jae u171  
    
    
    ;afisare geam stanga
    mov cx, 115
    mov dx, 115
    mov al, 15
    
    u172: mov ah, 0ch
    int 10h
    dec cx 
    cmp cx, 105
    jae u172 
    
    
    ;afisare geam stanga
    mov cx, 115
    mov dx, 115
    mov al, 15
    
    u173: mov ah, 0ch
    int 10h
    dec dx 
    cmp dx, 105
    jae u173 
    
    
    ;afisare geam stanga
    mov cx, 105
    mov dx, 115
    mov al, 15
    
    u174: mov ah, 0ch
    int 10h
    dec dx 
    cmp dx, 105
    jae u174
        
start:                
PUTC    13 ; linie noua
PUTC    10
         ;sitirea de la tastatura
LEA     SI, msg
CALL    print_string
CALL    scan_num                
                           
        ; verificare alegere
cmp cx,1
je hasurare
cmp cx,2
je scari
cmp cx,3
je strada
PRINTN 'Introdu 1,2 sau 3!'
jmp sfarsit 

; etapa de hasurare
hasurare:   

;hasurare acoperisi
    mov cx, 99+w
    mov bx, 99+w
    mov dx, 100
    mov al, 15 
    
u51:    
u5: mov ah, 0ch
    int 10h
    dec dx
    dec cx
    cmp cx, 125
    jae u5 
    mov dx,100
    dec bx
    mov cx, bx
    
    cmp bx,125
    ja u51                           
                           
                           
  ;hasurare acoperisi                         
   mov cx, 101
    mov dx, 100
    mov bx, 101
    mov al, 15 
    
u61:    
u6: mov ah, 0ch
    int 10h
    dec dx
    inc cx
    cmp cx, 125
    jbe u6
    mov dx,100
    inc bx
    mov cx, bx
    
    cmp bx,125
    jb u61
                     
    ;hasurare usa        
    mov cx, 130
    mov dx, 110
    mov al, 15

u14:    
 
    u13: mov ah, 0ch
    int 10h
    dec cx 
    cmp cx, 120
    ja u13         
    mov cx, 130
    inc dx
    cmp dx,125
   jb u14     
        
    ;hasurare fereastra dreapta   
    mov cx, 144
    mov dx, 106
    mov al, 15

u16:    
 
    u15: mov ah, 0ch
    int 10h
    dec cx 
    cmp cx, 135
    ja u15         
    mov cx, 145
    inc dx
    cmp dx,115
    jb u16     
     ;hasurare fereastra stanga
    mov cx, 114
    mov dx, 106
    mov al, 15

u18:    
 
    u17: mov ah, 0ch
    int 10h
    dec cx 
    cmp cx, 105
    ja u17         
    mov cx, 115
    inc dx
    cmp dx,115
    jb u18  
                
                
                
jmp sfarsit                
                
   ;afisare scari             
scari:                
    mov cx, 120
    mov dx, 126
    mov bx, 130 
    mov al, 15

u19:  
        
      
 
    u20:  
    
    mov al, 7
    mov ah, 0eh

    int 10h
     mov ah, 0ch
    int 10h
    inc cx 
    cmp cx, bx
    jbe u20         
    sub bx, 2
    mov cx, bx
    sub cx, 10
    add dx, 3
    cmp dx,169
    jb u19
           
           
 jmp sfarsit
    ;afisare strada
 strada: 
    ;afisare linie continua     
    mov cx, 20
    mov dx, 169
    mov al, 15
        
 u21:
    mov ah, 0ch
    int 10h
    inc cx 
    cmp cx,300
    jbe u21   
  
    ;afisare linie discontinua
    mov cx, 20
    mov dx, 190
    mov bx, 35 
    mov al, 15

u23:    
 
    u22:
     mov ah, 0ch
    int 10h
    inc cx 
    cmp cx, bx
    jbe u22         
    add bx, 40
    add cx, 25
    cmp cx,300
    jb u23              
             
             
 sfarsit:     
    mov ah,00
    int 16h
 jmp start   
                 
                 

msg     DB      '1-hasurare,2-scari,3-strada: ', 0   ; msg afisat pe ecran
DEFINE_SCAN_NUM
DEFINE_PRINT_STRING
DEFINE_PRINT_NUM
DEFINE_PRINT_NUM_UNS

    
    
    
    