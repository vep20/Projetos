    li $t0, 10         # N = 10
    li $t1, 7          # a = 7
    li $t2, 18         # d = 18
    li $t3, 0          # i = 0
    li $t5, 0          # soma = 0

loop:
    # Verifica se i < N
    sub $t6, $t0, $t3  # $t6 = N - i
    branch $t6, $zero, fim_loop # Se $t6 == 0, termina o loop

    # Calcula o termo atual: a + i * d
    mult $t7, $t3, $t2 # $t7 = i * d
    add $t4, $t1, $t7  # $t4 = a + $t7 (termo atual)

    # Soma o termo atual à soma total
    add $t5, $t5, $t4  # soma += termo atual

    # Incrementa i
    addi $t3, $t3, 1   # i++

    jump loop

fim_loop:
    show $t5  # Exibe soma

    halt  # Finaliza o programa


