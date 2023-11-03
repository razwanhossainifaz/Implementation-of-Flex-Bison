%option noyywrap 
%{ 
    #include "palin.tab.h" 
%}

%% 
[0-1] { return yytext[0]; } 
.     { fprintf(stderr, "Error\n"); exit(1); } 
\n    { return yytext[0]; } // Handle newline characters 
<<EOF>> { return 0; } // Handle end of file 
%%