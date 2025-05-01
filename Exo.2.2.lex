%{
#include <stdio.h>
%}

%%

Dossier                     { printf("dossier "); } //palabra clave dossier 
[0-9]{8}                    { printf("codeDossier "); } //codigo de 8 digitos 12345678
T[0-9]{2,6}                 { printf("codeConcert "); } //codigo de concierto que inicia con T seguido de 2 a 6 digitos
[0-9]{1,2}\/[0-9]{1,2}(\/[0-9]{2,4})?     { printf("date "); } //fecha en formato DD/MM o DD/MM/YY o DD/MM/YYYY
[0-9]{1,2}:[0-9]{2}         { printf("heure "); } // hora en formato HH:MM
[1-9][0-9]?                 { printf("nb "); } // Numero de plazas entre 1 - 99
places                      { printf("places "); } //palabra clave "places"
[A-Z0-9]+(-[A-Z0-9]+)*      { printf("nomConcert "); } // nombre del concierto con letras o digitos y guion opcional
[A-Z]+(-[A-Z]+)*\/[A-Z]+(-[A-Z]+)*    { printf("prenomNom "); } //nombre y apellido en mayusculas separado por - si hay 
[\r\n]+                     { printf("RC\n"); } //Retorno de carro o linea nueva , cuenta las lineas
[ \t]+                      { /* Ignorar espacios/tabs */ } //Espacios o tabs se ignoran 
.                           { /* Ignorar otros caracteres */ } //Cualquier otro caracter no reconocido se ignora 
FinFichier                  { printf("FinFichier "); } //palabra clave FinFichier que marca final del archivo

%%

int main(void) {
    yylex(); //se llama al analizador para procesar entrada 
    printf("FinFichier\n"); //imprime cuando termina todo
    return 0;
}
