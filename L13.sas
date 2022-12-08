* Recap - Proc means;
proc means data=sashelp.heart;
var systolic;
run;

* One sample TTest with proc means;
* Option t for t statistics;
* option probt for pvalue;
proc means data=sashelp.heart t probt;
var systolic;
run;

* what is the null hypothesis above? what about the alternative hypothesis? and what does the p value suggests?;


* One sample TTest with proc univariate;
proc univariate data=sashelp.heart;
var systolic;
run;

proc univariate data=sashelp.heart mu0=136.8;
var systolic;
run;

* what is the null hypothesis above? what about the alternative hypothesis? and what does the p value suggests?;


* One sample TTest with Proc TTEST;
proc TTEST data=sashelp.heart;
var systolic;
run;

proc TTEST data=sashelp.heart h0=136.8;
var systolic;
run;

* Two sample TTest with Proc TTEST;
proc TTEST data=sashelp.heart;
class sex;
var systolic;
run;

* variance is a measure of how spread out a data set is;
* what is the null hypothesis above? what about the alternative hypothesis? and what does the p value suggests?;


* paired ttest;
Proc ttest data=sashelp.heart;
Paired systolic * diastolic;
Run;



* ANOVA;
proc anova data=sashelp.heart;
	class bp_status;
	Model weight=bp_status;
run;
quit;



** Smoking status;
proc anova data=sashelp.heart;
	class smoking_status;
	Model weight=smoking_status;
	means smoking_status/ duncan tukey bon scheffe;
run;
quit;


* Non-parametric;
* One-sample;
proc univariate data=sashelp.heart mu0=130;
	var systolic;
run;

* Two-Sample;
proc npar1way data=sashelp.heart;
	class sex;
	var systolic;
run;

* 3-sample;
proc npar1way data=sashelp.heart;
	class bp_status;
	var weight;
run;
