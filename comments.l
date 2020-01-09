%{
#include<stdio.h>
int n=0;
int m=1;
%}


/*Rule Section*/

%%
\/\/(.*) {};
\/\*(.*\n)*.*\*\/  {};
[\n]+ {fprintf(yyout, "\n%d %d",m++,n);n=0;}
[\t" "]+ {fprintf(yyout," ");}
"while"|"if"|"else" {n++;fprintf(yyout,"%s",yytext);}   
"int"|"float" {n++;fprintf(yyout,"%s",yytext);}    
[a-zA-Z_][a-zA-Z0-9_]* {n++;fprintf(yyout,"%s",yytext);}  
"<="|"=="|"="|"++"|"-"|"*"|"+" {n++;fprintf(yyout,"%s",yytext);} 
[(){}|, ;]    {n++;fprintf(yyout,"%s",yytext);}
[0-9]*"."[0-9]+ {n++;fprintf(yyout,"%s",yytext);}
[0-9]+ {n++;fprintf(yyout,"%s",yytext);}  

%%

/*call the yywrap function*/
int yywrap()
{
return 1;
}



/*Auxiliary function*/
/*Driver function*/

int main()
{
yyin=fopen("input6.c","r");
yyout=fopen("out2.c","w");
/*call the yylex function.*/
yylex();
return 0;
}