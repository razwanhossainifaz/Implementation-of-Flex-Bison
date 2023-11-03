%{ 
    #include <stdio.h> 
    void yyerror(const char *s); 
    int yylex(); 
    int i = 0; 
%} 
 
%glr-parser 
 
%% 
 
S  : pal '\n' { i = 1; return 1; } 
   | error '\n' { i = 0; return 1; } 
   ; 
 
pal : '0' pal '0' 
    | '1' pal '1' 
    | '0' 
    | '1' 
    ; 
 
%% 
 
int main(int argc, char **argv) { 
    yyparse(); 
    if (i == 1) 
        printf("palindrome\n"); 
    else 
        printf("not palindrome\n"); 
    return 0; 
} 
 
void yyerror(const char *s) { 
    fprintf(stderr, "Syntax error: %s\n", s); 
}