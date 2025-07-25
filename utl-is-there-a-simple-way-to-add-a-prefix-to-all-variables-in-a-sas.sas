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




















































%array(_vs,values=%utl_varlist(class));

proc datasets lib=work nolist;
modify class ;
 rename
  %do_over(_vs,phrase=?=student_?);
run;quit;

 STUDENT_    STUDENT_    STUDENT_
   NAME        SEX          AGE

 Alfred         M           14
 Alice          F           13
 Barbara        F           13
 Carol          F           14
 Henry          M           14
 James          M           12














%let pgm=utl-insert-an-observation-in-dataset-above-a-specified-observation-sas-sql-sas-and-r;

%stop_submission;

Insert an observation in dataset above a specified observation sas sql sas and r

   SOLUTIONS

      Without a primary key (have to create it)
          1 sas point option
          2 sas stacked tables
          3 sas sql union
      Using builtin sqlite rowid (simples solution with sql?)
          4 r sql union
            (can be run with excel python matlab spss postgresql powershell)

PROBLEM INSER C BETWEEN B AND D

INPUT  OUTPUT

  A      A
  B      B
  D      C <=add C
  E      D
  F      E

github
https://tinyurl.com/3sjtruvy
https://github.com/rogerjdeangelis/utl-insert-an-observation-in-dataset-above-a-specified-observation-sas-sql-sas-and-r

communities.sas
https://tinyurl.com/2ps889az
https://communities.sas.com/t5/SAS-Programming/Insert-an-observation-in-dataset-above-a-specified-observation/m-p/759291#M239924

SOAPBOX ON

  Could not get the posted solution to work.

  Some relational databases, like sqlite, auto-generate unique row ids. Many of the problems
  i see in the listserves can more easily be solve when rows have a unique key.

  This is one of them.

  Take care when using the sas monotonic function especially with views and subqueries,
  because the sas optimizer may scramble your query when the monofunction function is executed. Should be safe
  with simple select monotonic() as rowid, * from table, which how i use it  w
  I use it in my sqlpartitionx macro.
  (select *, &minus*monotonic() as seq from &dsn) /*---- minus for decreasing sequence ----*/

  Sqlite does not support union corr, use just union

SOAPBOX OFF

/**************************************************************************************************************************/
/*  INPUT         | PROCESS                                                             |  OUTPUT                         */
/*  =====         | =======                                                             |  ======                         */
/*                |                                                                     |                                 */
/*  LTR           | 1 SAS POINT OPTION                                                  |  LTR                            */
/*                | ==================                                                  |   A                             */
/*   A            |                                                                     |   A                             */
/*   B            | data want;                                                          |   B                             */
/*   D            |   do pnt=1 to obs;                                                  |   C <= added                    */
/*   E            |     set class nobs=obs ;                                            |   D                             */
/*   F            |     if ltr='D' then do;                                             |   E                             */
/*                |        ltr='C';                                                     |   F                             */
/*  options       |        output;                                                      |                                 */
/*  validvarname  |        set class point=pnt;                                         |                                 */
/*     =upcase;   |        output;                                                      |                                 */
/*  libname sd1   |     end;                                                            |                                 */
/*      "d:/sd1"; |     else output;                                                    |                                 */
/*  data sd1.have;|   end;                                                              |                                 */
/*    input ltr$; | stop;                                                               |                                 */
/*  cards4;       | run;quit;                                                           |                                 */
/*  A             |                                                                     |                                 */
/*  B             |-------------------------------------------------------------------------------------------------------*/
/*  D             | 2 SAS STACKED TABLES                                                | OUTPUT                          */
/*  E             | ====================                                                |                                 */
/*  F             | proc sql;                                                           |  LTR                            */
/*  ;;;;          |   *---- add rowid                    ----*;                         |                                 */
/*  run;quit;     |   create                                                            |   A                             */
/*                |     table addkey as                                                 |   B                             */
/*                |   select monotonic() as rowid ,ltr                                  |   C <= added                    */
/*                |   from sd1.have;                                                    |   D                             */
/*                |                                                                     |   E                             */
/*                |   *---- get position of the D letter ----*;                         |   F                             */
/*                |   select rowid into :pos from addkey where ltr="D"                  |                                 */
/*                | ;quit;                                                              |                                 */
/*                |                                                                     |                                 */
/*                | data want;                                                          |                                 */
/*                |                                                                     |                                 */
/*                |    set addkey(where=(rowid<= &pos))                                 |                                 */
/*                |        addkey(where=(rowid>  &pos));                                |                                 */
/*                |                                                                     |                                 */
/*                |    if rowid =&_bfr then do;                                         |                                 */
/*                |       output;                                                       |                                 */
/*                |       ltr="C";output;                                               |                                 */
/*                |    end;                                                             |                                 */
/*                |    else output;                                                     |                                 */
/*                |    drop rowid;                                                      |                                 */
/*                | ;run;quit;                                                          |                                 */
/*                |                                                                     |                                 */
/*                |-------------------------------------------------------------------------------------------------------*/
/*                | 3 SAS SQL UNION                                                     |  OUTPUT                         */
/*                | ================                                                    |                                 */
/*                |                                                                     |  LTR                            */
/*                | proc sql;                                                           |                                 */
/*                |   *--- cannot use a view because optimizer                          |   A                             */
/*                |    van resuctures queries with monotonic()                          |   B                             */
/*                |  ----*;                                                             |   C <= added                    */
/*                |                                                                     |   D                             */
/*                |  create                                                             |   E                             */
/*                |    table addkey as                                                  |   F                             */
/*                |  select monotonic() as rowid,ltr from sd1.have;                     |                                 */
/*                |                                                                     |                                 */
/*                |  create                                                             |                                 */
/*                |    table want as                                                    |                                 */
/*                |                                                                     |                                 */
/*                |  select ltr from addkey                                             |                                 */
/*                |  where                                                              |                                 */
/*                |    rowid<(select rowid from addkey where ltr="D")                   |                                 */
/*                |                                                                     |                                 */
/*                |  union                                                              |                                 */
/*                |  select 'C' as ltr from addkey where rowid = 1                      |                                 */
/*                |                                                                     |                                 */
/*                |  union                                                              |                                 */
/*                |  select ltr from addkey                                             |                                 */
/*                |  where                                                              |                                 */
/*                |    rowid>=(select rowid from sd1.have where ltr="D")                |                                 */
/*                |                                                                     |                                 */
/*                | ;quit;                                                              |                                 */
/*                |                                                                     |                                 */
/*                |-------------------------------------------------------------------------------------------------------*/
/*                | 4 R SQL UNION                                                       |  R                              */
/*                | =============                                                       |    LTR                          */
/*                |                                                                     |  1   A                          */
/*                | proc datasets lib=sd1 nolist nodetails;                             |  2   B                          */
/*                |  delete want;                                                       |  3   D                          */
/*                | run;quit;                                                           |  4   D                          */
/*                |                                                                     |  5   E                          */
/*                | %utl_rbeginx;                                                       |  6   F                          */
/*                | parmcards4;                                                         |                                 */
/*                | library(haven)                                                      |                                 */
/*                | library(sqldf)                                                      |  SAS                            */
/*                | source("c:/oto/fn_tosas9x.R")                                       |                                 */
/*                | options(sqldf.dll = "d:/dll/sqlean.dll")                            |  LTR                            */
/*                | have<-read_sas("d:/sd1/have.sas7bdat")                              |                                 */
/*                | print(have)                                                         |   A                             */
/*                | want<-sqldf('                                                       |   B                             */
/*                |                                                                     |   C <= added                    */
/*                | with                                                                |   D                             */
/*                |  addkey as (                                                        |   E                             */
/*                |   select rowid from have where ltr="D")                             |   F                             */
/*                |                                                                     |                                 */
/*                | select ltr from have where rowid<(select rowid from addkey)         |                                 */
/*                | union                                                               |                                 */
/*                | select "D" from have where rowid = 1                                |                                 */
/*                | union                                                               |                                 */
/*                | select ltr from have where rowid >=(select rowid from addkey)       |                                 */
/*                | ;                                                                   |                                 */
/*                | ');                                                                 |                                 */
/*                | want;                                                               |                                 */
/*                | fn_tosas9x(                                                         |                                 */
/*                |       inp    = want                                                 |                                 */
/*                |      ,outlib ="d:/sd1/"                                             |                                 */
/*                |      ,outdsn ="want"                                                |                                 */
/*                |      )                                                              |                                 */
/*                | ;;;;                                                                |                                 */
/*                | %utl_rendx;                                                         |                                 */
/*                |                                                                     |                                 */
/*                | proc print data=sd1.want;                                           |                                 */
/*                | run;quit;                                                           |                                 */
/**************************************************************************************************************************/

/*                   _
(_)_ __  _ __  _   _| |_
| | `_ \| `_ \| | | | __|
| | | | | |_) | |_| | |_
|_|_| |_| .__/ \__,_|\__|
        |_|
*/

options
validvarname
   =upcase;
libname sd1
    "d:/sd1";
data sd1.have;
  input ltr$;
cards4;
A
B
D
E
F
;;;;
run;quit;

/**************************************************************************************************************************/
/* LTR                                                                                                                    */
/*                                                                                                                        */
/*  A                                                                                                                     */
/*  B                                                                                                                     */
/*  D                                                                                                                     */
/*  E                                                                                                                     */
/*  F                                                                                                                     */
/**************************************************************************************************************************/
/*                               _       _
/ |  ___  __ _ ___   _ __   ___ (_)_ __ | |_
| | / __|/ _` / __| | `_ \ / _ \| | `_ \| __|
| | \__ \ (_| \__ \ | |_) | (_) | | | | | |_
|_| |___/\__,_|___/ | .__/ \___/|_|_| |_|\__|
                    |_|
1 SAS POINT OPTION
==================
*/

data want;
  do pnt=1 to obs;
    set class nobs=obs ;
    if ltr='D' then do;
       ltr='C';
       output;
       set class point=pnt;
       output;
    end;
    else output;
  end;
stop;
run;quit;

/**************************************************************************************************************************/
/*  LTR                                                                                                                   */
/*   A                                                                                                                    */
/*   A                                                                                                                    */
/*   B                                                                                                                    */
/*   C <= added                                                                                                           */
/*   D                                                                                                                    */
/*   E                                                                                                                    */
/*   F                                                                                                                    */
/**************************************************************************************************************************/
/*___                        _             _      _        _     _
|___ \   ___  __ _ ___   ___| |_ __ _  ___| | __ | |_ __ _| |__ | | ___  ___
  __) | / __|/ _` / __| / __| __/ _` |/ __| |/ / | __/ _` | `_ \| |/ _ \/ __|
 / __/  \__ \ (_| \__ \ \__ \ || (_| | (__|   <  | || (_| | |_) | |  __/\__ \
|_____| |___/\__,_|___/ |___/\__\__,_|\___|_|\_\  \__\__,_|_.__/|_|\___||___/

2 SAS STACKED TABLES
====================
*/

proc sql;
  *---- add rowid                    ----*;
  create
    table addkey as
  select monotonic() as rowid ,ltr
  from sd1.have;

  *---- get position of the D letter ----*;
  select rowid into :pos from addkey where ltr="D"
;quit;

data want;

   set addkey(where=(rowid<= &pos))
       addkey(where=(rowid>  &pos));

   if rowid =&_bfr then do;
      output;
      ltr="C";output;
   end;
   else output;
   drop rowid;
;run;quit;

/**************************************************************************************************************************/
/*  LTR                                                                                                                   */
/*   A                                                                                                                    */
/*   A                                                                                                                    */
/*   B                                                                                                                    */
/*   C <= added                                                                                                           */
/*   D                                                                                                                    */
/*   E                                                                                                                    */
/*   F                                                                                                                    */
/**************************************************************************************************************************/

/*____                             _               _
|___ /   ___  __ _ ___   ___  __ _| |  _   _ _ __ (_) ___  _ __
  |_ \  / __|/ _` / __| / __|/ _` | | | | | | `_ \| |/ _ \| `_ \
 ___) | \__ \ (_| \__ \ \__ \ (_| | | | |_| | | | | | (_) | | | |
|____/  |___/\__,_|___/ |___/\__, |_|  \__,_|_| |_|_|\___/|_| |_|
                                |_|
3 SAS SQL UNION
================
*/

proc datasets lib=work nolist nodetails;
 delete want;
run;quit;

proc sql;

/**************************************************************************************************************************/
/*  LTR                                                                                                                   */
/*   A                                                                                                                    */
/*   A                                                                                                                    */
/*   B                                                                                                                    */
/*   C <= added                                                                                                           */
/*   D                                                                                                                    */
/*   E                                                                                                                    */
/*   F                                                                                                                    */
/**************************************************************************************************************************/
/*  _                      _               _
| || |    _ __   ___  __ _| |  _   _ _ __ (_) ___  _ __
| || |_  | `__| / __|/ _` | | | | | | `_ \| |/ _ \| `_ \
|__   _| | |    \__ \ (_| | | | |_| | | | | | (_) | | | |
   |_|   |_|    |___/\__, |_|  \__,_|_| |_|_|\___/|_| |_|
                        |_|
4 R SQL UNION
=============
*/

proc datasets lib=sd1 nolist nodetails;
 delete want;
run;quit;

%utl_rbeginx;
parmcards4;
library(haven)
library(sqldf)
source("c:/oto/fn_tosas9x.R")
options(sqldf.dll = "d:/dll/sqlean.dll")
have<-read_sas("d:/sd1/have.sas7bdat")
print(have)
want<-sqldf('

with
 addkey as (
  select rowid from have where ltr="D")

select ltr from have where rowid<(select rowid from addkey)
union
select "D" from have where rowid = 1
union
select ltr from have where rowid >=(select rowid from addkey)
;
');
want;
fn_tosas9x(
      inp    = want
     ,outlib ="d:/sd1/"
     ,outdsn ="want"
     )
;;;;
%utl_rendx;

proc print data=sd1.want;
run;quit;
/*
/**************************************************************************************************************************/
/* R      |  SAS                                                                                                          */
/*  LTR   |  LTR                                                                                                          */
/*   A    |   A                                                                                                           */
/*   A    |   A                                                                                                           */
/*   B    |   B                                                                                                           */
/*   C    |   C <= added                                                                                                  */
/*   D    |   D                                                                                                           */
/*   E    |   E                                                                                                           */
/*   F    |   F                                                                                                           */
/**************************************************************************************************************************/
/*              _
  ___ _ __   __| |
 / _ \ `_ \ / _` |
|  __/ | | | (_| |
 \___|_| |_|\__,_|

*/
