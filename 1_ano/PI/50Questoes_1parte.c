#include <stdio.h>
#include <string.h>

//Q1
int main (){
	int r = 0, a;
	printf("Escreva os números a somar. Para terminar imprima 0.\n");
	do {
		scanf("%d",&a); 
		r = r + a;
	} 
	while(a != 0);
	printf("\nSoma: %d \n",r);
	return 0;
}

//Q2
int main (){
	int maior=0, a;
	printf ("Escreve os números. Para terminar imprima 0.\n");
	do {
		scanf("%d",&a); /* Warning: unused value of scanf. */
		if(maior < a)
			maior = a;
	} while(a != 0);
	printf ("\nMaior número: %d \n",maior);
	return 0;
}

//Q3
int main (){
	int soma=0, n=(-1), a, media;
	printf ("Escreve os números. Para terminar imprima 0.\n");
	do {
		scanf ("%d",&a);
		soma = soma + a;
		n = n +1;
	} while (a != 0);
	media = soma / n;
	printf ("\nMédia: %d\n", media);
	return 0;
}

//Q5
int main (){
   int a, maior, sm;
   maior = 0;
   sm = 0;
   do{
      scanf ("%d" , &a);
      if (a> maior){
         sm = maior;
         maior = a;
      }
      else {
         if (a>sm)
            sm=a;
      }
   }while (a!=0);
   printf("O segundo número maior é %d. \n", sm);
   return 0;
}


//Questão 5
int myBitsUm (unsigned int n){
	int c=0; 
	int r;
	while (n!=0){
		r = n%2;
		n = n/2;
		c = c + r;
	}
	return c;
}

//Questão 6
int trailingZ (unsigned int n){
	int c=0;
	while (n>0){
		n = n/2;
		if (n>0)
			c++;
	}
	return c;
}

/**
int main (){
	int r;
	r = trailingZ (100);
	printf("%d\n", r);
}*/

//Questão 7
int qDig (unsigned int n){
	int c=0;
	while (n>0){
		c++;
		n = n/10;
	}
	return c;
}

/**
int main (){
	int r;
	r = qDig (4400);
	printf("%d\n", r);
}*/

//Questão 8
int myStrlen (char str []){
	int i;
	for (i=0; str[i]!='\0';i++);
	return i;
}

//Questão 9
char *myStrcat (char s1[],char s2[]){
	int i, j = 0;
	for(i=0;s1[i]!='\0'; i++);
	while(s2[j] != '\0'){
		s1[i] = s2[j];
		i++;
		j++;
	}
	s1[i] = '\0';
	return s1;
}

//Questão 10
char *mystrcpy(char s1[], const char s2[]) {
	int i;
	for (i=0; s2[i]!='\0'; i++)
		s1[i]=s2[i];
	s1[i]='\0';
	return s1;
}

//Questão 11
int myStrcmp (char s1[], char s2[]){
	int i=0;
	while (s1[i]==s2[i] && s1[i]!='\0')
		i++;
	return (s1[i]-s2[i]);
}

//Questão 12
int ocorre (char s1[], char s2[]){
   int i;
   for(i=0; s1[i]!='\0' && s2[i]!='\0' && s1[i]==s2[i]; i++);
   if (i==strlen2(s2)) return 1;
   else return 0;
}

char *mystrstr (char s1[], char s2[]) {
   int i;
   for(i=0; s1[i]!='\0'; i++)
   if (ocorre((&s1[i]),s2)) return (&s1[i]);
   if (i==0) return s1;
   return NULL;
}

//Questões 13
void strrev (char s[]){
    char h;
	int i,j;
    j=(myStrlen(s)-1);
	for (i=0;i<j;i++,j--){
	    h = s[i];
		s[i]=s[j];
		s[j]=h;
    }
}

//Questão 14
void strnoV (char s[]){
    int r,w;
    for(r=0, w=0;s[r];++r){
        if(s[r]!='A' && s[r]!='E' && s[r]!='I' && s[r]!='O' && s[r]!='U' && s[r]!='a' && s[r]!='e' && s[r]!='i' && s[r]!='o' && s[r]!='u'){
            s[w]=s[r];
            w++;
        }
    }
    s[w]='\0';
}

//Questão 15
void truncW (char t[], int n){
   	int i, j = 0, x;
	for(i = 0; t[i] != '\0'; i++, j++){
		for(x = n;(x > 0) && (t[i] != ' ') && (t[i] != '\0'); x--, i++, j++)
			t[j] = t[i];
		while((t[i] != '\0') && (t[i] != ' '))
			i++;
		t[j] = t[i];
	}
	t[j] = '\0';
}

void truncW2 (char t[], int n){
    int i,j, n2;
    j = 0; 
    n2 = n;
    for ( i=0 ; t[i]!='\0' ; i++){
        if ( (i<n) && (t[i] != ' ')){
            t[j]=t[i];
            j++;
        }
        else if (t[i] == ' '){
            t[j]=t[i];
            j++;
            n = (i+1) + n2;
        }
    }
    t[j]='\0';
}


//Questão 16
int contaChar (char s [], char a){
	int i,count=0;
	for (i=0;s[i]!='\0';i++){
		if (s[i]==a)
			count ++;
	}
	return count;
}

char charMaisfreq (char s[]) {
	int i,imax=0;
	char max;
	for (i=0;s[i]!='\0';i++){
		if (imax < contaChar (s,s[i])){
			imax = contaChar (s,s[i]);
			max = s[i];
		}
	}
	if (s[0]=='\0')
		max ='\0';
    return max;
}


//Questão 17
int iguaisConsecutivos (char s[]){
	int i,j,m;
	m=0;j=1;
	for (i=0; s[i]!='\0';i++){
		if (s[i]==s[i+1])
			j++;
		else j=1;
		if (j>m)
			m=j;
	}
	return m;
}


//Questão 18
int pertence1 (char s[], char x, int j) {
    int i;
    for(i=0;i<j&&s[i]!=x;i++);
    if(i<j && s[i]==x) return 1;
    return 0;
}

int difConsecutivos (char s[]) { //10 em 10
    int i, j=0, k=1, m=0;
    for(i=0;s[i]!='\0';i++);
    char aux[i]; i=0;
    if(s[0]=='\0') return 0;
    else if(s[1]=='\0') return 1;
    else while(s[i]!='\0') {
	    	if(i==0) {
		      aux[0]=s[i];j++; i++; continue;
	    	}
	    	else if ((s[i]!=s[i-1] || s[i]!=s[i+1])) {
	    	    	if(pertence1(aux, s[i], j)){
				    	if (j>m) {
					    	m=j; 
				    	}
				    	i=k;j=0; k++;
		        	}
			        else {
			    	    aux[j]=s[i];
				        j++; i++;
		    	    }
	    	    }
	        	else {
	    	     if (j>m) m=j; 
	            	j=0; i=k; k++;
	        	}
	    	}
	return m;
}

//Questão 19
int maiorPrefixo (char s1[], char s2[]){
	int i;
	for (i=0; s1[i]==s2[i] && s1[i]!='\0' && s2[i]!='\0'; i++);
	return i;
} 

//Questão 20
int maiorSufixo (char st1 [], char st2 []) {
	int i,j,res = 0;
	i = myStrlen(st1) - 1;
	j = myStrlen(st2) - 1;
	while((i >= 0) && (j >= 0) && (st1[i] == st2[j])){
		i--;
		j--;
		res++;
	}
	return res;
}

//Questão 21
int sufPref (char s1[], char s2[]) {
    int s = myStrlen(s1);
	int i = 0, j, aux, r = 0, f = 0;
	while((s1[i] != '\0') && (!f)){
		r = 0;
		if(s1[i] == s2[0]){
		    aux = i;
			j = 0;
			while((s1[aux] != '\0') && (s2[j] != '\0') && (s1[aux] == s2[j])){
				aux++;
				j++;
				r++;
			}
			if(r == (s - i))
				f = 1;
		}
		i++;
	}
	return r;
}

int sufPref2 (char s1[], char s2[]) {
   int i,j,r;
    for(i=j=r=0;s1[i];i++){
        if(s1[i]==s2[j]){
            r++;
            j++;
        }else{
            j=0;
            r=0;
        }
    }
    return r;
}

//Questão 22
int contaPal (char s[]){
	int res = 0, i = 0, f;
	while(s[i]!='\0'){
		f = 0;
		while((s[i] != '\0') && (isspace(s[i])))
			i++;
		while((s[i] != '\0') && (! isspace(s[i]))){
			i++;
			f = 1;
		}
		if(f == 1)
			res++;
	}
	return res;
}

/**
int main (){
	int r;
	r = contaPal ("Anabela\0");
	printf("%d\n", r);
}*/

//Questão 23
int contaVogais (char s[]){
	int c, i;
	c=0;
	for (i=0; s[i]!='\0';i++)
	if (s[i]=='a' || s[i]=='e' || s[i]=='i' || s[i]=='o' || s[i]=='u' || s[i]=='A' || s[i]=='E' || s[i]=='I' || s[i]=='O' || s[i]=='U')
		c++;
	return c;
}

/**
int main (){
	int r;
	r = contaVogais ("Bom dia\0");
	printf("%d\n", r);
}*/

//Questão 24
int contida (char a[], char b[]){
	int f = 1, i = 0, j;
	while((a[i] != '\0') && (f == 1)){
		j = 0;
		f = 0;
		while((!f) && (b[j] != '\0')){
			if(b[j] == a[i])
				f = 1;
			j++;
		}
		i++;
	}
	return f; 
}

int contida2 (char a[], char b[]){
	int f=1,i,j;
	for (i=0; a[i]!='\0' && (f==1); i++){
		j=0;
		f=0;
		for (j=0; (!f) && (b[j]!='\0'); j++)
			if (b[j]==a[i]) f=1;
	}
	return f;
}

//Questão 25
int palindorome (char s[]){
    int i,j;
    j=(strlen(s)-1);
	for( i=0;s[i]!='\0' && i<=j;i++,j--)
      if (s[i]!=s[j]) return 0; 
    return 1;
}

//Questão 26
int remRep (char x[]){
	int i = 0, j = 0;
	while(x[j]!= '\0'){
		x[i] = x[j];
		while((x[j]!='\0') && (x[j]==x[i]))
			j++;
		i++;
	}
	x[i] = '\0';
	return i;
}

/**
int main (){
	int r;
	r = remRep ("aaabaaabbbbaaaa\0");
	printf("%d\n", r);
}*/

//Questão 27
int limpaEspacos (char t[]){
	int r,w;
	for (r = 0,w = 0;t[r]!='\0';r++){
      if (t[r]==' ' && t[r+1]!=' ')
      	t[w++] = t[r];
      if (t[r]!=' ') 
      	t[w++] = t[r];
	}
	t[w]='\0';
	return w;
}	

/**
int main (){
	int r;
	r = remRep ("aa b  b  ba\0");
	printf("%d\n", r);
}*/

//Questão 28
void insere (int v[] , int N , int x){
	int i,j;
	for (i=0; i<N && v[i]<x; i++);
	if (i==N) v[i]=x;
	else{
		for (j=N; j>i; j--)
			v[j]= v[j-1];
		v[i]=x;
	}
}

//Questão 29
/**
   void insere (int s[], int N, int x){
   int i;
   for ( i=N-1 ; i>=0 && s[i]>=x ; i--)
      s[i+1]=s[i];
   s[i+1]=x;
}*/

void merge (int r [], int a[], int b[], int na, int nb){
   int i;
   for ( i = 0 ; i < na ; i++)
      r[i] = a[i];
   for ( i = 0 ; i < nb ; i++)
      insere ( r , na + i , b[i] );
}

//Questão 30
int crescente (int a[], int i, int j){
	int x;
	for (x=i; x<j; x++)
		if (a[x]>a[x+1])
			return 0;
	return 1;
}


//Questões 31
int retiraNeg (int v[], int N){
   int i, w;
   for (i=0,w=0;i<N;i++){
      if (v[i]>0) 
		v[w++] = v[i];
   }
   return w;
}

/**	int i,j;
	i=0;
	while (i<N){
		if (v[i]<0){
			for (j=i+1; j<N; j++)
				v[j-1]=v[j];
				N--;
		}else i++;
	}
	return N;
}*/

//Questão 32
int menosFreq (int v[], int N){
    int i,f=v[0],c=1,s=0;
    for ( i=0 ; i<N-1 ; i++) {
         if( v[i] == v[i+1] ) c++;
         else {
         if( s==0 || c<s) {
         s=c;
         f=v[i];
         }
    c=1;}
    }
    if (c<s){
    s=c;
    f=v[i]; }
return f;
}

//Questão 33
int maisFreq (int v[], int N){
    int i, r, c, s;
    r = v[0];
    c = 1;
    s = 0;
    for ( i = 0 ; i < N ; i++){
        if ( v[i] == v[i + 1] ) c++;
        else {
        if ( c > s ){
            s = c;
            r = v[i];
        }
        c = 1;
      }
   }
   return r;
}

//Questão 34
int maxCresc (int v[], int N) {
    int i,c,max;
    max=0;
    c =1;
    for (i=0; i<N; i++){
        if (v[i]==v[i+1] || v[i]<v[i+1])
            c++;
        else{
            if (max<c) max=c;
            c=1;}
    }
    if (max<c) max=c;
   return max;
}

//Questão 35
int elimRep (int v[], int n){
    int r,w,wc;
    for (r=0,w=0;r<N;r++){
        for (wc=w-1;wc>=0 && v[wc]!=v[r]; wc--);
           if (wc<0) v[w++] = v[r];
    }
    return w;
}

//Questão 36
int elimRepOrd (int v[], int n){
   int i, j;
   j = 0;
   for (i=0;i<n;i++){
      if (v[i]!=v[i+1]){
         v[j]=v[i];
         j++;
      }
      if(v[i]==v[i+1] && (i+1)==n) v[j++]=v[i];
   }
   return j;
}

//Questão 37
   int comunsOrd (int a[], int na, int b[], int nb){
    int i=0, j=0, c=0;
    while (i<na && j<nb){
    if(a[i]>b[j]) j++;
    else { if ( a[i]<b[j] ) 
    i++; 
    else c++, i++, j++;}
   }
   return c;
}

//Questão 38
int elem (int a, int s[], int n){
   int i;
   for(i=0; i<n; i++) 
      if (s[i]==a) return 1;
   return 0;
}

int comuns (int a[], int na, int b[], int nb){
   int i,c=0;
   for(i=0 ; i<na ; i++)
      if( elem (a[i],b,nb) ) c++;
   return c;
}

//Questão 39
int minInd (int v[], int n){
	int i, menor;
	menor=0;
	for (i=1;i<n;i++)
		if (v[i]<v[menor])
			menor=i;
	return menor;
}

//Questão 40
void somasAc (int v[], int Ac [], int N){
    int i,sum;
    sum=0;
    for(i=0;i<N;i++){
        sum += v[i];
        Ac[i]=sum;
    }
}

//Questão 41
int triSup (int N, float m [N][N]) {
   int i,j;
   for(i=1,j=0 ; j<i && i<N; j++,i++)
      if(m[i][j]!=0) return 0;
   return 1;
}

//Questão 42
void transposta (int N, float m [N][N]) {
    int l,c;
    int tmp;
    for(l=0;l<N;l++){
        for(c=0;c<l;c++){
            tmp=m[l][c];
            m[l][c]=m[c][l];
            m[c][l]=tmp;
        }
    }
}

//Questão 43
void addTo (int N, int M, int a [N] [M], int b [N] [M]){
    int x,y;
    for(x=0;x<N;x++){
        for(y=0;y<M;y++){
            a[x][y]+=b[x][y];
        }
    }
}

//Questão 44
void sumDiag(int N, int m [N][N]){
    int i,j,sum;
    for(i=0;i<N;i++){
        sum=0;
        for(j=0;j<N;j++){
            if(j!=i){
                sum+=m[i][j];
            }
        }
        m[i][i]=sum;
    }
}

//Q45
int main (){
   int i;
   for (i=65;i<91;i++){
      printf("%d - %c\n", i, i);
   }
   for (i=97;i<123;i++){
      printf("%d - %c\n", i, i);
   }
}

//Questão 46
int unionSet (int N, int v1[N], int v2[N], int r[N]){
    int i;
    for(i=0;i<N;i++){
        r[i]=0;
    }
    for (i = 0; i < N; ++i) {
        if (v1[i]==1)r[i]=1;
        if (v2[i]==1)r[i]=1;
    }
    return 0;
}

//Questão 47
int intersectSet (int N, int v1[N], int v2[N], int r[N]){
    int i;
    for (i=0;i<N;i++)
        r[i]=0;
    for (i=0;i<N;i++)
        if (v1[i]==1 && v2[i]==1) r[i]=1;
    return 0;
}

//Questão 48
int intersectMSet (int N, int v1[N], int v2[N], int r[N]){
    int i;
    for (i=0;i<N;i++){
        if (v1[i]>v2[i]) r[i]=v2[i];
        else r[i]=v1[i];
    }
    return 0;
}

//Questão 49
int unionSet (int N, int v1[N], int v2[N], int r[N]){
	int i;
	for (i=0;i<N;i++)
		r[i]=v1[i]+v2[i];
	return 0;
}

//Questão 50
int cardinalMSet (int N, int v[N]){
   int i,c;
   c=0;
   for (i=0; i<N; i++)
      c=c+v[i];
   return c;
}
