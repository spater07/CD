%{ 
#include"y.tab.h" 
extern char *yytext; 
%} 
%% 
[0-9]+ {yylval=atoi(yytext); return NUMBER;} 
[a-zA-Z] {yylval = yytext[0]; return ID;} 
\n return NL; 
. return yytext[0]; 
%%