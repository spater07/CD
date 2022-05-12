digit[0-9]
letter[A-Za-z]
%{
#include<stdio.h>
#include<string.h>
int num;
%}

/* Rules Section*/
%%
[0-9]+ {num=atoi(yytext);
if(num%7==0){num+=3;}
else if(num%2==0){num+=4;}
printf("%d", num);
}

%%

int main()
	{
	printf("Increment of 3 and 4 in digits, after divising by 7 and 2 respectively:- /n");
	yyin=fopen("prac2.txt","r");
	yylex();
	
	}

int yywrap()
	{
	return(1);
	}