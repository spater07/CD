%{ 
#include<stdio.h> 
#include<stdlib.h> 
int yyerror(char* msg); 
int yylex(void); 
int res=0; 
%} 
%token ZERO ONE NL
%% 
stmt: ZERO NL {printf("Expression starts and ends with 0.\n"); 
 exit(0);} 
|ONE NL {printf("Expression starts and ends with 1.\n"); 
 exit(0);} 
%% 
int yyerror(char *msg){ 
 printf("Expression does not start and end with 0 or 1.\n Invalid Expression"); 
 exit(0); 
} 
void main(){ 
 printf("Enter expression:"); 
 yyparse(); 
} 
int yywrap(){return 1;} 