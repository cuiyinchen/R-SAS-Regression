data quiz11; 
 input subject gender $ exam1 exam2 grade $;
datalines;
10 M 90   84 A
7  M  .   89 A
4  F 80   86 B
20 M 82    . B
25 F 94   94 A
14 F 68   84 C
;
run;

proc ttest data=quiz11;
paired exam1 * exam2;
run;

/* Are exam 2 scores significantly different from exam 1 scores? solution:
proc ttest data=quiz11; paired exam1 * exam2; run; */

/* Linear Regression Example*/
Proc reg data = sashelp.heart;
Model cholesterol = systolic;
Run; quit; 


/* Multiple Regression Example */
Proc reg data = sashelp.heart;
Model cholesterol = systolic AgeatStart;
Run; quit; 

data heart; set sashelp.heart; run;

/* dummy sex */
Data week9; set sashelp.heart; 
if sex='Male' then male=1; else if sex='Female' then male =0;
run;

proc reg data=week9; model cholesterol=male; run; quit;

/* proc freq data=sashelp.heart; tables weight_status; run; */

/* adding categorical variable */
Proc reg data=heart; /*weight_status has 3 levels*/
Model cholesterol = systolic male; /*sex and weight_status are categorical*/
Run;

/* %sgdesign; */