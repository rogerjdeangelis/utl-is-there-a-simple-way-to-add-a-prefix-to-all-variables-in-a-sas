%let pgm=utl-is-there-a-simple-way-to-add-a-prefix-to-all-variables-in-a-sas;

%stop_submission;

Is there a simple way to add a prefix to all variables in a sas

 TWO SOLUTIONS

     1 Teds macros
       Ted Clay,
       tclay@ashlandhome.net

     2 Barts Macros
       Bartosz Jablonski
       yabwon@gmail.com

Related

github
https://tinyurl.com/yeynj8y5
https://github.com/rogerjdeangelis/utl-is-there-a-simple-way-to-add-a-prefix-to-all-variables-in-a-sas

github
https://tinyurl.com/nabe6tvt
https://github.com/rogerjdeangelis/utl-insights-on-sas-macros-and-macro-dosubl

Bartosz, Base Plus Package
https://tinyurl.com/5n748mya
https://github.com/SASPAC/baseplus/blob/main/baseplus.md#generateoneliners-macro-

communities.sas
https://tinyurl.com/4cxx5new
https://communities.sas.com/t5/SAS-Programming/Is-there-a-simple-way-to-add-a-prefix-to-all-variables-in-a-SAS/m-p/971383#M377305

/**************************************************************************************************************************/
/* INPUT                   |   PROCESS                                 |   OUTPUT                                         */
/* =====                   |   =======                                 |   ======                                         */
/*                         |                                           |                                                  */
/*  NAME      SEX    AGE   |  1 TEDS MACROS                            |                                                  */
/*                         |  =============                            |   STUDENT_    STUDENT_    STUDENT_               */
/* Alfred      M      14   |                                           |     NAME        SEX          AGE                 */
/* Alice       F      13   |   %array(_vs,values=%utl_varlist(class)); |                                                  */
/* Barbara     F      13   |                                           |   Alfred         M           14                  */
/* Carol       F      14   |   proc datasets lib=work nolist;          |   Alice          F           13                  */
/* Henry       M      14   |   modify class ;                          |   Barbara        F           13                  */
/* James       M      12   |    rename                                 |   Carol          F           14                  */
/*                         |     %do_over(_vs,phrase=?=student_?);     |   Henry          M           14                  */
/*                         |   run;quit;                               |   James          M           12                  */
/* data class;             |                                           |                                                  */
/*   input                 |   %arraydelete(_vs);                      |                                                  */
/*     name$               |                                           |                                                  */
/*     sex$ age;           |----------------------------------------------------------------------------------------------*/
/* cards4;                 |   2 BARTS MACROS                          |                                                  */
/* Alfred  M 14            |   ==============                          |                                                  */
/* Alice   F 13            |                                           |                                                  */
/* Barbara F 13            |   %loadPackage(macroArray)                |                                                  */
/* Carol   F 14            |   %loadPackage(baseplus)                  |                                                  */
/* Henry   M 14            |                                           |                                                  */
/* James   M 12            |   /* get help info:                       |                                                  */
/* ;;;;                    |   %helpPackage(baseplus                   |                                                  */
/* run;quit;               |    , '%getVars()')                        |                                                  */
/*                         |   %helpPackage(macroArray                 |                                                  */
/*                         |    , '%do_over()')                        |                                                  */
/*                         |   %helpPackage(macroArray                 |                                                  */
/*                         |    , '%deleteMacArray()')                 |                                                  */
/*                         |   */                                      |                                                  */
/*                         |                                           |                                                  */
/*                         |   /* create macro array _VS */            |                                                  */
/*                         |   %getVars(work.class,mcArray=_vs)        |                                                  */
/*                         |                                           |                                                  */
/*                         |   proc datasets lib=work nolist;          |                                                  */
/*                         |    modify class ;                         |                                                  */
/*                         |     rename                                |                                                  */
/*                         |      %do_over(_vs,phrase=%nrstr(          |                                                  */
/*                         |       %_vs(&_i_.)=student_%_vs(&_i_.)     |                                                  */
/*                         |       ));                                 |                                                  */
/*                         |    run;quit;                              |                                                  */
/*                         |                                           |                                                  */
/*                         |   /* clean _VS */                         |                                                  */
/*                         |   %deleteMacArray(_vs,macArray=Y)         |                                                  */
/*                         |   proc print data=work.class;             |                                                  */
/*                         |   run;                                    |                                                  */
/*                         |                                           |                                                  */
/*                         |                                           |                                                  */
/**************************************************************************************************************************/

/*              _
  ___ _ __   __| |
 / _ \ `_ \ / _` |
|  __/ | | | (_| |
 \___|_| |_|\__,_|

*/
v
