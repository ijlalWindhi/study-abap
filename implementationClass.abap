CLASS mobil DEFINITION.
    PUBLIC SECTION.
        DATA: kecepatan TYPE i.
        METHODS tambahKecepatan IMPORTING x TYPE i.
        METHODS bacaKecepatan EXPORTING e_kecepatan TYPE i.
        METHODS constructor.
ENDCLASS.

CLASS mobil IMPLEMENTATION.
    METHOD constructor.
        kecepatan = 0.
    ENDMETHOD.

    METHOD tambahKecepatan.
        WRITE: / 'kecepatan awal: ', kecepatan.
        kecepatan = kecepatan + x.
        WRITE: / 'kecepatan ditambah menjadi: ', kecepatan, /.
    ENDMETHOD.

    METHOD bacaKecepatan.
        e_kecepatan = kecepatan.
    ENDMETHOD.
ENDCLASS.

START-OF-SELECTION.
DATA: objMobil TYPE REF TO mobil,
      v_kecepatan TYPE i.

CREATE OBJECT: objMobil.

CALL METHOD: objMobil->tambahKecepatan EXPORTING x = 10.
CALL METHOD: objMobil->tambahKecepatan EXPORTING x = 30.
CALL METHOD: objMobil->bacaKecepatan IMPORTING e_kecepatan = v_kecepatan.

WRITE: / 'Kecepatan setelah ditambah: ', v_kecepatan.