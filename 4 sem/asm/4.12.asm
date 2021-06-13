; Произвести обмен старших тетрад ячеек, расположенных в блоках
; $8200 ... $821f и $8220 ... $823f.

	org $8000

	ldaa #$24	;	рандомные числа для демонстрации работы
	ldab #$56
	staa $8200	;	загрузка чисел в краевые ячейки диапазонов
	staa $8201
	staa $821e
	staa $821f
	stab $8220
	stab $8221
	stab $823e
	stab $823f

	ldx #$821f	;	счетчик 1 числа (значение = номер итерируемой ячейки)
	ldy #$823f	;	счетсик 2 числа (значение = номер итерируемой ячейки)
	ldab #$20	;	колисечтво итераций

loop	ldaa 0,x	;	итерация, загрузка в А 1 числа (цикл, который будет действ, пока b не дост 0)
	anda #%11110000	;	выделение его старшей тетрады
	staa $0001		;	сохранение в яч 0001
	ldaa 0,y		;	загрузка в А 2 числа
	anda #%00001111	;	обнуление его старшей тетрады
	oraa $0001		;	OR с яч 0001
	staa $0002		;	сохранение в ячейку 0002

	ldaa 0,y		;	загрузка в А 2 числа
	anda #%11110000	;	выделение его старшей тетрады
	staa $0001		;	сохранение в яч 0001
	ldaa 0,x		;	загрузка в А 1 числа
	anda #%00001111	;	обнуление его старшей тетрады
	oraa $0001		;	OR с 0001
	staa 0,x		;	сохранение в 1 итерируемую ячейку (Х)

	ldaa $0002		;	загрузка в А 0002 яч
	staa 0,y		;	сохранение во 2 итерируемую ячейку (Y)
	
	dex				;	x--
	dey				;	y--
	decb			;	b--
	bne loop		;	конец итерации
hlt