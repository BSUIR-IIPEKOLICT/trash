; Переписать содержимое регистра А в регистры В, X и Y.

    org $8000

    psha    ;   сохранить в стек А
    pulb    ;   извлечь сие в регистр B
    psha    ;   сохранить в стек А
    pshb    ;   сохранить в стек B
    xgdx    ;   поменять местами X и D
    pulb    ;   восстановить из "бекапа" B
    pula    ;   то же самое и для А
    psha    ;   сохранить в стек А
    pshb    ;   сохранить B
    xgdy    ;   поменять местами X и D
    pulb    ;   восстановить B
    pula    ;   восстановить A
hlt
