#include "p16F628a.inc" ;incluir librerias relacionadas con el dispositivo
__CONFIG _FOSC_INTOSCCLK & _WDTE_OFF & _PWRTE_OFF & _MCLRE_OFF & _BOREN_OFF & _LVP_OFF & _CPD_OFF & _CP_OFF
;configuración del dispositivotodo en OFF y la frecuencia de oscilador
;es la del "reloj del oscilador interno" (INTOSCCLK)
RES_VECT CODE 0x0000 ; processor reset vector
GOTO START ; go to beginning of program
; TODO ADD INTERRUPTS HERE IF USED
MAIN_PROG CODE ; let linker place main program
;variables para el contador:
i equ 0x30
j equ 0x31
k equ 0x32
m equ 0x33

w equ 0x34
x equ 0x35
y equ 0x36
z equ 0x37
;inicio del programa:
START
MOVLW 0x07 ;Apagar comparadores
MOVWF CMCON
BCF STATUS, RP1 ;Cambiar al banco 1
BSF STATUS, RP0
MOVLW b'11000000' ;Establecer puerto B como salida (los 8 bits del puerto)
MOVWF TRISB
BCF STATUS, RP0 ;Regresar al banco 0

INICIO
inicio:
CLRW PORTB
bcf PORTB,0 ;poner el puerto B0 (bit 0 del puerto B) en 0
;Encender rojo1 y verde2
MOVLW b'00100001'
MOVWF PORTB
    NOP
;Esperar 5 seg
call tiempo5
;Encender rojo1 y amarillo2
MOVLW b'00100010'
MOVWF PORTB
;Esperar 1 seg
call tiempo1
nop
nop
NOP
NOP
    NOP
;Encender verde1 y rojo2
MOVLW b'00001100'
MOVWF PORTB
;Esperar 5 seg
call tiempo5
;Encender amarillo1 y rojo2
MOVLW b'00010100'
MOVWF PORTB
;Esperar 1 seg
call tiempo1
goto inicio ;regresar y repetir

  
;rutina de tiempo
tiempo1:
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
movlw d'11' ;establecer valor de la variable k
movwf m
mloop:
decfsz m,f
goto mloop
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
movlw d'73' ;establecer valor de la variable i
movwf i
iloop:
;NOPs de relleno (ajuste de tiempo)
movlw d'82' ;establecer valor de la variable j
movwf j
jloop:
nop ;NOPs de relleno (ajuste de tiempo)
movlw d'54' ;establecer valor de la variable k
movwf k
kloop:
decfsz k,f
goto kloop
decfsz j,f
goto jloop
decfsz i,f
goto iloop
return ;salir de la rutina de tiempo y regresar al
;valor de contador de programa
    
    
;rutina de tiempo
tiempo5:
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
movlw d'117' ;establecer valor de la variable k
movwf w
wloop:
decfsz w,f
goto wloop
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
movlw d'239' ;establecer valor de la variable i
movwf x
xloop:
;NOPs de relleno (ajuste de tiempo)
movlw d'235' ;establecer valor de la variable j
movwf y
yloop:
nop ;NOPs de relleno (ajuste de tiempo)
movlw d'28' ;establecer valor de la variable k
movwf z
zloop:
decfsz z,f
goto zloop
decfsz y,f
goto yloop
decfsz x,f
goto xloop
return ;salir de la rutina de tiempo y regresar al
;valor de contador de programa
END