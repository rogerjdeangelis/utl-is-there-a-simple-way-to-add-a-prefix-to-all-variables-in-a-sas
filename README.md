# utl-is-there-a-simple-way-to-add-a-prefix-to-all-variables-in-a-sas
Is there a simple way to add a prefix to all variables in a sas
    %let pgm=utl-is-there-a-simple-way-to-add-a-prefix-to-all-variables-in-a-sas;

    %stop_submission;

    Is there a simple way to add a prefix to all variables in a sas

    github
    https://tinyurl.com/yeynj8y5
    https://github.com/rogerjdeangelis/utl-is-there-a-simple-way-to-add-a-prefix-to-all-variables-in-a-sas

    communities.sas
    https://tinyurl.com/4cxx5new
    https://communities.sas.com/t5/SAS-Programming/Is-there-a-simple-way-to-add-a-prefix-to-all-variables-in-a-SAS/m-p/971383#M377305

    /**************************************************************************************************************************/
    /* INPUT                   |   PROCESS                                 |   OUTPUT                                         */
    /* =====                   |   =======                                 |   ======                                         */
    /*  NAME      SEX    AGE   |   %array(_vs,values=%utl_varlist(class)); |                                                  */
    /*                         |                                           |   STUDENT_    STUDENT_    STUDENT_               */
    /* Alfred      M      14   |   proc datasets lib=work nolist;          |     NAME        SEX          AGE                 */
    /* Alice       F      13   |   modify class ;                          |                                                  */
    /* Barbara     F      13   |    rename                                 |   Alfred         M           14                  */
    /* Carol       F      14   |     %do_over(_vs,phrase=?=student_?);     |   Alice          F           13                  */
    /* Henry       M      14   |   run;quit;                               |   Barbara        F           13                  */
    /* James       M      12   |                                           |   Carol          F           14                  */
    /*                         |                                           |   Henry          M           14                  */
    /*                         |                                           |   James          M           12                  */
    /* data class;             |                                           |                                                  */
    /*   input                 |                                           |                                                  */
    /*     name$               |                                           |                                                  */
    /*     sex$ age;           |                                           |                                                  */
    /* cards4;                 |                                           |                                                  */
    /* Alfred  M 14            |                                           |                                                  */
    /* Alice   F 13            |                                           |                                                  */
    /* Barbara F 13            |                                           |                                                  */
    /* Carol   F 14            |                                           |                                                  */
    /* Henry   M 14            |                                           |                                                  */
    /* James   M 12            |                                           |                                                  */
    /* ;;;;                    |                                           |                                                  */
    /* run;quit;               |                                           |                                                  */
    /**************************************************************************************************************************/

    /*              _
      ___ _ __   __| |
     / _ \ `_ \ / _` |
    |  __/ | | | (_| |
     \___|_| |_|\__,_|

    */
