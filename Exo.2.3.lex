%{
#include <stdio.h>
#include <string.h>
void yyerror(const char *s);
int yylex(void);
%}

%token dossier
%token codeDossier
%token codeConcert
%token date
%token heure
%token nb
%token places
%token nomConcert
%token prenomNom
%token FinFichier
%token RC
%token Pliste

%%

input:
	dossier codeDossier RC
	prenomNom RC
	concerts
	FinFichier
	;

concerts:
	concert concerts
	|
	;

concert:
	codeConcert nomConcert date heure nb places PListe RC
	;

%%

int main(void) {
    if (yyparse() == 0)
        printf("La commande est valide.\n");
    else
        printf("syntax error.\n");
    return 0;
}