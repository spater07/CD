%{ 
#include<stdio.h> 
#include<stdlib.h> 
int yyerror(char* msg); 
int yylex(void); 
%} 
%token A B NUM
%% 
stmt: A '@' B '+' NUM '-' NUM {printf("\nExpression is valid.\n"); 
 exit(0);} 
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