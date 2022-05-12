%{
#include<stdio.h>
#include<string.h>
char date[15],sem[50];
int question=0,words=0,lines=0,small=0,capital=0,digit=0,special=0;
%}

%%

"Sem:".* {
    strcpy(sem,yytext);
    int i=0;
    int space=1;
    for(i=0;sem[i]!='\0';i++){
        if(sem[i]>='A' && sem[i]<='Z'){
            capital++;
        }else if(sem[i]>='a' && sem[i]<='z'){
            small++;
        }else{
            special++;
        }
    }
}

"Question" question++;
\n {lines++;words++;}
[\t ' '] words++;
[a-z]+ small++;
[A-Z]+ capital++;
[0-9] digit++;
[!|@|#|$|%|^|&|*|_|(|)|<|>|?|:|"|;|'|.|,] special++;

[0-9][0-9]"/"[0-9][0-9]"/"[0-9]* {
    strcpy(date,yytext);
    special+=2;
    words++;
    int d=0;
    for(d=0;date[d]!='\0';d++){
        if(date[d]>='0' && date[d]<='1'){
            digit++;
        }
    }
 }
%%

main()
{
yyin=fopen("prac6.txt","r");
yylex();
printf("%s\n",sem);
printf("Date is %s\n",date);
printf("No. of Questions: %d\n",question);
printf("No. of Words: %d\n",words);
printf("No. of Lines: %d\n",lines);
printf("No. of Small Letters are %d\n",small);
printf("No. of Capital Letters: %d\n",capital);
printf("No. of Digits: %d\n",digit);
printf("No. of Special Characters: %d\n",special);
}

int yywrap(){
return 1;
}