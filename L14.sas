* Sample size affects the p-value;
data eg1;
	input grp $ measure;
datalines;
1 20
1 22
1 24
2 20
2 21
2 22
;
run;

data eg2;
	input grp $ measure;
datalines;
1 20
1 22
1 24
2 20
2 21
2 22
1 20
1 22
1 24
2 20
2 21
2 22
1 20
1 22
1 24
2 20
2 21
2 22
1 20
1 22
1 24
2 20
2 21
2 22
1 20
1 22
1 24
2 20
2 21
2 22
1 20
1 22
1 24
2 20
2 21
2 22
;
run;


proc ttest data=eg1;
class grp;
var measure;
run;
proc ttest data=eg2;
class grp;
var measure;
run;


* Linear regression model example;
proc reg data=sashelp.heart;
	model cholesterol = systolic;
run;
quit;

* cholesterol = 175.8 + 0.37 * 170 = 238.7;


* Multiple linear regression results;
proc reg data=sashelp.heart;
	model cholesterol = systolic AgeAtStart;
run;
quit;

* cholesterol = 175.8 + 0.37 × systolic;
* cholesterol = 145.2 + 0.21 × systolic + 1.21 x AgeAtStart;
* 2nd record: systolic 144, age at start 41;
* cholesterol = 175.8 +0.37*144 = 229.08;
* cholesterol = 145.2 + 0.21 * 144 + 1.21*41 = 225.05;
* 3rd record: systolic 170, age at start 57;
* cholesterol = 175.8+.37*170=238.7;
* cholesterol = 145.2+.21*170+1.21*57=250;








* Categorical variables into the model;
proc reg data=sashelp.heart;
	*class sex weight_status;
	model cholesterol = systolic sex weight_status;
run;

* Dummy for sex;
data week9;
	set sashelp.heart;
	if sex='Male' then male=1;
	else if sex='Female' then male=0; 
run;

proc reg data=week9;
	model cholesterol=male; 
run;
quit;

* Cholesterol = 228.54182 - 2.49057 * male;
* Cholesterol = 228.54182 - 2.49057 * 1 = 226;* <- mean for male group;
* Cholesterol = 228.54182 - 2.49057 * 0 = 228.5;* <- mean for female group;







* Dummy for weight_status;
proc freq data=sashelp.heart;
tables weight_status;
run;

data week9;
	set sashelp.heart;
	if sex='Male' then male=1;
	else if sex='Female' then male=0;

	if weight_status = "Underweight" then do;
		Underweight = 1;
		Normal = 0;
	end;
	else if weight_status = "Normal" then do;
		Underweight = 0;
		Normal = 1;
	end;
	else if weight_status = "Overweight" then do;
		Underweight = 0;
		Normal = 0;
	end;
run;

proc reg data=week9;
	model cholesterol = systolic male underweight normal;
run;
quit;

* cholesterol = 187.9 + 0.324 * systolic  3.09 * male  20.3 * underweight  9.8 * normal;
* female with 112 systolic and overweight;
* cholesterol = 187.9 + 0.324 * 112 - 3.09 * 0 - 20.3 * 0 - 9.8* 0 = 224.188;
