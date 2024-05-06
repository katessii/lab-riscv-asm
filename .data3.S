.data

N: .word 6
M: .word 6

sum: .word 0

array:  .word 1, 3, 0, 0, 0, 1
        .word 0, 1, 0, 0, 1, 0
        .word 0, 0, 1, 1, 0, 0
        .word 0, 0, 1, 1, 0, 0
        .word 0, 1, 0, 0, 1, 0
        .word 1, 0, 0, 0, 0, 1

.text

main:

    la a2, N
    la a3, M
    la a4, array
    la a5, sum

    li a6, 5
    li a7, 0
    li s1, 0
    lw s2, 0(a2)
    lw s3, 0(a3)
    

call process
call end

process:
addi t0, x0, 0 # Номер текущей строки
    

colomn_loop: bge t0, s3, end
addi t2, x0, 0 # номер столбца
row_loop: bge t2, s2, colomn_loop
lw t3, 0(a4) # Выгрузка значения элемента из массива
addi a4, a4, 4 # инкремент указателя массива
beq t2, t0, skip_dig1 # если номер столбца (t2) = номеру строки (t0), то переход в skip-dig1
add a7, t2, t0 # а7 = t2 + t0 (сумма элементов индексов строки и столбца)
beq a7, a6, skip_dig1 # если сумма = 5, то пропуск
add s1, s1, t3 # сумммирование элемента не на диагоналях
addi t2, t2, 1 # увеличение номера столбца на 1
beq t2, s2, ttt # проверка на конец строки
j row_loop
j colomn_loop


ttt:
addi t0, t0, 1 # увеличение номера строки на 1
call colomn_loop


skip_dig1:
addi t2, t2, 1 # увеличение номера элемента строки на 1
beq t2, s2, ttt # проверка на конец строки
call row_loop

end:
addi a0, x0, 10
ecall

sw a5, 0(s1)
ret