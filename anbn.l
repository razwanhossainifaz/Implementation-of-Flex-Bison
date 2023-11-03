%{ 
#include "anbn.tab.h" 
%}

%% 
 
a       { return 'a'; } 
b       { return 'b'; } 
\n      { return EOL; } 
.       { /* Ignore all other characters */ } 
 
%% 
 
int yywrap() { 
    return 1;
}