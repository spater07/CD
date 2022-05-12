digit[0-9]
letter[A-Za-z]
%{
#include<stdio.h>
#include<string.h>
int key = 0;
int identifiers = 0;
int ops = 0;
int sys = 0;
int strings = 0;
int digits = 0;
char *c[100];
%}

/* Rules Section*/
%%
begin|switch|int|float|if|else|while|return|print|end {c[0] = yytext;  printf("%s AAA \n", *c);key++;}
{letter}({letter}|{digit})* {c[0] = yytext;  printf("%s III \n", *c);identifiers++;}
[\+\-\*\%\/] {ops++;}
\" {strings++;}
[0-9] {digits++;printf("%d", atoi(yytext)+2);}
[^A-Za-z0-9] {sys++;}

%%

int main()
	{
	yyin=fopen("prac1.txt","r");

	yylex();
	printf("\nkeywords %d\n", key);
	printf("identifiers %d\n", identifiers);
	printf("operators %d\n", ops);
	printf("symbols %d\n", sys);
	printf("strings %d\n", strings);
	printf("digits %d\n", digits);
	return 0;
	}

int yywrap()
	{
	return(1);
}