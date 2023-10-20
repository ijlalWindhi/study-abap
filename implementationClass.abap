CLASS mobil DEFINITION.
    PUBLIC SECTION.
        DATA: kecepatan TYPE i VALUE 0.
        METHODS tambahKecepatan IMPORTING x TYPE i.
ENDCLASS.

CLASS mobil IMPLEMENTATION.
    METHOD tambahKecepatan.
        WRITE: / 'kecepatan awal: ', kecepatan.
        kecepatan = kecepatan + x.
        WRITE: / 'kecepatan ditambah: ', kecepatan, /.
    ENDMETHOD.
ENDCLASS.

START-OF-SELECTION.
DATA: objMobil TYPE REF TO mobil.
CREATE OBJECT: objMobil.
CALL METHOD: objMobil->tambahKecepatan EXPORTING x = 10.
CALL METHOD: objMobil->tambahKecepatan EXPORTING x = 20.
CALL METHOD: objMobil->tambahKecepatan EXPORTING x = 40.