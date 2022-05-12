
%{
#include<stdio.h>
#include<string.h>
int tcs=0, infosys=0, wipro=0, accenture=0, informatica=0, male=0, female=0, cse=0, it=0, ec=0;
%}

%%
"TCS"  tcs++;
"Infosys" infosys++;

"Wipro" wipro++;

"Accenture" accenture++;

"Informatica" informatica++;	

"Male" male++;

"Female" female++;

"CSE" cse++;

"IT" it++;

"EC" ec++;

[A-Z][a-z]+ {printf("\nName: %s",yytext);}
[0-9]"."[0-9]+ {printf("\nCGPA: %s",yytext);}
[0-9]{6} {printf("\nPackage: %s",yytext);}
[a-z]*"@"[a-z]+ {printf("\nMail id: %s",yytext);}
[0-9]{10}+ {printf("\nMobile: %s",yytext);}

%%

int main(){
	yyin = fopen("prac7.txt","r");
	yylex();
	printf("\nNo. of students placed in TCS: %d",tcs);
	printf("\nNo. of students placed in Infosys: %d",infosys);
	printf("\nNo. of students placed in Wipro: %d",wipro);
	printf("\nNo. of students placed in Accenture: %d",accenture);
	printf("\nNo. of students placed in Informatica: %d",informatica);
	printf("\nNo. of Male candidates: %d",male);
	printf("\nNo. of Female candidates: %d",female);
	printf("\nNumber of CSE candidates: %d",cse);
	printf("\nNumber of IT candidates: %d",it);
	printf("\nNumber of ECE candidates: %d",ec);
}

int yywrap(){
	return 1;
}