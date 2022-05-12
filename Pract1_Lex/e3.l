digit[0-9]
letter[A-Za-z]
%{
#include<stdio.h>
#include<string.h>
int i, len=0;
int n[20];
%}

/* Rules Section*/
%%
[a-zA-Z]+ {printf("%s: %d\n", yytext, yyleng);n[yyleng]++;}

%%

int main()
	{
	int a=0;
	for( a = 0; a < 20; a = a + 1 ){
      		n[a] = 0;
   	}
	yyin=fopen("prac3.txt","r");
	
	yylex();
	for( a = 0; a < 20; a = a + 1 ){
      		if(n[a]!=0)
			printf("Letter having %d words: %d\n", a, n[a]);
   	}
	
	}

int yywrap()
	{
	return(1);
	}