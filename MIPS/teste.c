#include <stdio.h>

int main() {
    int N,      // Número de termos
        a,      // Termo inicial
        d,      // Razão
        soma;   // Soma da PA
    
    N = 10;    
    a = 7;     
    d = 18;    
    soma = 0;

    for (int i = 0; i < N; i++) {
        soma += a + i * d;
        printf("%d\n", soma);
    }

    printf("%d\n", soma);
    
    return 0;
}