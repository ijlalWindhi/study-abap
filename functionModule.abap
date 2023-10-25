DATA : lv_date    TYPE sy-datum,
       lv_date2   TYPE sy-datum,
       lv_time    TYPE mara-mhdhb,
       lv_iprkz   TYPE mara-iprkz,
       lv_day     TYPE vtbbewe-atage,
       lv_month   TYPE vtbbewe-atage,
       lv_year    TYPE vtbbewe-atage.

lv_date = sy-datum.
lv_time = 5.
lv_iprkz = 2.

* GLOBAL FUNCTION
CALL FUNCTION 'ADD_TIME_TO_DATE'
  EXPORTING
    i_idate               = lv_date
    i_time                = lv_time
    i_iprkz               = lv_iprkz
*   I_RDMHD               =
  IMPORTING
    o_idate               = lv_date2
  EXCEPTIONS
    invalid_period        = 1
    invalid_round_up_rule = 2
    internal_error        = 3
    OTHERS                = 4.
IF sy-subrc <> 0.
  WRITE sy-subrc.
ELSE.
  WRITE : / lv_date2.
* Implement suitable error handling here
ENDIF.

CALL FUNCTION 'FIMA_DAYS_AND_MONTHS_AND_YEARS'
  EXPORTING
*    i_date_from           = lv_timeF
    i_date_from           = lv_date
*   i_key_day_from        = '00'
*    i_date_to             = lv_timeT
    i_date_to             = '20231025'
*   i_key_day_to          = '00'
*   i_flg_separate        = ' '
    i_flg_round_up        = ''
  IMPORTING
    e_days                = lv_day
    e_months              = lv_month
    e_years               = lv_year.

IF sy-subrc <> 0.
  WRITE sy-subrc.
ELSE.
  WRITE : / 'Days: ', lv_day, 'Months: ', lv_month, 'Years: ', lv_year.
ENDIF.