%{
#include <stdio.h>
#include <string.h>

//variables globales
char prenomNom[100]; //guardamos el prenomNom de la persona 
int nbConcerts = 0; //Cuanta la cantidad de conciertos que tiene el dossier actual
int etat = 0;       //Indica si estamos dentro del dossier activo (1) o no (0)
%}

%%

Dossier {
    //SI ya estabamos procesando un dossier, lo cerramos 
    if (etat == 1 && strlen(prenomNom) > 0 && nbConcerts > 0) {
        printf("%s a acheté des places de %d concerts.\n", prenomNom, nbConcerts);
    }
    //comenzamos un nuevo dossier 
    etat = 1;
    nbConcerts = 0;
    prenomNom[0] = '\0'; //vaciamos el nombre 
}

//detectamos el codigo de dossier de 8 digitos pero no hacemos nada
[0-9]{8} { /* Código dossier - ignorar */ }

//cada que entramos a un codigo de concierto T algo aumentamos el contador en 1
T[0-9]{2,6} {
    if (etat == 1) {
        nbConcerts++;
    }
}

//detectamos la fecha, hora, etc pero no hacemos nada 
[0-9]{1,2}\/[0-9]{1,2}(\/[0-9]{2,4})? { /* Fecha - ignorar */ }
[0-9]{1,2}:[0-9]{2} { /* Hora - ignorar */ }
[1-9][0-9]? { /* Número de plazas - ignorar */ }
places { /* palabra "places" - ignorar */ }
[A-Z0-9]+(-[A-Z0-9]+)* { /* Nombre concierto - ignorar */ }

//capturamos el prenombre (nombre y apellido) y lo copiamos en prenomNom
[A-Z]+(-[A-Z]+)*\/[A-Z]+(-[A-Z]+)* {
    if (etat == 1) {
        strcpy(prenomNom, yytext);
    }
}

[\r\n]+ { /* Saltos de línea - ignorar */ }
[ \t]+   { /* Espacios o tabs - ignorar */ }
.        { /* Otros caracteres - ignorar */ }

%%

int main(void) {
    yylex(); // corre el lexer

    // Si tenemos un dossier abierto, se tiene que imprimir 
    if (etat == 1 && strlen(prenomNom) > 0 && nbConcerts > 0) {
        printf("%s a acheté des places de %d concerts.\n", prenomNom, nbConcerts);
    }

    printf("FinFichier\n");
    return 0;
}


