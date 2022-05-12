%{
#include<stdio.h>
#include<string.h>
%}
%%
"<"[^>]*> {}
[a-zA-Z]+ {printf("%s", yytext);}	
%%

int yywrap(){}

int main(){
	yyin = fopen("prac5.txt","r");
	yylex();
}