CLASS perbankan DEFINITION.
    PUBLIC SECTION.
        DATA: saldo TYPE i.
        METHODS constructor.
        METHODS tampilkanSaldo EXPORTING totalSaldo TYPE i.
        METHODS tambahSaldo IMPORTING tambahanSaldo TYPE i.
        METHODS kurangSaldo IMPORTING penguranganSaldo TYPE i.
ENDCLASS.

CLASS perbankan IMPLEMENTATION.
    METHOD constructor.
        saldo = 0.
    ENDMETHOD.

    METHOD tampilkanSaldo.
        totalSaldo = saldo.
    ENDMETHOD.

    METHOD tambahSaldo.
        saldo = saldo + tambahanSaldo.
        WRITE: / 'Saldo ditambah: ', tambahanSaldo.
    ENDMETHOD.

    METHOD kurangSaldo.
        saldo = saldo - penguranganSaldo.
        WRITE: / 'Saldo dikurang: ', penguranganSaldo.
    ENDMETHOD.
ENDCLASS.

START-OF-SELECTION.
DATA: objBank TYPE REF TO perbankan,
      v_saldo TYPE i.

CREATE OBJECT objBank.

CALL METHOD: objBank->tampilkanSaldo IMPORTING totalSaldo = v_saldo.
WRITE: / 'Saldo anda: ', v_saldo.

CALL METHOD: objBank->tambahSaldo EXPORTING tambahanSaldo = 1000000.

CALL METHOD: objBank->kurangSaldo EXPORTING penguranganSaldo = 100000.

CALL METHOD: objBank->tampilkanSaldo IMPORTING totalSaldo = v_saldo.
WRITE: / 'Saldo anda sekarang: ', v_saldo.