%{
    #include <stdlib.h>
    int yyerror(char *);
    #include "node.tab.h"
%}
%%
[a-z]        {                
                 yylval = *yytext - 'a';
                 return VARIABLE;
             }
[0-9]+       {               
                 yylval = atoi(yytext);
                 return INTEGER;
             }
"console.log"      {  return PRINT; }
[-+*/()=\n]  { return *yytext; }        
[ \t]        ;                         
.               yyerror("Unknown character");
%%
int yywrap(void)
{
    return 1;
}

