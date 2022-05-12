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
stmt: exp NL{printf("\nExpression is valid.\n"); 
 exit(0);} 
; 
exp: exp '+' exp ; 
| exp '*' exp ; 
| exp '-' exp ; 
| exp '/' exp ; 
| '(' exp ')' 
| NUMBER ; 
| ID ; 
; 
%% 
int main(){ 
printf("Enter an Expression: "); 
yyparse(); 
} 

int yyerror (char *msg) { 
 printf ("Invalid Expression.", msg); 
} 
int yywrap(){ return 1;} 