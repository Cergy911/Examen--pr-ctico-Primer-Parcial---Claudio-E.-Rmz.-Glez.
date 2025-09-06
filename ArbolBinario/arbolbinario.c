#include <stdio.h>
#include <stdlib.h>

typedef struct Node {
    int key;
    struct Node *L, *R;
} Node;

Node* newNode(int x){
    Node* n = (Node*)malloc(sizeof(Node));
    n->key = x; n->L = n->R = NULL; return n;
}

void insert(Node** root, int x){
    if(*root==NULL){ *root = newNode(x); return; }
    if(x < (*root)->key) insert(&((*root)->L), x);
    else insert(&((*root)->R), x);
}

void pre(Node* t){ if(!t) return; printf("%d ", t->key); pre(t->L); pre(t->R); }
void in (Node* t){ if(!t) return; in(t->L); printf("%d ", t->key); in(t->R); }
void post(Node* t){ if(!t) return; post(t->L); post(t->R); printf("%d ", t->key); }

int main(void){
    int n,x; Node* root=NULL;
    printf("Numero de nodos:\n");
    if(scanf("%d",&n)!=1) return 0;
    printf("Nodos a insertar:\n");
    for(int i=0;i<n;i++){ scanf("%d",&x); insert(&root,x); }
    printf("Preorden: "); pre(root); puts("");
    printf("Inorden: "); in(root); puts("");
    printf("Postorden: "); post(root); puts("");
    return 0;
}
