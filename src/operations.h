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
        if(!strcmp(arr[i],"e") || !strcmp(arr[i],"E"))
            sum += 2.71828;
        else if(!strcmp(arr[i],"pi") || !strcmp(arr[i],"Pi") || !strcmp(arr[i],"PI"))
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
        if(!strcmp(arr[i],"e") || !strcmp(arr[i],"E"))
            diff = diff - 2.71828;
        else if(!strcmp(arr[i],"pi") || !strcmp(arr[i],"Pi") || !strcmp(arr[i],"PI"))
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
        if(!strcmp(arr[i],"e") || !strcmp(arr[i],"E"))
            prod = prod*2.71828;
        else if(!strcmp(arr[i],"pi") || !strcmp(arr[i],"Pi") || !strcmp(arr[i],"PI"))
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
        if(!strcmp(arr[i],"e") || !strcmp(arr[i],"E"))
            q = q/2.71828;
        else if(!strcmp(arr[i],"pi") || !strcmp(arr[i],"Pi") || !strcmp(arr[i],"PI"))
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
    if(!strcmp(arr[2],"e") || !strcmp(arr[2],"E"))
        sq = 2.71828*2.71828;
    else if(!strcmp(arr[2],"pi") || !strcmp(arr[2],"Pi") || !strcmp(arr[2],"PI"))
        sq = 3.14159*3.14159;
    else
        sq =atof(arr[2])*atof(arr[2]);
    return sq;
}

//SQUAREROOT
float sqrtF(char *arr[], int n){
    if(n<=2) return 0.0;
    double sq;
    if(!strcmp(arr[2],"e") || !strcmp(arr[2],"E"))
        sq = sqrt(2.71828);
    else if(!strcmp(arr[2],"pi") || !strcmp(arr[2],"Pi") || !strcmp(arr[2],"PI"))
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
    if(!strcmp(arr[2],"e") || !strcmp(arr[2],"E"))
        sq = 2.71828*2.71828*2.71828;
    else if(!strcmp(arr[2],"pi") || !strcmp(arr[2],"Pi") || !strcmp(arr[2],"PI"))
        sq = 3.14159*3.14159*3.14159;
    else
        sq =atof(arr[2])*atof(arr[2])*atof(arr[2]);
    return sq;
}

//CUBEROOT
float cubeRtF(char *arr[], int n){
    if(n<=2) return 0.0;
    double sq;
    if(!strcmp(arr[2],"e") || !strcmp(arr[2],"E"))
        sq = cbrt(2.71828);
    else if(!strcmp(arr[2],"pi") || !strcmp(arr[2],"Pi") || !strcmp(arr[2],"PI"))
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
    if(!strcmp(arr[2],"e") || !strcmp(arr[2],"E"))
        sq = 2.71828;
    else if(!strcmp(arr[2],"pi") || !strcmp(arr[2],"Pi") || !strcmp(arr[2],"PI"))
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
    if(!strcmp(arr[2],"e") || !strcmp(arr[2],"E"))
        a = 2.71828;
    else if(!strcmp(arr[2],"pi") || !strcmp(arr[2],"Pi") || !strcmp(arr[2],"PI"))
        a = 3.14159;
    else{
        a = atof(arr[2]);
    }
    if(!strcmp(arr[3],"e") || !strcmp(arr[3],"E"))
        b = 2.71828;
    else if(!strcmp(arr[3],"pi") || !strcmp(arr[3],"Pi") || !strcmp(arr[3],"PI"))
        b = 3.14159;
    else{
        b = atof(arr[3]);
    }

    return pow(a,b);
}

