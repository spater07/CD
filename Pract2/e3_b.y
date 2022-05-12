%{
#include<stdio.h>
#include<stdlib.h>
int res=0;
%}
%token ALPHA DIGIT NL
%left '(' ')'
%right '='
%left '+' '-'
%left '*' '/'
%left '@'
%%
stmt : B NL {printf("Correct String for b part");
 exit(0);}

;

B : DIGIT '/' exp
;

exp : exp '+' exp
 | exp '-' exp
 | exp '*' exp
 | exp '/' exp
 | '(' exp ')'
 | ALPHA
 | DIGIT
;
%%
int yyerror(char *msg)
{
printf("invalid expression \n");
exit(0);
}
main()
{
printf("Enter an expression\n");
yyparse();
}
int yywrap() 
{return 1;}