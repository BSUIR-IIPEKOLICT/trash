	org $8000

	ldx #$3216	;	���� �
	ldy #$2438	;	Y

	stx $0001	;	���������� � � ������ 0001-0002
	sty $0003	;	���������� Y � ������ 0003-0004

	ldx #$0002	;	������� ����� (�������� � �����)
	ldaa 0,x	;	������ � � ������ �������� �
	ldab 2,x	;	������ � B ������ �������� Y
	sba		;	� - B
	staa 0,x	;	��������� ��������� � - B � ������ 0002
	dex		;	���������� �������� �� 1
	ldaa 0,x	;	������ � � ������ �������� �
	sbca 2,x	;	�������� �� � ������ ������� Y
	staa 0,x	;	��������� ��������� � ������ 0001

	ldx $0001	;	������ ���� ��������� � ������� �
hlt