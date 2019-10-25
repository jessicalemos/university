typedef struct lligada {
    int valor;
    struct lligada *prox;
} *LInt;

/**Questao 1**/
int length (LInt l){
    int r;
    if (l==NULL) r=0;
    else {
        r=0;
        while (l!=NULL){ 
        l=l->prox;
        r++;
        }
    }
    return r;
}

/**Questao 2**/
void freeL (LInt l){
    LInt aux = l;
    while(l!=NULL){
    l=l->prox;
    free(aux);
    aux=l;
    }
}

/**Questao 3**/
void imprimeL (LInt l){
    while (l!=NULL){
        printf("\n %d \n",l->valor);
        l=l->prox;}
}

/**Questao 4**/
LInt reverseL (LInt l){
    LInt ant=NULL, prox, atual=l;
    while(atual!=NULL){
        prox=atual->prox;
        atual->prox=ant;
        ant=atual;
        atual=prox;
    }
    l=ant;
    return l;
}

/**Questao 5**/
void insertOrd (LInt *a, int x){
    LInt l = *a, nova, aux, ant=NULL;
    aux=l;
    while(aux!=NULL && x>aux->valor){
        ant=aux;
        aux=aux->prox;}
    nova = malloc (sizeof (struct lligada));
    nova->valor=x;
    nova->prox=aux;
    if (ant==NULL) l=nova;
    else ant->prox=nova;
    *a=l;
}

/**Questao 6**/
int removeOneOrd (LInt *a, int x){
    LInt l=*a,ant=NULL,aux=l;
    int r;
    while (aux!=NULL && aux->valor!=x){
        ant=aux;
        aux=aux->prox;}
    if (aux==NULL) r=1;
    else{
    r=0;
    if (ant==NULL)*a=aux->prox;
    else ant->prox=aux->prox;
    free (aux);}
    return r;
}

/**Questao 7**/
void insertOrd (LInt *a, int x){
    LInt l = *a, nova, aux, ant=NULL;
    aux=l;
    while(aux!=NULL && x>aux->valor){
        ant=aux;
        aux=aux->prox;}
    nova = malloc (sizeof (struct lligada));
    nova->valor=x;
    nova->prox=aux;
    if (ant==NULL) l=nova;
    else ant->prox=nova;
    *a=l;
}

void merge (LInt *r, LInt l1, LInt l2){
     while(l1 != NULL){
          insertOrd(r,l1->valor);
          l1 = l1->prox;
     }
     while(l2 != NULL){
          insertOrd(r,l2->valor);
          l2 = l2->prox;
     }
}

/**Questao 8**/
void insere (LInt *l, LInt r) {
     while ((*l)!=NULL) l=&((*l)->prox);
     (*l)=r;
}

void splitMS (LInt l, int x, LInt *mx, LInt *Mx) {
     LInt aux;
     while(l!=NULL){
          aux=l->prox;
          l->prox=NULL;
          if(l->valor < x) insere(mx,l);
          else insere(Mx,l);
          l=aux;
     }
}

/**Questao 9**/
int length (LInt l){
    int r=0;
    while (l!=NULL){ 
        l=l->prox; r++;
    }
    return r;
}

LInt parteAmeio (LInt *l) 
{
    int len = length(*l) / 2;
    LInt cabeca = *l;
    LInt anterior = NULL;
    int i;
    for (i = 0; i < len; i++) {
        anterior = *l;
        *l = (*l)->prox;
    }
    if (anterior != NULL) {
        anterior->prox = NULL;
    }
    else { /* Cortar à cabeca */
        cabeca = NULL;
    }
    return cabeca;
}

/**Questao 10**/
int removeAll (LInt *a, int x){
    LInt l=*a,ant=NULL,aux=l;
    int r=0;
    while (aux!=NULL){
        while (aux!=NULL && aux->valor!=x){
             ant=aux;
             aux=aux->prox;}
         if (aux!=NULL){
             r++;
             if (ant==NULL)*a=aux->prox;
             else ant->prox=aux->prox;
             free (aux);
             aux=aux->prox;
         }
    }
    return r;
}

/**Questao 11**/
int removeDups (LInt *l){
    LInt atual = *l, seg, ant; int n=0;
    while(atual!=NULL){
        seg = atual->prox;
        ant = atual;
        while(seg!=NULL){
            if(seg->valor == atual->valor){
                    n++;
                    ant->prox = seg->prox;
                    free(seg);
                    seg = ant->prox;}
            else{
                    ant = seg;
                    seg = seg->prox;}
            }
        atual = atual->prox;
        }
    return n;
}

/**Questao 12**/
int maximo (LInt l){
    int max = l->valor;
        while (l!=NULL){
            if (l->valor>=max){ max=l->valor;l=l->prox;}
            else l=l->prox;}
    return max;
}

int removeMaiorL (LInt *l){
    LInt atual=*l, ant=NULL, r=NULL;
    int max = maximo (atual);
    while ( atual->valor!=max){ 
        ant=atual;
        atual=atual->prox;}
        
    r=atual->prox;
    free(atual); 
    if(ant==NULL) *l=r; 
    else ant->prox=r;
    return max;
}


/**Questao 13**/
void init (LInt *a){
    LInt l=*a,ant=NULL,aux=l;
    while (aux->prox!=NULL){
        ant=aux;
        aux=aux->prox;}
    if(ant==NULL) *a=NULL;
    else {ant->prox=NULL;
    free (aux);}
}

/**Questao 14**/
void appendL (LInt *a, int x){
    LInt aux = *a, nova, ant=NULL;
    while(aux!=NULL){
        ant=aux;
        aux=aux->prox;}
    nova = malloc (sizeof (struct lligada));
    nova->valor=x;
    nova->prox=NULL;
    if (ant==NULL) *a=nova;
    else ant->prox=nova;
}

/**Questao 15**/
void concatL (LInt *a, LInt l2){
    LInt l1=*a;
    if (l1==NULL) *a=l2;
    else{
        while(l1->prox!=NULL) l1=l1->prox;
        l1->prox=l2;
    }
}

/**Questao 16**/
LInt cloneL (LInt l){
    LInt r,ult;
    if (l==NULL) r=NULL;
    else{
        r= malloc (sizeof (struct lligada));
        r->valor=l->valor; ult=r;l=l->prox;
        while (l!=NULL){
            ult->prox=malloc (sizeof (struct lligada));
            ult=ult->prox; ult->valor=l->valor;l=l->prox;}
            ult->prox=NULL;
    }
    return r;
}

LInt cloneL (LInt l){
    LInt r, *e;
    e=&r;
    while (l!=NULL){
        *e=malloc (sizeof (struct LInt));
        (*e)->valor=l->valor;
        l=l->prox;
        e=&((*e)->prox);
    }
    *e=NULL;
    return r;
}

/**Questao 17**/
LInt cloneRev (LInt l){
    LInt r, a=NULL;
    while(l != NULL){
      r = (LInt) malloc (sizeof (struct lligada));
      r->valor=l->valor;
      r->prox=a;
      l = l->prox;
      a=r;
    }
    return r;
}

/**Questao 18**/
int maximo (LInt l){
    int max = 0;
    if (l==NULL) max=0;
    else{
        while (l!=NULL){
            if (l->valor>=max){ max=l->valor;l=l->prox;}
            else l=l->prox;}
    }
    return max;
}

int maximo (LInt l){
    int max = l->valor;
    while (l!=NULL){
        if (l->valor>=max){ max=l->valor;l=l->prox;}
        else l=l->prox;
    }
    return max;
}

/**Questao 19**/
int take (int n, LInt *l){
    int num=0; LInt a=*l,ant=NULL, aux=a;
    while(aux != NULL){
    if (num < n) {
        ant=aux; aux = aux->prox; num++;}
    else {
    ant->prox=aux->prox;
    aux = NULL;
    free(aux);}
    if (aux==NULL) {ant->prox=NULL;free (aux);}
    }
    *l=a;
    return num;
}

/**Questao 20**/
int drop (int n, LInt *a){
    int num=0; LInt l=*a, aux;
    while (l!=NULL && num<n){
        aux=l;
        free(aux);
        l=l->prox;
        num++;
    }
    *a=l;
    return num;
}

/**Questao 21**/
LInt NForward (LInt l, int N){
    int a=0; LInt aux=l;
    while (aux!=NULL && a<N){
        aux=aux->prox;
        a++;
    }
    return (aux);
}

/** Questao 22**/
int listToArray (LInt l, int v[], int N){
    int a=0; LInt aux=l;
    while (aux!=NULL && a<N){
        v[a]=aux->valor;
        aux=aux->prox;
        a++;
    }
    return a;
}

/**Questao 23**/
LInt arrayToList (int v[], int N){
    LInt r, ant=NULL;
    N--;
    while (N>=0){
        r=(LInt) malloc (sizeof (struct lligada));
        r->valor=v[N];
        r->prox=ant;
        ant=r;
        N--;
    }
    return ant;
}

/** Questao 24**/
LInt somasAcL (LInt l) {
    LInt r, ult; int n=0;
    if (l!=NULL){
        n=l->valor;
        r= (LInt) malloc (sizeof (struct lligada));
        r->valor=n; ult=r; l=l->prox;
        while(l!=NULL){ 
            n+=l->valor;
            ult->prox= (LInt) malloc (sizeof (struct lligada));
            ult=ult->prox; ult->valor=n;l=l->prox; ult->prox=NULL;
        }
    }
    return r;
}

/**Questao 25**/
void remreps (LInt l){
    LInt atual=l, seg, ant;
    while (atual!=NULL){
        seg=atual->prox;
        ant=atual;
        while(seg!=NULL && seg->valor==atual->valor){
                atual->prox=seg->prox;
                free(seg);
                seg=ant->prox;
        }
        atual=atual->prox;
    }
}

/**Questao 26**/
LInt rotateL (LInt l){
    LInt aux=l, next, head; int v;
    if (aux==NULL) return NULL;
    head=l;
    v=head->valor;
    while (aux->prox!=NULL){
        next = aux->prox;
        aux->valor=next->valor;
        aux=aux->prox;
    }
    aux->valor=v;
    aux->prox=NULL;
    return head;
}

typedef struct nodo{
    int valor;
    struct nodo *esq,*dir;
}*ABin;

/**Questao 27**/
LInt parte (LInt l){
    LInt next=NULL,start =NULL;
    while (l!=NULL && l->prox!=NULL){
        next=l->prox;
        if (start==NULL)
            start=next;
        l->prox=next->prox;
        l=next;
    }
    return start;
}

/**Questao 28**/
int altura (ABin a){
    int n=0;
    if (a==NULL) n=0;
    else n = 1 + max(altura(a->esq),altura(a->dir));
    return n;
}

int max (int e, int d){
    return e>d?e:d;
}

/**Questao 29**/
ABin cloneAB (ABin a) {
    ABin r;
    if (a==NULL) r=NULL;
    else {
        r= (ABin) malloc (sizeof (ABin));
        r->valor=a->valor;
        r->dir=cloneAB(a->dir);
        r->esq=cloneAB(a->esq);
    }
    return r;
}

/**Questao 30**/
void mirror (ABin *a) {
    ABin r=*a, d;
    if (r==NULL) r=NULL;
    else{
        mirror(&r->esq);
        mirror(&r->dir);
        d=r->dir;
        r->dir=r->esq;
        r->esq=d;
    }
    *a=r;
}

/**Questao 31**/
void inorderAux (ABin a, LInt *l){
  if(a != NULL) {
    inorderAux(a->dir,l);
    *l= newLInt(a->valor,*l);
    inorderAux(a->esq,l);
  }
}

void inorder (ABin a, LInt *l){
  *l = NULL;
  inorderAux(a,l);
}

/**Questao 32**/
void preorderAux (ABin a, LInt *l){
    if(a != NULL){
         preorderAux(a->dir,l);
         preorderAux(a->esq,l);
         *l= newLInt(a->valor,*l);
    }
}

void preorder(ABin a, LInt *l){
  *l = NULL;
  preorderAux(a,l);
}

//**Questao 33**/
void posorderAux (ABin a, LInt *l){
  if(a != NULL) {
    *l= newLInt(a->valor,*l);
    posorderAux(a->dir,l);
    posorderAux(a->esq,l);
  }
}

void posorder(ABin a, LInt *l){
  *l = NULL;
  posorderAux(a,l);
}

/**Questao 34**/
int depth (ABin a, int x) {
    int num=1;
    if (a==NULL) num=-1;
    else{
         if (a->valor!=x){
             if (depth(a->esq,x)!=-1 && depth(a->dir,x)!=-1){
                 if (depth(a->esq,x)>depth(a->dir,x)) num+=depth(a->dir,x);
                 else num+=depth(a->esq,x);
             }
             else if (depth(a->dir,x)!=-1) num+=depth(a->dir,x);
                    else if (depth(a->esq,x)!=-1) num+=depth(a->esq,x);
                         else num=-1;
         }
    }
    return num;
}

/**Questao 35**/
int freeAB (ABin a) {
    int r;
    if (a==NULL) r=0;
    else{
        r=1 + freeAB(a->esq) + freeAB(a->dir);
        free(a);
    }
    return r;
}

/**Questao 36**/
int freeAB (ABin a) {
    int r=0;
    if (a!=NULL){
        r=1 + freeAB(a->esq) + freeAB(a->dir);
        free(a);
    }
    return r;
} 
 
int pruneAB (ABin *a, int l){
     int n = 0; ABin r=*a;
     if (r!=NULL){
          if(l!=0) n = pruneAB( &(r->esq),l-1 ) + pruneAB (&(r->dir),l-1 );
          else{
               n = freeAB(r);
               *a = NULL;
          }
     }
     return n;
}

/**Questao 37**/
int iguaisAB (ABin a, ABin b) {
    int r=0;
    if (a==NULL && b==NULL) r=1;
    else if(a!=NULL && b!=NULL && a->valor==b->valor && iguaisAB(a->esq,b->esq) && iguaisAB(a->dir,b->dir)) r=1;
    return r;
}

/**Questao 38**/
LInt nivelL (ABin a, int n){
    LInt l = NULL;
    LInt p= NULL;
  if (a == NULL) l = NULL;
  else{
    if (n == 1)
       l = newLInt(a->valor,NULL);
    
    else{
      p = nivelL(a->dir, n - 1);
      l = nivelL(a->esq, n - 1);
    }
  }
  
  LInt* e = &l;
  while(*e != NULL)
      e = &(*e)->prox;
  *e = p;
 
  return l;
}

/**Questao 39**/
int nivelV (ABin a, int n, int v[]) {
    int num=0;
    if (a!=NULL){
        if (n==1){
            v[num]=a->valor;
            num++;
        }
        else{
            num=nivelV(a->esq,n-1,v);
            num+=nivelV(a->dir,n-1,v+num);
        }
    }
    return num;
}

/**Questao 40**/
int dumpAbin (ABin a, int v[], int N) {
    int i=0;
    if (a!=NULL){
    if (i<N) i= dumpAbin (a->esq,v,N);
    if (i<N){ v[i]=a->valor;i++;}
    if (i<N) i+= dumpAbin (a->dir,v+i,N-i);
    }
    return i;
}

/**Questao 41**/
int somasAcAux (ABin a){
   int r;
   if (a==NULL) r=0;
   else r=a->valor;
   return r;
}

ABin somasAcA (ABin a) {
    ABin r;
    if (a==NULL) r=NULL;
    else{
        r= (ABin) malloc (sizeof (ABin));
        r->esq = somasAcA (a->esq);
        r->dir = somasAcA (a->dir);
        r->valor = a->valor + somasAcAux(r->esq) + somasAcAux(r->dir);
    }
    return r;
}

/**Questao 42**/
int contaFolhas (ABin a){
    int n=0;
    if (a==NULL) n=0;
    else{
    if (a->esq==NULL && a->dir==NULL) n=1;
    else n = contaFolhas (a->esq) + contaFolhas (a->dir);}
    return n;
}

/**Questao 43**/
ABin cloneMirror (ABin a) {
    ABin r;
    if (a==NULL) r=NULL;
    else{
        r=(ABin) malloc(sizeof(ABin));
        r->valor=a->valor;
        r->dir=cloneMirror(a->esq);
        r->esq=cloneMirror(a->dir);
    }
    return r;
}

/**Questao 44**/
int addOrd (ABin *a, int x) {
    ABin l = *a; int r=0;
    if (l==NULL){
        l = (ABin) malloc (sizeof (ABin));
        l->valor=x;
        l->esq=l->dir=NULL;
    }
    else{ if (l->valor==x) r=1;
          else if (l->valor>x){ if (addOrd(&(l->esq),x)) r=1;}
               else{ if (addOrd(&(l->dir),x)) r=1;}
    }
    *a=l;
    return r;
}

/** Questão 45**/
int lookupAB (ABin a, int x){
    int r=1;
    while (a!=NULL && (a->valor)!=x){
        if (x>a->valor) a=a->dir;
        else a=a->esq;
    }
    if (a==NULL) r=0;
    return r;
}

/**Questao 46**/
int depthOrd (ABin a, int x) {
    int n=1;
    if (a==NULL) n=-1;
    else{
        if(x==a->valor) n=1;
        else if (depthOrd(a->esq,x)!=-1) {n+=depthOrd (a->esq,x);}
             else if (depthOrd(a->dir,x)!=-1) {n+=depthOrd(a->dir,x);}
                  else n=-1;
    }
    return n;
}

/**Questao 47**/
int maiorAB (ABin a){
    int maior=a->valor;
    while (a != NULL){
        if ((a->valor)>maior) maior = a->valor;
        a=a->dir;
    }
    return maior;
}

/**Questao 48**/
void removeMaiorA (ABin *a) {
  if(*a != NULL){ 
        while((*a)->dir!= NULL)  a = &(*a)->dir;
        *a = (*a)->esq;
  }
}

/**Questao 49**/
int quantosMaiores (ABin a,int x){
    int r=0;
    if (a==NULL) r=0;
    else{ if ((a->valor)>x) r++;
    r +=quantosMaiores (a->dir,x);
    r +=quantosMaiores (a->esq,x);}
    return r;
}

/**Questao 50**/
int length (LInt l){
  int r = 0;
    while(l != NULL){
      r++;
      l = l->prox;
    }
  return r;
}


ABin lBaux(LInt l, int n, LInt *r){
  ABin ar;

  if(n <= 0){
      *r = l;
      ar = NULL;
  }
  else {
    ar = (ABin) malloc(sizeof(struct nodo));
    ar -> esq = lBaux(l, n/2, &l);
    ar -> valor = l -> valor;
    ar -> dir = lBaux(l -> prox, (n - (n/2) - 1), r);
  }

  return ar;
}

void listToBTree(LInt l, ABin *a){
  *a = lBaux(l, length(l), &l);
}

/**Questao 51**/
int deProcura (ABin a) {
    int r=0;
    if (a==NULL) r=1;
    else if (menor(a->esq,a->valor) && maior(a->dir,a->valor) && deProcura(a->esq) && deProcura(a->dir)) r=1;
    return r;
}

int menor (ABin a, int x){
    int r=0;
    if (a==NULL) r=1;
    else if (a->valor<x && menor(a->dir,x) && menor(a->esq,x)) r=1;
    return r;
}

int maior (ABin a, int x){
    int r=0;
    if (a==NULL) r=1;
    else if (a->valor>x && maior(a->dir,x) && maior(a->esq,x)) r=1;
    return r;
}
