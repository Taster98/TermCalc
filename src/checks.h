 //Function that checks wheter a number is Float or not
int checkFloat(char *arr[],int n){
    for(int i=2;i<n;i++){
        if(strstr(arr[i],".") != NULL && strcmp(arr[i],"."))
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
            if(!strcmp(arr[i],"pi") || !strcmp(arr[i],"Pi") || !strcmp(arr[i],"PI") || !strcmp(arr[i],"e") || !strcmp(arr[i],"E")){
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
        if(!strcmp(arr[i],"PI")|| !strcmp(arr[i],"pi") || !strcmp(arr[i],"Pi"))
            return 1;
    }
    return 0;
}
//function that checks whether a string is e or not
int checkE(char *arr[],int n){
    for(int i=2;i<n;i++){
        if(!strcmp(arr[i],"e") || !strcmp(arr[i],"E"))
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
            error("Math error: division by 0 not allowed.");
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
        error("Math error: square root of negative number not allowed.");
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

