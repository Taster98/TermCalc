 //Debug function which prints a string
void print(char *s){
    fprintf(stdout,"%s\n",s);
    fflush(stdout);
}
//debug function which prints a string and an integer argument.
void printArg(char *s, int arg){
    fprintf(stdout,"%s %d\n",s,arg);
    fflush(stdout);
}

