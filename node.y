%token INTEGER VARIABLE 
%token PRINT
%left '+' '-'
%left '*' '/'
%{
    #include <stdio.h>
    int yyerror(const char *);
    int yylex(void);
    int sym[26];
%}
%error-verbose
%%
program:
    program statement '\n'
    | 
    ;
statement:
    expr                       { printf("%d\n", $1); }
    | VARIABLE '=' expr        { sym[$1] = $3; printf("%d\n", $3);}
    | PRINT '(' expr ')'       { printf("%d\n", $3);}
    ;
expr:
    INTEGER
    | VARIABLE                 { $$ = sym[$1]; }
    | expr '+' expr            { $$ = $1 + $3; }
    | expr '-' expr            { $$ = $1 - $3; }
    | expr '*' expr            { $$ = $1 * $3; }
    | expr '/' expr            { $$ = $1 / $3; }
    | '(' expr ')'             { $$ = $2; }
    ;
%%
int yyerror(const char *s)
{
    fprintf(stderr, "%s\n", s);
    return 0;
}
int main(void)
{
    while (1)
    {
    	putchar('>');
    	putchar(' ');
    	yyparse();
    }
    return 0;
}

