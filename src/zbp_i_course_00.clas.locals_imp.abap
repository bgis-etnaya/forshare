CLASS lhc_Course DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS set_country FOR DETERMINE ON SAVE
      IMPORTING keys FOR Course~set_country.

    METHODS checkRequired FOR VALIDATE ON SAVE
      IMPORTING keys FOR Course~checkRequired.

    METHODS get_authorizations FOR AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR Course RESULT result.

    METHODS set_block FOR MODIFY
      IMPORTING keys FOR ACTION Course~set_block.

    METHODS get_features FOR FEATURES
      IMPORTING keys REQUEST requested_features FOR Course RESULT result.

ENDCLASS.

CLASS lhc_Course IMPLEMENTATION.

  METHOD set_country.
  ENDMETHOD.

  METHOD checkRequired.
  ENDMETHOD.

  METHOD get_authorizations.
  ENDMETHOD.

  METHOD set_block.
  ENDMETHOD.

  METHOD get_features.
  ENDMETHOD.

ENDCLASS.
