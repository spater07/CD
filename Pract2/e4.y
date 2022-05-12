%{
#include<stdio.h>
#include<stdlib.h>
%}

%token ID BOP UOP NUMBER DO WHILE 

%%
prg:DO codeblock WHILE '(' lexp ')' ';' {printf("DO while Loop is  VALID"); exit(0);}
;
codeblock:'{' stmt_list '}'
;
stmt_list: stmt_list stmt
|
;
stmt: lexp ';'
;
lexp: fexp		
|				
;
fexp: fexp ',' exp		
|exp
|'(' fexp ')'			
;
exp: ID BOP exp			
| ID UOP			
| UOP ID
| ID
| NUMBER
;
%%

int main()
{
yyparse();
printf(" Valid Expression \n");
}

yyerror(char *msg)
{
printf("error");
exit(0);
}
