%{ 
#include<stdio.h> 
#include<stdlib.h> 
int yyerror(char* msg); 
int yylex(void); 
%} 
%token A B C NL
%% 
stmt: A S B B C NL {printf("\nExpression is valid.\n"); 
 exit(0);} 
; 
S:A S B B
| 
; 
%% 
int yyerror (char *msg) { 
 printf ("\nExpression is invalid.\n", msg); 
} 
int main(){ 
printf("Enter an Expression: "); 
yyparse(); 
} 
int yywrap(){ return 1;} 