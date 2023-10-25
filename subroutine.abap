DATA : lv_date    TYPE sy-datum,
       lv_tanggal TYPE string,
       lv_bulan   TYPE string,
       lv_conv    TYPE string.

lv_date = sy-datum.

* Call local function
PERFORM f_date USING lv_date lv_tanggal.
WRITE : / lv_tanggal, /, lv_date.

*PARAMETERS : lv_timeF TYPE VTBBEWE-DBERBIS,
*       lv_timeT TYPE VTBBEWE-DBERBIS.

* SUBROUTINE (LOCAL FUNCTION)
FORM f_date USING lv_date TYPE sy-datum
      CHANGING lv_tangggal TYPE string.

  lv_bulan = lv_date+4(2).

  CASE lv_bulan.
    WHEN '01'.
      lv_conv = 'Januari'.
    WHEN '02'.
      lv_conv = 'Februari'.
    WHEN '03'.
      lv_conv = 'Maret'.
    WHEN '04'.
      lv_conv = 'April'.
    WHEN '05'.
      lv_conv = 'Mei'.
    WHEN '06'.
      lv_conv = 'Juni'.
    WHEN '07'.
      lv_conv = 'Juli'.
    WHEN '08'.
      lv_conv = 'Agustus'.
    WHEN '09'.
      lv_conv = 'September'.
    WHEN '10'.
      lv_conv = 'Oktober'.
    WHEN '11'.
      lv_conv = 'November'.
    WHEN '12'.
      lv_conv = 'Desember'.
  ENDCASE.

  CONCATENATE lv_date+6(2) lv_conv lv_date+0(4) INTO lv_tangggal SEPARATED BY '-'.


ENDFORM.