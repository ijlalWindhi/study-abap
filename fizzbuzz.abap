REPORT fizzbuzz.

START-OF-SELECTION.
    PERFORM: fizzbuzz USING 15.

FORM fizzbuzz USING akhir TYPE i.
    DATA: i TYPE i,
          n TYPE i.

    n = akhir.

    DO n TIMES.
        i = sy-index.
        IF i MOD 3 = 0 AND i MOD 5 = 0.
            WRITE: / 'FizzBuzz'.
        ELSEIF i MOD 3 = 0.
            WRITE: / 'Fizz'.
        ELSEIF i MOD 5 = 0.
            WRITE: / 'Buzz'.
        ELSE.
            WRITE: / i.
        ENDIF.
    ENDDO.
ENDFORM.