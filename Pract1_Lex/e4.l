/*
E4: Write a LEX specification to search the input file. Let the input file contain some text, comments and digits.
(i)       Convert text present in file to LOWERCASE.
(ii)      Report occurrence of comments and special characters.
*/
digit[0-9]
lower[a-z]
upper[A-Z]
%{
#include<stdio.h>
#include<string.h>
int comments=0, special = 0;
%}

/* Rules Section*/
%%
{upper} {
    printf("%c", (int)yytext[0] + 32);
}
"//".*\n {comments++;}
"/*".*"*/"\n {comments++;}
[^\n {upper}{lower}{digit}] {special++;}
%%

int main(){
	
	yyin=fopen("Prac4.txt","r");
	yylex();
	printf("\nComments: %d\n", comments);
    printf("Specials: %d\n",special);
	}

int yywrap()
	{
	return(1);
	}