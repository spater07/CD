%{ 
#include "y.tab.h" 
%} 
%% 
[0-9a-zA-Z]+ {yylval = atoi(yytext); return NUM;} 
. {return yytext[0];} 
%% 