#!/bin/bash
#creation of folders
mkdir errors;
mkdir src;
#creation of termCalc.c
echo \
"\
#include <stdio.h>
#include <stdlib.h>
#include <stdarg.h>
#include <string.h>
#include <errno.h>
#include <ctype.h>
#include <math.h>
#include \"./errors/error.h\"
#include \"./src/debug.h\"
#include \"./src/checks.h\"
#include \"./src/operations.h\"
#define DEBUG
//functions that print the output
void printI(long value);
void printF(float value);
//function for showing help
void help();

int main(int argc, char *argv[]){
    if(valid(argv,argc)){
        //ADDITION:
        if((!strcmp(\"add\",argv[1]) || !strcmp(\"-a\",argv[1]) || !strcmp(\"--add\",argv[1])) && due(argc))
        {   
            //DECIMALS
            if(checkFloat(argv,argc) || checkE(argv,argc) || checkPi(argv,argc))
                printF(addF(argv,argc));
            //INTEGERS
            else
                printI(add(argv,argc));
        }
        //HELP:
        else
        if(!strcmp(\"--help\",argv[1]) || !strcmp(\"-h\",argv[1]))
        {
            help();
        }
        //SUBTRACTION
        else
        if((!strcmp(\"sub\",argv[1]) || !strcmp(\"-s\",argv[1]) || !strcmp(\"--sub\",argv[1])) && due(argc))
        {
            //DECIMALS
            if(checkFloat(argv,argc) || checkE(argv,argc) || checkPi(argv,argc))
                printF(subF(argv,argc));
            //INTEGERS
            else
                printI(sub(argv,argc));
        }
        //MULTIPLICATION
        else
        if((!strcmp(\"mul\",argv[1]) || !strcmp(\"-m\",argv[1]) || !strcmp(\"--mul\",argv[1])) && due(argc))
        {
            //DECIMALS
            if(checkFloat(argv,argc) || checkE(argv,argc) || checkPi(argv,argc))
                printF(mulF(argv,argc));
            //INTEGERS
            else
                printI(mul(argv,argc));
        }
        //DIVISION
        else
        if((!strcmp(\"div\",argv[1]) || !strcmp(\"-d\",argv[1]) || !strcmp(\"--div\",argv[1])) && due(argc))
        {
            //NONZERO
            if(checkNonZero(argv,argc))
                printF(divF(argv,argc));
            
        }
        //SQUARE
        else
        if((!strcmp(\"square\",argv[1]) || !strcmp(\"-sq\",argv[1]) || !strcmp(\"--square\",argv[1])) && duemax(argc))
        {
            //DECIMALS
            if(checkFloat(argv,argc) || checkE(argv,argc) || checkPi(argv,argc))
                printF(squareF(argv,argc));
            //INTEGERS
            else
                printI(square(argv,argc));
        }
        //SQUARE ROOT
        else
        if((!strcmp(\"sqrt\",argv[1]) || !strcmp(\"-rt\",argv[1]) || !strcmp(\"--sqrt\",argv[1])) && duemax(argc))
        {
            //NONNEGATIVE
            if(checkNonNegative(argv,argc))
                printF(sqrtF(argv,argc));
        }
        //CUBE
        else
        if((!strcmp(\"cube\",argv[1]) || !strcmp(\"-cb\",argv[1]) || !strcmp(\"--cube\",argv[1])) && duemax(argc))
        {
            //DECIMALS
            if(checkFloat(argv,argc) || checkE(argv,argc) || checkPi(argv,argc))
                printF(cubeF(argv,argc));
            //INTEGERS
            else
                printI(cube(argv,argc));
        }
        //CUBE ROOT
        else
        if((!strcmp(\"cbrt\",argv[1]) || !strcmp(\"-crt\",argv[1]) || !strcmp(\"--cbrt\",argv[1])) && duemax(argc))
        {
            printF(cubeRtF(argv,argc));
        }
        //ABSOLUTE
        else
        if((!strcmp(\"abs\",argv[1]) || !strcmp(\"-abs\",argv[1]) || !strcmp(\"--abs\",argv[1])) && duemax(argc))
        {
            //DECIMALS
            if(checkFloat(argv,argc) || checkE(argv,argc) || checkPi(argv,argc))
                printF(absF(argv,argc));
            //INTEGERS
            else
                printI(absI(argv,argc));
        }
        //POW
        else
        if((!strcmp(\"pow\",argv[1]) || !strcmp(\"-pow\",argv[1]) || !strcmp(\"--pow\",argv[1])) && tremax(argc))
        {
            //DECIMALS
            if(checkBaseZero(argv,argc))
                printF(powF(argv,argc));
        }
    }else{
        error(\"Something went wrong...\");
        help();
    }
    
    return 0;
}

void help(){
    fprintf(stdout,\"\n--------Welcome to TermCalc v.0.1--------\n\nDESCRIPTION\n\nThis is a simple terminal calculator, to handle\n\");
    fprintf(stdout,\"calculations without search the gnome calculator wverytime. This could be useful when the\n\");
    fprintf(stdout,\"desktop environment is not available, because you are on a server or you're just lazy.\n\n\");
    fprintf(stdout,\"USAGE\n\n-h, --help: To see this help, you can type 'TermCalc -h' or 'TermCalc --help'.\n\n\");
    fprintf(stdout,\"add,-a,--add: To do an addition, you can type 'TermCalc add [args]' or 'TermCalc --add [args]' or 'TermCalc -a [args]'\n\n\");
    fprintf(stdout,\"sub, -s, --sub: To do a subtraction, you can type 'TermCalc sub [args]' or 'TermCalc --sub [args]' or 'TermCalc -s [args]'\n\n\");
    fprintf(stdout,\"Subtraction function will subtract to the first argument all others (e.g. TermCalc sub 7 2 3 --> 2)\n\n\");
    fprintf(stdout,\"mul, -m, --mul: To do a multiplication, you can type 'TermCalc mul [args]' or 'TermCalc --mul [args]' or 'TermCalc -m [args]'\n\n\");
    fprintf(stdout,\"div, -d, --div: To do a division, you can type 'TermCalc div [args]' or 'TermCalc --div [args]' or 'TermCalc -d [args]'\n\n\");
    fprintf(stdout,\"square, -sq, --square: To do a square, you can type 'TermCalc square [args]' or 'TermCalc --square [args]' or 'TermCalc -sq [args]'\n\n\");
    fprintf(stdout,\"sqrt, -rt, --sqrt: To do a square root, you can type 'TermCalc sqrt [args]' or 'TermCalc --sqrt [args]' or 'TermCalc -rt [args]'\n\n\");
    fprintf(stdout,\"cube, -cb, --cube: To find a number cube, you can type 'TermCalc cube [args]' or 'TermCalc --cube [args]' or 'TermCalc -cb [args]'\n\n\");
    fprintf(stdout,\"cbrt, -crt, --cbrt: To do a cubic root, you can type 'TermCalc cbrt [args]' or 'TermCalc --cbrt [args]' or 'TermCalc -crt [args]'\n\n\");
    fprintf(stdout,\"abs, -abs, --abs: To get absolute value of a number, you can type 'TermCalc abs [args]' or 'TermCalc --abs [args]' or 'TermCalc -abs [args]'\n\n\");
    fprintf(stdout,\"pow, -pow, --pow: To get pow value of a^b (where a is the first, and b the second number), you can type 'TermCalc abs [args]' or 'TermCalc --abs [args]' or 'TermCalc -abs [args]'\n\");
    fprintf(stdout,\"\nEXAMPLES: \n\nTermCalc add 1 2 3 4 5 6 7 --> 28\nTermCalc -d 8 2 --> 4\nTermCalc --mul pi 3 --> 9,423...\n\nMade by Taster98\nurl: http://luiggi.altervista.org/\n\n\");
    fflush(stdout);
}

//Functions to print output
void printI(long value){
    fprintf(stdout,\"Result: %ld\n\",value);
    fflush(stdout);
}

void printF(float value){
    fprintf(stdout,\"Result: %f\n\",value);
    fflush(stdout);
} \
" >> termCalc.c;
#creation of errors:
echo " \
//Generic error function
void error(char *m){
    fprintf(stderr,\"%s\n\",m);
    fflush(stderr);
}
" >> errors/error.h;

#creation of checks
echo " \
//Function that checks wheter a number is Float or not
int checkFloat(char *arr[],int n){
    for(int i=2;i<n;i++){
        if(strstr(arr[i],\".\") != NULL && strcmp(arr[i],\".\"))
            return 1;
    }

    return 0;
}
//function that checks wheter each char is alpha or not
int isDig(char *s, int len){
    for(int i=0;i<len;i++){
        if(isalpha(s[i]))
            return 0;
        if(ispunct(s[i])){
            if(s[i] != '.' && s[i] != '-')
                return 0;
        }
    }
    return 1;
}
//function that checks whether a string is digit or not
int checkDigit(char *arr[], int n){
    for(int i=2;i<n;i++){
        if(!isDig(arr[i],strlen(arr[i]))){
            if(!strcmp(arr[i],\"pi\") || !strcmp(arr[i],\"Pi\") || !strcmp(arr[i],\"PI\") || !strcmp(arr[i],\"e\") || !strcmp(arr[i],\"E\")){
                return 1;
            }
            return 0;
        }
    }
    return 1;
}
//function that checks whether a string is PI or not
int checkPi(char *arr[],int n){
    for(int i=2;i<n;i++){
        if(!strcmp(arr[i],\"PI\")|| !strcmp(arr[i],\"pi\") || !strcmp(arr[i],\"Pi\"))
            return 1;
    }
    return 0;
}
//function that checks whether a string is e or not
int checkE(char *arr[],int n){
    for(int i=2;i<n;i++){
        if(!strcmp(arr[i],\"e\") || !strcmp(arr[i],\"E\"))
            return 1;
    }
    return 0;
}
int allzeros(char *s, int len){
    int count=0;
    for(int i=0;i<len;i++){
        if(s[i] == '0' || s[i] == '.')
            count++;
    }
    if(count == len)
        return 0;
    return 1;
}
//function that checks if a sequence contains zeros
int checkNonZero(char *arr[], int n){
    for(int i = 3;i<n;i++){
        if(!allzeros(arr[i],strlen(arr[i]))){
            error(\"Math error: division by 0 not allowed.\");
            return 0;
        }
    }
    return 1;
}
//functions that checks non zeros for pow operation
int checkBaseZero(char *arr[], int n){
    if(n<3) return 0;
    if(atof(arr[2]) == 0 && atof(arr[3])==0){
        return 0;
    }
    return 1;
}
//function that checks if a sequence is negative
int checkNonNegative(char *arr[], int n){
    if(atof(arr[2])<0){
        error(\"Math error: square root of negative number not allowed.\");
        return 0;
    }
    return 1;
}
//function that checks whether a string is valid or not
int valid(char *arr[], int n){
    if(n<=1){
        return 0;
    }
    if(!checkDigit(arr,n)){
        return 0;
    }
    return 1;
}
//function that checks if there are at least 2 arguments
int due(int num){
    if(num>=2)
        return 1;
    else
        return 0;
}
//function that checks if there are maximum 2 numbers
int duemax(int num){
    if(num==3)
        return 1;
    else
        return 0;
}

//function that checks if there are maximum 2 numbers
int tremax(int num){
    if(num==4)
        return 1;
    else
        return 0;
}
" >> src/checks.h;

#creation of debug
echo " \
//Debug function which prints a string
void print(char *s){
    fprintf(stdout,\"%s\n\",s);
    fflush(stdout);
}
//debug function which prints a string and an integer argument.
void printArg(char *s, int arg){
    fprintf(stdout,\"%s %d\n\",s,arg);
    fflush(stdout);
}
" >> src/debug.h;

#creation of operations
echo " \
//ADDITION
long add(char *arr[], int n){
    long sum=0;
    for(int i=2;i<n;i++)
        sum += atol(arr[i]);
    return sum;
}

float addF(char *arr[], int n){
    float sum=0;
    for(int i=2;i<n;i++)
        if(!strcmp(arr[i],\"e\") || !strcmp(arr[i],\"E\"))
            sum += 2.71828;
        else if(!strcmp(arr[i],\"pi\") || !strcmp(arr[i],\"Pi\") || !strcmp(arr[i],\"PI\"))
            sum += 3.14159;
        else
            sum +=atof(arr[i]);
    return sum;
}

//SUBTRACTION
long sub(char *arr[], int n){
    long diff;
    if(n<=2) diff=0;
    else diff = atoi(arr[2]);
    for(int i=3;i<n;i++)
        diff = diff-atol(arr[i]);
    return diff;
}

float subF(char *arr[], int n){
    float diff;
    if(n<=2) diff=0;
    else diff = atof(arr[2]);
    for(int i=3;i<n;i++)
        if(!strcmp(arr[i],\"e\") || !strcmp(arr[i],\"E\"))
            diff = diff - 2.71828;
        else if(!strcmp(arr[i],\"pi\") || !strcmp(arr[i],\"Pi\") || !strcmp(arr[i],\"PI\"))
            diff = diff - 3.14159;
        else
            diff = diff - atof(arr[i]);
    return diff;
}

//MULTIPLICATION
long mul(char *arr[], int n){
    long prod;
    if(n<=2) prod=0;
    else prod = atoi(arr[2]);
    for(int i=3;i<n;i++)
        prod = prod * atol(arr[i]);
    return prod;
}

float mulF(char *arr[], int n){
    float prod;
    if(n<=2) prod=0;
    else prod = atof(arr[2]);
    for(int i=3;i<n;i++)
        if(!strcmp(arr[i],\"e\") || !strcmp(arr[i],\"E\"))
            prod = prod*2.71828;
        else if(!strcmp(arr[i],\"pi\") || !strcmp(arr[i],\"Pi\") || !strcmp(arr[i],\"PI\"))
            prod = prod*3.14159;
        else
            prod =prod*atof(arr[i]);
    return prod;
}

//DIVISION
float divF(char *arr[], int n){
    float q;
    if(n<=2) q=0;
    else q = atof(arr[2]);
    for(int i=3;i<n;i++){
        if(!strcmp(arr[i],\"e\") || !strcmp(arr[i],\"E\"))
            q = q/2.71828;
        else if(!strcmp(arr[i],\"pi\") || !strcmp(arr[i],\"Pi\") || !strcmp(arr[i],\"PI\"))
            q = q/3.14159;
        else    
            q = q/atof(arr[i]);
    }
    return q;
}

//SQUARE
long square(char *arr[], int n){
    if(n<=2) return 0;
    return atol(arr[2])*atol(arr[2]);
}
float squareF(char *arr[], int n){
    if(n<=2) return 0.0;
    float sq;
    if(!strcmp(arr[2],\"e\") || !strcmp(arr[2],\"E\"))
        sq = 2.71828*2.71828;
    else if(!strcmp(arr[2],\"pi\") || !strcmp(arr[2],\"Pi\") || !strcmp(arr[2],\"PI\"))
        sq = 3.14159*3.14159;
    else
        sq =atof(arr[2])*atof(arr[2]);
    return sq;
}

//SQUAREROOT
float sqrtF(char *arr[], int n){
    if(n<=2) return 0.0;
    double sq;
    if(!strcmp(arr[2],\"e\") || !strcmp(arr[2],\"E\"))
        sq = sqrt(2.71828);
    else if(!strcmp(arr[2],\"pi\") || !strcmp(arr[2],\"Pi\") || !strcmp(arr[2],\"PI\"))
        sq = sqrt(3.14159);
    else
        sq = sqrt(atof(arr[2]));
    return (float)sq;
}

//CUBE
long cube(char *arr[], int n){
    if(n<=2) return 0;
    return atol(arr[2])*atol(arr[2])*atol(arr[2]);
}
float cubeF(char *arr[], int n){
    if(n<=2) return 0.0;
    float sq;
    if(!strcmp(arr[2],\"e\") || !strcmp(arr[2],\"E\"))
        sq = 2.71828*2.71828*2.71828;
    else if(!strcmp(arr[2],\"pi\") || !strcmp(arr[2],\"Pi\") || !strcmp(arr[2],\"PI\"))
        sq = 3.14159*3.14159*3.14159;
    else
        sq =atof(arr[2])*atof(arr[2])*atof(arr[2]);
    return sq;
}

//CUBEROOT
float cubeRtF(char *arr[], int n){
    if(n<=2) return 0.0;
    double sq;
    if(!strcmp(arr[2],\"e\") || !strcmp(arr[2],\"E\"))
        sq = cbrt(2.71828);
    else if(!strcmp(arr[2],\"pi\") || !strcmp(arr[2],\"Pi\") || !strcmp(arr[2],\"PI\"))
        sq = cbrt(3.14159);
    else
        sq = cbrt(atof(arr[2]));
    return (float)sq;
}

//ABS
long absI(char *arr[], int n){
    if(n<=2) return 0;
    if(atol(arr[2])<0) return atol(arr[2])*(-1);
    else return atol(arr[2]);
}

float absF(char *arr[], int n){
    if(n<=2) return 0.0;
    float sq;
    if(!strcmp(arr[2],\"e\") || !strcmp(arr[2],\"E\"))
        sq = 2.71828;
    else if(!strcmp(arr[2],\"pi\") || !strcmp(arr[2],\"Pi\") || !strcmp(arr[2],\"PI\"))
        sq = 3.14159;
    else{
        if(atof(arr[2])<0)
            sq =atof(arr[2])*(-1);
        else sq =atof(arr[2]);
    }
    return sq;
}

//POW
float powF(char *arr[], int n){
    if(n<=3) return 0.0;
    float a,b;
    if(!strcmp(arr[2],\"e\") || !strcmp(arr[2],\"E\"))
        a = 2.71828;
    else if(!strcmp(arr[2],\"pi\") || !strcmp(arr[2],\"Pi\") || !strcmp(arr[2],\"PI\"))
        a = 3.14159;
    else{
        a = atof(arr[2]);
    }
    if(!strcmp(arr[3],\"e\") || !strcmp(arr[3],\"E\"))
        b = 2.71828;
    else if(!strcmp(arr[3],\"pi\") || !strcmp(arr[3],\"Pi\") || !strcmp(arr[3],\"PI\"))
        b = 3.14159;
    else{
        b = atof(arr[3]);
    }

    return pow(a,b);
}
" >> src/operations.h