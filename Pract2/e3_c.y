%{ 
#include<stdio.h> 
#include<stdlib.h> 
#include<string.h> 
int yyerror(char* msg); 
int yylex(void); 
%} 
%token NUM 
%% 
stmt : A {printf("\nValid EXPRESSION : Accepted\n"); exit(0);} 
A : NUM '=' NUM '*' NUM
; 
%% 
int yyerror(char *msg){ 
 printf("Invalid Expression.\n"); 
 exit(0); 
} 
void main() 
{ 
 printf("\nEnter Expression: "); 
 yyparse(); 
} 
int yywrap(){return (1);}