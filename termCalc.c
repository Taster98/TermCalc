#include <stdio.h>
#include <stdlib.h>
#include <stdarg.h>
#include <string.h>
#include <errno.h>
#include <ctype.h>
#include <math.h>
#include "./errors/error.h"
#include "./src/debug.h"
#include "./src/checks.h"
#include "./src/operations.h"
#define DEBUG
//functions that print the output
void printI(long value);
void printF(float value);
//function for showing help
void help();
//function for showing version
void version();

int main(int argc, char *argv[]){
    if(valid(argv,argc)){
        //ADDITION:
        if((!strcmp("add",argv[1]) || !strcmp("-a",argv[1]) || !strcmp("--add",argv[1])) && due(argc))
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
        if(!strcmp("--help",argv[1]) || !strcmp("-h",argv[1]))
        {
            help();
        }
        //VERSION:
        else
        if(!strcmp("--version",argv[1]) || !strcmp("-v",argv[1]))
        {
            version();
        }
        //SUBTRACTION
        else
        if((!strcmp("sub",argv[1]) || !strcmp("-s",argv[1]) || !strcmp("--sub",argv[1])) && due(argc))
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
        if((!strcmp("mul",argv[1]) || !strcmp("-m",argv[1]) || !strcmp("--mul",argv[1])) && due(argc))
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
        if((!strcmp("div",argv[1]) || !strcmp("-d",argv[1]) || !strcmp("--div",argv[1])) && due(argc))
        {
            //NONZERO
            if(checkNonZero(argv,argc))
                printF(divF(argv,argc));
            
        }
        //SQUARE
        else
        if((!strcmp("square",argv[1]) || !strcmp("-sq",argv[1]) || !strcmp("--square",argv[1])) && duemax(argc))
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
        if((!strcmp("sqrt",argv[1]) || !strcmp("-rt",argv[1]) || !strcmp("--sqrt",argv[1])) && duemax(argc))
        {
            //NONNEGATIVE
            if(checkNonNegative(argv,argc))
                printF(sqrtF(argv,argc));
        }
        //CUBE
        else
        if((!strcmp("cube",argv[1]) || !strcmp("-cb",argv[1]) || !strcmp("--cube",argv[1])) && duemax(argc))
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
        if((!strcmp("cbrt",argv[1]) || !strcmp("-crt",argv[1]) || !strcmp("--cbrt",argv[1])) && duemax(argc))
        {
            printF(cubeRtF(argv,argc));
        }
        //ABSOLUTE
        else
        if((!strcmp("abs",argv[1]) || !strcmp("-abs",argv[1]) || !strcmp("--abs",argv[1])) && duemax(argc))
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
        if((!strcmp("pow",argv[1]) || !strcmp("-pow",argv[1]) || !strcmp("--pow",argv[1])) && tremax(argc))
        {
            //DECIMALS
            if(checkBaseZero(argv,argc))
                printF(powF(argv,argc));
        }
    }else{
        error("Something went wrong...");
        help();
    }
    
    return 0;
}

void help(){
    fprintf(stdout,"\n--------Welcome to TermCalc v.0.2.0--------\n\nDESCRIPTION\n\nThis is a simple terminal calculator, to handle\n");
    fprintf(stdout,"calculations without search the gnome calculator wverytime. This could be useful when the\n");
    fprintf(stdout,"desktop environment is not available, because you are on a server or you're just lazy.\n\n");
    fprintf(stdout,"USAGE\n\n-h, --help: To see this help, you can type 'TermCalc -h' or 'TermCalc --help'.\n\n");
    fprintf(stdout,"add,-a,--add: To do an addition, you can type 'TermCalc add [args]' or 'TermCalc --add [args]' or 'TermCalc -a [args]'\n\n");
    fprintf(stdout,"sub, -s, --sub: To do a subtraction, you can type 'TermCalc sub [args]' or 'TermCalc --sub [args]' or 'TermCalc -s [args]'\n\n");
    fprintf(stdout,"Subtraction function will subtract to the first argument all others (e.g. TermCalc sub 7 2 3 --> 2)\n\n");
    fprintf(stdout,"mul, -m, --mul: To do a multiplication, you can type 'TermCalc mul [args]' or 'TermCalc --mul [args]' or 'TermCalc -m [args]'\n\n");
    fprintf(stdout,"div, -d, --div: To do a division, you can type 'TermCalc div [args]' or 'TermCalc --div [args]' or 'TermCalc -d [args]'\n\n");
    fprintf(stdout,"square, -sq, --square: To do a square, you can type 'TermCalc square [args]' or 'TermCalc --square [args]' or 'TermCalc -sq [args]'\n\n");
    fprintf(stdout,"sqrt, -rt, --sqrt: To do a square root, you can type 'TermCalc sqrt [args]' or 'TermCalc --sqrt [args]' or 'TermCalc -rt [args]'\n\n");
    fprintf(stdout,"cube, -cb, --cube: To find a number cube, you can type 'TermCalc cube [args]' or 'TermCalc --cube [args]' or 'TermCalc -cb [args]'\n\n");
    fprintf(stdout,"cbrt, -crt, --cbrt: To do a cubic root, you can type 'TermCalc cbrt [args]' or 'TermCalc --cbrt [args]' or 'TermCalc -crt [args]'\n\n");
    fprintf(stdout,"abs, -abs, --abs: To get absolute value of a number, you can type 'TermCalc abs [args]' or 'TermCalc --abs [args]' or 'TermCalc -abs [args]'\n\n");
    fprintf(stdout,"pow, -pow, --pow: To get pow value of a^b (where a is the first, and b the second number), you can type 'TermCalc abs [args]' or 'TermCalc --abs [args]' or 'TermCalc -abs [args]'\n");
    fprintf(stdout,"\nEXAMPLES: \n\nTermCalc add 1 2 3 4 5 6 7 --> 28\nTermCalc -d 8 2 --> 4\nTermCalc --mul pi 3 --> 9,423...\n\nMade by Taster98\nurl: https://github.com/Taster98\n\n");
    fflush(stdout);
}

void version(){
    fprintf(stdout, "TermCalc v0.2.0\nCreated by: Taster98 (https://github.com/Taster98/TermCalc.git)\nThis is a free software, see the LICENSE for more information.\n");
    fflush(stdout);
}

//Functions to print output
void printI(long value){
    fprintf(stdout,"Result: %ld\n",value);
    fflush(stdout);
}

void printF(float value){
    fprintf(stdout,"Result: %f\n",value);
    fflush(stdout);
} 
