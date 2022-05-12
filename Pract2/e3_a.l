%{ 
#include "y.tab.h" 
%} 
%% 
[a-zA-Z] return B; 
[a-zA-Z]+ return A; 
[0-9] return NUM; 
. return yytext[0]; 
%%