%{ 
#include "y.tab.h" 
%} 
%% 
[0][0-9a-zA-Z]*[0] return ZERO; 
[1][0-9a-zA-Z]*[1] return ONE; 
\n return NL; 
. {return yytext[0];} 
%% 