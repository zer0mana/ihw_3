	.file	"ihw3.c"
	.intel_syntax noprefix 			# Используем синтаксис в стиле Intel
	.text					# Начало секции
	.globl	solve				# Объявляем и экспортируем вовне символ `solve`
	.type	solve, @function
solve:						# Метка `solve:`
	push	rbp		# / Пролог функции (1/3). Сохранили предыдущий rbp на стек.
	mov	rbp, rsp	# | Пролог функции (2/3). Вместо rbp записали rsp.
	sub	rsp, 48		# \ Пролог функции (3/3). А сам rsp сдвинули на 936 байт
	movsd	QWORD PTR -40[rbp], xmm0	# rbp[-40] := xmm0
	pxor	xmm0, xmm0			# xmm0 := xmm0 << xmm0
	movsd	QWORD PTR -8[rbp], xmm0		# rbp[-8] := xmm0
	movsd	xmm0, QWORD PTR .LC1[rip]	# xmm0 := rip[.LC`]
	movsd	xmm7, xmm0	# rbp[-24] := xmm0
	movsd	xmm0, QWORD PTR .LC2[rip]	# xmm0 := rip[.LC2]
	movsd	QWORD PTR -16[rbp], xmm0	# rbp[-16] := xmm0
.L2:						# Метка `.L2:`
	movsd	xmm0, QWORD PTR -8[rbp]		# xmm0 := rbp[-8]
	movsd	xmm6, xmm0	# rbp[-32] := xmm0
	movsd	xmm1, QWORD PTR -16[rbp]	# xmm1 := rbp[-16]
	movsd	xmm0, QWORD PTR .LC2[rip]	# xmm0 := rip[.LC2]
	addsd	xmm0, xmm1			# xmm0 += xmm1
	mov	rax, QWORD PTR .LC3[rip]	# наша строка "%lf"
	movapd	xmm1, xmm0			# xmm1 := xmm0
	movq	xmm0, rax			# xmm0 := rax
	call	pow@PLT				# Вызывает функцию `pow@PLT`
	movsd	QWORD PTR -48[rbp], xmm0	# rbp[-48] := xmm0
	movsd	xmm0, QWORD PTR -40[rbp]	# xxmm0 := rbp[-40]
	movq	xmm1, QWORD PTR .LC4[rip]	# xmm1 := rip[.LC4]
	movapd	xmm2, xmm0			# xmm2 := xmm1
	xorpd	xmm2, xmm1			# xmm2 := xmm2 << xmm1
	movq	rax, xmm2			# rax := xmm2
	movsd	xmm0, QWORD PTR -16[rbp]	# xmm0 := rbp[-16]
	movapd	xmm1, xmm0			# xmm1 := xmm0
	movq	xmm0, rax			# xmm0 := rax
	call	pow@PLT				# Вызывает функцию `pow@PLT`
	mulsd	xmm0, QWORD PTR -48[rbp]	# xmm0 %= rbp[-48]
	divsd	xmm0, QWORD PTR -16[rbp]	# xmm0 /= rbp[-16]
	movsd	xmm1, QWORD PTR -8[rbp]		# xmm1 := rbp[-8]
	addsd	xmm0, xmm1			# xmm0 += xmm1
	movsd	QWORD PTR -8[rbp], xmm0		# rbp[-8] := xmm0
	movsd	xmm1, QWORD PTR -16[rbp]	# xmm1 := rbp[-16]
	movsd	xmm0, QWORD PTR .LC2[rip]	# xmm0 := rip[.LC2]
	addsd	xmm0, xmm1			# xmm0 += xmm1
	movsd	QWORD PTR -16[rbp], xmm0	# rbp[-16] := xmm0
	movsd	xmm0, QWORD PTR -8[rbp]		# xmm0 := rbp[-8]
	subsd	xmm0, xmm6	# xmm0 -= rbp[-32]
	movq	xmm1, QWORD PTR .LC5[rip]	# xmm1 := rip[.LC5]
	andpd	xmm0, xmm1			# xmmo := xmm0 & xmm1
	comisd	xmm0, xmm7	# Сравнение xmm0 rbp[-24]
	ja	.L2				# Переход если больше в L2
	movsd	xmm0, QWORD PTR -8[rbp]		# xmm0 := rbp[-8]
	movq	rax, xmm0			# rax := xmm0
	movq	xmm0, rax			# xmm0 := rax
	leave					# / Эпилог (1/2)
	ret					# \ Эпилог (2/2)
	.size	solve, .-solve
	.section	.rodata			# Переходим в секцию .rodata
.LC6:						# Метка `.LC6:`
	.string	"%lf"			# …прямо перед тем, как положить в файл строку "%lf\0"
	.text
	.globl	main			# Объявляем и экспортируем вовне символ `main`
	.type	main, @function
main:					# Теперь метка `main:`, именно её мы и экспортируем
	push	rbp				# Помещаем rbp на стек
	mov	rbp, rsp			# rbp := rsp
	sub	rsp, 16				# rsp -= 16
	lea	rax, -8[rbp]			# rax := rbp[-8]
	mov	rsi, rax			# rsi := rax
	lea	rax, .LC6[rip]			# Строка "%lf"
	mov	rdi, rax			# rdi := rax
	mov	eax, 0				# eax := 0
	call	__isoc99_scanf@PLT		# Вызывает функцию `scanf@PLT`
	mov	rax, QWORD PTR -8[rbp]		# rax := rbp[-8]
	movq	xmm0, rax			# xmm0 := rax
	call	solve				# Вызывает функцию `solve`
	movq	rax, xmm0			# rax := xmm0
	movq	xmm0, rax			# xmm0 := rax
	lea	rax, .LC6[rip]			# Строка "%lf"
	mov	rdi, rax			# rdi := rax
	mov	eax, 1				# eax := 1
	call	printf@PLT			# Вызывает функцию `printf@PLT`
	mov	eax, 0				# eax := 0
	leave					# / Эпилог (1/2)
	ret					# \ Эпилог (2/2)
	.size	main, .-main
	.section	.rodata
	.align 8
.LC1:
	.long	-350469331
	.long	1057634018
	.align 8
.LC2:
	.long	0
	.long	1072693248
	.align 8
.LC3:
	.long	0
	.long	-1074790400
	.align 16
.LC4:
	.long	0
	.long	-2147483648
	.long	0
	.long	0
	.align 16
.LC5:
	.long	-1
	.long	2147483647
	.long	0
	.long	0
	.ident	"GCC: (Ubuntu 11.2.0-19ubuntu1) 11.2.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
