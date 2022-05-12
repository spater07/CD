%{ 
#include<stdio.h>
#include<stdlib.h> 
int yyerror(char* msg); 
int yylex(void); 
%} 
%token NUMBER ID NL
%left '+' '-' 
%left '*' '/' 
%% 
stmt: exp {printf("\nExpression is valid.\n"); 
 exit(0);} 
; 
exp: exp '+' exp {printf("+");} 
| exp '*' exp {printf("*");} 
| exp '-' exp {printf("-");} 
| exp '/' exp {printf("/");} 
| '(' exp ')' 
| NUMBER {printf("%d", yylval);} 
| ID {printf("%c", (char)yylval);} 
; 
%% 
int main(){ 
printf("Enter an Expression: "); 
yyparse(); 
} 
int yyerror (char *msg) { 
 printf ("\nInvalid Expression.", msg); 
} 
int yywrap(){ return 1;} 