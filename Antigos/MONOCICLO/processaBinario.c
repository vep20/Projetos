// ======================================
// Autor: Selton Miranda Rolim
// ======================================

#include <stdio.h>

#define DEFAULT_NAME "mod0.bin.hex"

int main(int argc, char **argv)
{
        if (argc < 2) {
                fprintf(stderr, "Uso: %s <arquivo binario>\n", argv[0]);
                return 1;
        } 

        FILE *entrada, *saida;
        const char *nomeSaida;
        unsigned char buf[4];
        size_t bytes;

        entrada = fopen(argv[1], "rb");
        if (!entrada) {
                fprintf(stderr, "Nao foi possivel abrir o arquivo %s\n", argv[1]);
                return 1;
        }

        if (argc == 3) nomeSaida = argv[2];
        else nomeSaida = DEFAULT_NAME;

        saida = fopen(nomeSaida, "wb");
        if (!saida) {
                fprintf(stderr, "Nao foi possivel escrever no arquivo %s\n", nomeSaida);
                fclose(entrada);
                return -1;
        }

        fprintf(saida, "v2.0 raw\n");
        while ((bytes = fread(buf, 1, 4, entrada)) > 0) {
                for (size_t i = 0; i < bytes; i++) 
                        fprintf(saida, "%02X", buf[bytes - 1 - i]);
                fprintf(saida, "\n");

                for (int j = 0; j < 3; j++)
                        fprintf(saida, "0\n");
        }

        fclose(entrada);
        fclose(saida);

        return 0;
}
