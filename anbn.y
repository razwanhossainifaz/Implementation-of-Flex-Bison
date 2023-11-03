%{ 
#include <stdio.h> 
 
int yylex(); 
void yyerror(const char* s); 
 
int a_count = 0; 
int b_count = 0; 
 
%} 
 
%token 'a' 'b' EOL 
 
%% 
 
start: sequence EOL    { if (a_count == b_count) printf("Accepted\n"); else printf("Rejected\n"); } 
     | EOL             { if (a_count == b_count) printf("Accepted\n"); else printf("Rejected\n"); } 
     | error EOL       { printf("Rejected\n"); } 
     ; 
 
sequence: 'a' sequence 'b' 
        | /* empty */ 
        ; 
 
%% 
 
void yyerror(const char* s) { 
    fprintf(stderr, "Error: %s\n", s); 
} 
 
int main() { 
    yyparse(); 
    return 0; 
}