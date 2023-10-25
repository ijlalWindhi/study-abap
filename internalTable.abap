TYPES : BEGIN OF ty_itab4,
          mandt               TYPE mandt,
          company_code        TYPE bukrs,
          nama                TYPE ylatdtjes05_01-nama,
          nip                 TYPE ylatdtjes05_01-nip,
          divisi              TYPE ylatdtjes05_01-divisi,
          pendidikan_terakhir TYPE ylatdtjes05_02-pendidikan_terakhir,
          jabatan             TYPE ylatdtjes05_01-jabatan,
          nama_pasangan       TYPE ylatdtjes05_03-nama_pasangan,
        END OF ty_itab4.

DATA : itab1 TYPE STANDARD TABLE OF ylatdtjes05_01,
       itab2 TYPE STANDARD TABLE OF ylatdtjes05_02,
       itab3 TYPE STANDARD TABLE OF ylatdtjes05_03 WITH HEADER LINE,
       itab4 TYPE STANDARD TABLE OF ty_itab4 WITH HEADER LINE,
       wa1   TYPE ylatdtjes05_01,
       wa2   TYPE ylatdtjes05_02.

SELECT * FROM ylatdtjes05_01 INTO TABLE itab1.
SELECT * FROM ylatdtjes05_02 INTO TABLE itab2.
SELECT * FROM ylatdtjes05_03 INTO TABLE itab3.
SELECT table_karyawan~*, table_pendidikan~pendidikan_terakhir, table_keluarga~nama_pasangan
    FROM ylatdtjes05_01 AS table_karyawan INNER JOIN ylatdtjes05_02 AS table_pendidikan ON table_karyawan~nip = table_pendidikan~nip
    INNER JOIN ylatdtjes05_03 AS table_keluarga ON table_karyawan~nip = table_keluarga~nip INTO CORRESPONDING FIELDS OF TABLE @itab4.

WRITE : / , 'TABLE KARYAWAN'.
ULINE.
LOOP AT itab1 INTO wa1.
  WRITE : / wa1-nip, '| NIP |', wa1-nama, '| NAMA |', wa1-divisi, '| DIVISI |', wa1-jabatan, '| JABATAN |' .
ENDLOOP.
ULINE.

WRITE : / , 'TABLE PENDIDIKAN TERAKHIR'.
ULINE.
LOOP AT itab2 INTO wa2.
  WRITE : / wa2-nip, '| NIP |', wa2-pendidikan_terakhir, '| PENDIDIKAN TERAKHIR |', wa2-ipk, '| IPK |'.
ENDLOOP.
ULINE.

WRITE : / , 'TABLE KELUARGA'.
ULINE.
LOOP AT itab3.
  WRITE : / itab3-nip, '| NIP |', itab3-nama_pasangan, '| NAMA PASANGAN |', itab3-jumlah_anak, '| JUMLAH ANAK |'.
ENDLOOP.
ULINE.

WRITE : / , 'JOIN TABLE KARYAWAN AND TABLE PENDIDIKAN'.
ULINE.
LOOP AT itab4.
  WRITE : / itab4-nip, '| NIP |',
  itab4-nama, '| NAMA |',
  itab4-divisi, '| DIVISI |',
  itab4-jabatan, '| JABATAN |',
  itab4-pendidikan_terakhir, '| PENDIDIKAN TERAKHIR|',
  itab4-nama_pasangan, '| NAMA PASANGAN |' .
ENDLOOP.
ULINE.