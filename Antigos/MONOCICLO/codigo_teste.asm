    addi x5, x0, 8 ; x5/t0 <- 0x00000008
    addi x6, x0, 2 ; x6/t1 <- 0x00000002
    slti x8, x6, 3 ; x8/s0 <- 0x00000001
    slti x8, x6, 2 ; x8/s0 <- 0x00000000
    slti x8, x6, 1 ; x8/s0 <- 0x00000000
    slt  x8, x5, x6 ; x8/s0 <- 0x00000000
    slt  x8, x6, x5 ; x8/s0 <- 0x00000001
    slt  x8, x6, x6 ; x8/s0 <- 0x00000000
    add  x7, x5, x6 ; x7/t2 <- 0x0000000a
    sub  x5, x5, x6 ; x5/t0 <- 0x00000006
    xor  x8, x5, x6 ; x8/s0 <- 0x00000004
    or   x8, x5, x6 ; x8/s0 <- 0x00000006
    and  x8, x5, x6 ; x8/s0 <- 0x00000002
    sll  x8, x5, x6 ; x8/s0 <- 0x00000018
    addi sp, x0, 1024 ; x2/sp <- 0x00000400
    sw   sp, x5, 0 ; MEM[1024] <- 0x00000006
    sw   sp, x6, 4 ; MEM[1028] <- 0x00000002
    lw   x6, sp, 0 ; x6/t1 <- 0x00000006
    lw   x5, sp, 4 ; x5/t0 <- 0x00000002
    lui  x9, 255 ; x9/s1 <- 0x000ff000
    beq  x0, x0, jump ; desvio tomado, PC <- 0x00000060 (jal ra, desvio1)
desvio1:
    beq  x5, x6, erro_desvio ; desvio nao tomado
    bne  x5, x5, erro_desvio ; desvio nao tomado
    bne  x5, x6, jumpr ; desvio tomado, PC <- 0x00000068 (jalr x0, ra, 0)
jump:
    jal ra, desvio1 ; jump, RA <- 0x00000064, PC <- 0x00000054 (beq  x5, x6, erro_desvio)
    ebreak ; deve executar o HALT no simulador de circuitos digitais (parar a simulação ou deixar de incrementar o PC)
jumpr:
    jalr x0, ra, 0 ; jump register, PC <- 0x00000064 (ebreak)
erro_desvio:
    addi x5, x0, 1 ; esta instrucao nao deve ser executada
    ebreak ; deve executar o HALT no simulador de circuitos digitais (parar a simulação ou deixar de incrementar o PC)
