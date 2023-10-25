DATA: lv_1 TYPE string,
      lv_2 TYPE string,
      lv_3 TYPE string.

lv_1 = 10.
lv_2 = 5.

lv_3 = lv_1 + lv_2.
WRITE : / lv_3.

lv_3 = lv_2 - lv_1.
WRITE : / lv_3.

lv_3 = lv_2 * lv_1.
WRITE : / lv_3.

lv_3 = lv_1 / lv_2.
WRITE : / lv_3.

lv_3 = lv_1 MOD lv_2.
WRITE : / lv_3.

IF lv_1 = lv_2.
  WRITE : / 'SAMA'.
ELSEIF lv_1 <> lv_2.
  WRITE : / 'TIDAK SAMA'.
ELSE.
  WRITE : / 'Default'.
ENDIF.

IF lv_1 CP lv_2.
  WRITE : / 'masuk'.
ENDIF.