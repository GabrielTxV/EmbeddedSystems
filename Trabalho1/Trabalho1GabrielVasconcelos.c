// microprocessadores 2
/*
 * File:   Trabalho1GabrielVasconcelos.c
 * Author: Gabriel Vasconcelos
 *
 * Created on 29 de Agosto de 2023
 */


#include "configbits.h"

#include <xc.h>

#define _XTAL_FREQ 4000000 // frequência do "cristal"
#define DISPLAY LATD
#define DISP1 LATA2
#define DISP2 LATA3


void setup_hard(void);
void loop(void);
void setup(void);
void atraso( unsigned int tempo);

unsigned char conv7seg[17] = {   //display 7 segmentos
    0b00111111,
    0b00000110,
    0b01011011,
    0b01001111,
    0b01100110,
    0b01101101,
    0b01111101,
    0b00000111,
    0b01111111,
    0b01101111,
    0b01110111,
    0b01111100,
    0b00111001,
    0b01011110,
    0b01111001,
    0b01110001,
    0b00000000
};


int main(void) {
    
    setup_hard();
    while(1) loop();
}


void setup_hard(void) {
    
    ADCON1 = 0b00001111;
    TRISA = 0b11000011;
    TRISB = 0b11111111;
    TRISD = 0b00000000;
    setup();
    
}

void atraso( unsigned int tempo){
    
    unsigned int contador=1;
    
    while (contador < tempo) {
        __delay_ms(1);
        contador++;
    }
}

////////////////////////    LÓGICA    //////////////////////////

void entrada(void);
void processamento(void);
void saida(void);

unsigned char cont1,cont2, borda_d;
unsigned int numero = 0;


void setup(void) {
    
    DISP1=DISP2=0;
    
}

void loop(void) {
    entrada();
    processamento();
    saida();
    atraso(10);
    
}

void entrada(void) { 
    static unsigned char ent_ant=0b11111111;
    unsigned char ent_atual, ent_int;
    
    ent_atual = PORTB;
    
    ent_int = ent_atual ^ ent_ant;
    borda_d = ent_int & ent_ant;
    
    ent_ant = ent_atual;
    
}

void processamento(void) {
   /* 
    * 
    * RB3 PRESSIONADO = PRÓXIMO ESTADO
    * RB4 PRESSIONADO = ORDERM CRESCENTE
    * RB4 NÃO PRESSIONADO = ORDEM DECRESCENTE
    * RB5 PRESSIONADO = NÚMEROS PRIMOS
    * RB5 NÃO PRESSIONADO = MÚLTIPLOS DE 3
    * PRESSIONADO = 0     NÃO PRESSIONADO = 1
    * 
    */
    if (borda_d & 0b00001000){ // PASSA PARA O PRÓXIMO ESTADO
        if(PORTB & 0b00010000){  // ORDEM DECRESCENTE
            if(PORTB & 0b00100000){  // ORDEM DECRESCENTE DE MÚLTIPLOS DE 3
               switch(numero){
                    case 0:
                      numero = 15;
                      cont1 = 1;
                      cont2 = 5;
                      break;
                    case 1:
                      numero = 0;
                      cont1 = 16;
                      cont2 = 0;
                      break;
                    case 2:
                      numero = 0;
                      cont1 = 16;
                      cont2 = 0;
                      break;
                    case 3:
                      numero = 0;
                      cont1 = 16;
                      cont2 = 0;
                      break;
                    case 4:
                      numero = 3;
                      cont1 = 16;
                      cont2 = 3;
                      break;
                    case 5:
                      numero = 3;
                      cont1 = 16;
                      cont2 = 3;
                      break;  
                    case 6:
                      numero = 3;
                      cont1 = 16;
                      cont2 = 3;
                      break;
                    case 7:
                      numero = 6;
                      cont1 = 16;
                      cont2 = 6;
                      break;
                    case 8:
                      numero = 6;
                      cont1 = 16;
                      cont2 = 6;
                      break;   
                    case 9:
                      numero = 6;
                      cont1 = 16;
                      cont2 = 6;
                      break; 
                    case 10:
                      numero = 9;
                      cont1 = 16;
                      cont2 = 9;
                      break; 
                    case 11:
                      numero = 9;
                      cont1 = 16;
                      cont2 = 9;
                      break;
                    case 12:
                      numero = 9;
                      cont1 = 16;
                      cont2 = 9;
                      break; 
                    case 13:
                      numero = 12;
                      cont1 = 1;
                      cont2 = 2;
                      break;
                    case 14:
                      numero = 12;
                      cont1 = 1;
                      cont2 = 2;
                      break;
                    case 15:
                      numero = 12;
                      cont1 = 1;
                      cont2 = 2;
                      break;    
                }
            }
            
            else{   // ORDEM DESCRESCENTE DE NÚMEROS PRIMOS
                switch(numero){
                    case 0:
                      numero = 13;
                      cont1 = 1;
                      cont2 = 3;
                      break;
                    case 1:
                      numero = 13;
                      cont1 = 1;
                      cont2 = 3;
                      break;
                    case 2:
                      numero = 13;
                      cont1 = 1;
                      cont2 = 3;
                      break;
                    case 3:
                      numero = 2;
                      cont1 = 16;
                      cont2 = 2;
                      break;
                    case 4:
                      numero = 3;
                      cont1 = 16;
                      cont2 = 3;
                      break;
                    case 5:
                      numero = 3;
                      cont1 = 16;
                      cont2 = 3;
                      break;  
                    case 6:
                      numero = 5;
                      cont1 = 16;
                      cont2 = 5;
                      break;
                    case 7:
                      numero = 5;
                      cont1 = 16;
                      cont2 = 5;
                      break;
                    case 8:
                      numero = 7;
                      cont1 = 16;
                      cont2 = 7;
                      break;   
                    case 9:
                      numero = 7;
                      cont1 = 16;
                      cont2 = 7;
                      break; 
                    case 10:
                      numero = 7;
                      cont1 = 16;
                      cont2 = 7;
                      break; 
                    case 11:
                      numero = 7;
                      cont1 = 16;
                      cont2 = 7;
                      break;
                    case 12:
                      numero = 11;
                      cont1 = 1;
                      cont2 = 1;
                      break; 
                    case 13:
                      numero = 11;
                      cont1 = 1;
                      cont2 = 1;
                      break;
                    case 14:
                      numero = 13;
                      cont1 = 1;
                      cont2 = 3;
                      break;
                    case 15:
                      numero = 13;
                      cont1 = 1;
                      cont2 = 3;
                      break;    
                
            }
        }
    }
        
        else{  // ORDEM CRESCENTE
            if(PORTB & 0b00100000){   // ORDEM CRESCENTE DE MÚLTIPLOS DE 3
                switch(numero){
                    case 0:
                       numero = 3;
                       cont1 = 16;
                       cont2 = 3;
                       break;
                    case 1:
                       numero = 3;
                       cont1 = 16;
                       cont2 = 3;
                       break;
                    case 2:
                       numero = 3;
                       cont1 = 16;
                       cont2 = 3;
                       break;
                    case 3:
                       numero = 6;
                       cont1 = 16;
                       cont2 = 6;
                       break;
                    case 4:
                       numero = 6;
                       cont1 = 16;
                       cont2 = 6;
                       break;
                    case 5:
                       numero = 6;
                       cont1 = 16;
                       cont2 = 6;
                       break;  
                    case 6:
                       numero = 9;
                       cont1 = 16;
                       cont2 = 9;
                       break;
                    case 7:
                       numero = 9;
                       cont1 = 16;
                       cont2 = 9;
                       break;
                    case 8:
                       numero = 9;
                       cont1 = 16;
                       cont2 = 9;
                       break;   
                    case 9:
                       numero = 12;
                       cont1 = 1;
                       cont2 = 2;
                       break; 
                    case 10:
                       numero = 12;
                       cont1 = 1;
                       cont2 = 2;
                       break; 
                    case 11:
                       numero = 12;
                       cont1 = 1;
                       cont2 = 2;
                       break;
                    case 12:
                       numero = 15;
                       cont1 = 1;
                       cont2 = 5;
                       break; 
                    case 13:
                       numero = 15;
                       cont1 = 1;
                       cont2 = 5;
                       break; 
                    case 14:
                       numero = 15;
                       cont1 = 1;
                       cont2 = 5;
                       break; 
                    case 15:
                       numero = 0;
                       cont1 = 16;
                       cont2 = 0;
                       break;    
                }
            }
            else{    // ORDEM CRESCENTE DE NÚMEROS PRIMOS
                switch(numero){
                    case 0:
                      numero = 2;
                      cont1 = 16;
                      cont2 = 2;
                      break;
                    case 1:
                      numero = 2;
                      cont1 = 16;
                      cont2 = 2;
                      break;
                    case 2:
                      numero = 3;
                      cont1 = 16;
                      cont2 = 3;
                      break;
                    case 3:
                      numero = 5;
                      cont1 = 16;
                      cont2 = 5;
                      break;
                    case 4:
                      numero = 5;
                      cont1 = 16;
                      cont2 = 5;
                      break;
                    case 5:
                      numero = 7;
                      cont1 = 16;
                      cont2 = 7;
                      break;
                    case 6:
                      numero = 7;
                      cont1 = 16;
                      cont2 = 7;
                      break;
                    case 7:
                      numero = 11;
                      cont1 = 1;
                      cont2 = 1;
                      break;
                    case 8:
                      numero = 11;
                      cont1 = 1;
                      cont2 = 1;
                      break;   
                    case 9:
                      numero = 11;
                      cont1 = 1;
                      cont2 = 1;
                      break; 
                    case 10:
                      numero = 11;
                      cont1 = 1;
                      cont2 = 1;
                      break; 
                    case 11:
                      numero = 13;
                      cont1 = 1;
                      cont2 = 3;
                      break;
                    case 12:
                      numero = 13;
                      cont1 = 1;
                      cont2 = 3;
                      break; 
                    case 13:
                      numero = 2;
                      cont1 = 16;
                      cont2 = 2;
                      break;
                    case 14:
                      numero = 2;
                      cont1 = 16;
                      cont2 = 2;
                      break;
                    case 15:
                      numero = 2;
                      cont1 = 16;
                      cont2 = 2;
                      break;}    
            }
        }
    }
}

void saida(void) {
    
    unsigned int tempo = 10;
    DISP2 = 0;
    DISP1 = 1;
    DISPLAY = conv7seg[cont1];
    atraso(tempo);
    DISP2 = 1;
    DISP1 = 0;
    DISPLAY = conv7seg[cont2];
    atraso(tempo);
}