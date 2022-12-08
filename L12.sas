* Proc print;
proc print data=sashelp.bweight;
run;

proc print data=sashelp.bweight (firstobs=5 obs=10) label noobs ;
var weight;
run;



* Proc contents;
proc contents data=sashelp.class;
run;








* For numeric variables;
* Proc means;
proc means data=sashelp.heart sum range skew kurt;
*by Sex;
class Sex;
var Height;
output out=means;
run;














* proc univariate;
proc univariate data=sashelp.heart;
var ageatstart;
run;
proc univariate data=sashelp.heart nextrobs=20;
var ageatstart;
run;

proc univariate data=sashelp.heart plots;
var ageatstart;
histogram ageatstart / normal;
run;




* For categorical variables;
* proc freq;
proc freq data=sashelp.heart;
tables status Sex;
run;

proc freq data=sashelp.heart;
tables status * Sex;
run;

proc freq data=sashelp.heart;
tables status * Sex / out=crosstab;
run;
