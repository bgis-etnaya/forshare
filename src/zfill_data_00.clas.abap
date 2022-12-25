CLASS zfill_data_00 DEFINITION
 PUBLIC
 FINAL
 CREATE PUBLIC .

 PUBLIC SECTION.

   INTERFACES if_oo_adt_classrun .
 PROTECTED SECTION.
 PRIVATE SECTION.
ENDCLASS.



CLASS zfill_data_00 IMPLEMENTATION.

 METHOD if_oo_adt_classrun~main.
  DATA: lt_course   TYPE STANDARD TABLE OF zcourse_00  WITH EMPTY KEY,
         lt_schedule TYPE STANDARD TABLE OF zschedule_00 WITH EMPTY KEY.

   DELETE FROM zcourse_00.
   DELETE FROM zschedule_00.

   DELETE FROM zcourse_00d.
   DELETE FROM zschedule_00d.
   TRY.
     lt_course = VALUE #(
                   ( course_uuid = cl_system_uuid=>create_uuid_x16_static( ) course_id = 'BC400' course_name = 'ABAP Development' country = 'DE' price = 1000 currency_code = 'EUR' )
                   ( course_uuid = cl_system_uuid=>create_uuid_x16_static( ) course_id = 'BC401' course_name = 'ABAP Objects' country = 'DE' price = 1000 currency_code = 'EUR' )
                   ( course_uuid = cl_system_uuid=>create_uuid_x16_static( ) course_id = 'BC402' course_name = 'ABAP Advanced Development'  country = 'DE' price = 1000 currency_code = 'EUR' )
                   ( course_uuid = cl_system_uuid=>create_uuid_x16_static( ) course_id = 'BC403' course_name = 'Advanced ABAP Debugging'  country = 'KR' price = 2000 currency_code = 'KRW' ) ).


     DELETE FROM zcourse_00.
     INSERT zcourse_00 FROM TABLE @lt_course.
     out->write( |{ sy-dbcnt } entries in ZCOURSE modified| ).

     lt_schedule = VALUE #(
                     ( schedule_uuid = cl_system_uuid=>create_uuid_x16_static( ) course_uuid = lt_course[ 1 ]-course_uuid course_begin = '20200301' trainer = 'John Doe' is_online = abap_false location = 'Walldorf' )
                     ( schedule_uuid = cl_system_uuid=>create_uuid_x16_static( ) course_uuid = lt_course[ 2 ]-course_uuid course_begin = '20200308' trainer = 'Mary Jane' is_online = abap_true location = 'VLC' ) ).

     DELETE FROM zschedule_00.
     INSERT zschedule_00 FROM TABLE @lt_schedule.
     out->write( |{ sy-dbcnt } entries in ZSCHEDULE modified| ).
     COMMIT WORK.
   CATCH cx_uuid_error.
     "handle exception
   ENDTRY.
 ENDMETHOD.
 ENDCLASS.

