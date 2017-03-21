REPORT zfoobar.

* http://scn.sap.com/docs/DOC-46714

FORM functional_db1.

  DATA: lt_data TYPE STANDARD TABLE OF usr02 WITH DEFAULT KEY,
        ls_data LIKE LINE OF lt_data.


  SELECT * FROM usr02 INTO TABLE lt_data.

  READ TABLE lt_data INDEX 1 INTO ls_data.
  IF sy-subrc = 0.
    WRITE: / ls_data-bname.
  ENDIF.

ENDFORM.

FORM functional_db2.

  DATA: lt_data TYPE STANDARD TABLE OF usr02 WITH DEFAULT KEY,
        ls_data LIKE LINE OF lt_data.


  SELECT * FROM usr02 INTO TABLE lt_data.

  DELETE ADJACENT DUPLICATES FROM lt_data COMPARING bcode.

ENDFORM.

FORM functional_db3.

  DATA: lt_cdcls TYPE STANDARD TABLE OF cdcls WITH DEFAULT KEY.


  SELECT * FROM cdcls INTO TABLE lt_cdcls WHERE changenr = '123456'.

ENDFORM.

FORM functional_db4.

  DATA: lt_data TYPE STANDARD TABLE OF usr02 WITH DEFAULT KEY.


  SELECT usr02~bname FROM usr02
    INNER JOIN usr03 ON usr02~bname = usr02~bname
    INTO CORRESPONDING FIELDS OF TABLE @lt_data.

  DELETE ADJACENT DUPLICATES FROM lt_data COMPARING bcode.

ENDFORM.
