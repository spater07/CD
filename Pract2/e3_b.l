%{
#include "y.tab.h"
%}
%%
[a-zA-Z] {return ALPHA;}
[0-9]+ {return DIGIT;}
\n {return NL;}
. {return yytext[0];}
%%