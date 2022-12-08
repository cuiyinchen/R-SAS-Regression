* Set statement - from permananent library to temporary library - good programming practice;
data temp;
	set sashelp.heart;
run;

* subsetting using SET options;
data heart;
	set SASHELP.heart (firstobs=10 obs=11);
run;












* Subsetting using WHERE statement;
data example2;
	set sashelp.heart;
	* Select records for male that are alive and very heavy smoker;
	where Status = "Alive" and SEX = "Male" and Smoking_Status = "Very Heavy (> 25)";
	* Can also be done using IF statement;
	if Status = "Alive" and SEX = "Male" and Smoking_Status = "Very Heavy (> 25)";
	* Difference is records are not read into memory from sashelp.heart, as opposed to IF;

	* in operator;
	if Smoking_Status in ("Heavy (16-25)" "Very Heavy (> 25)");
	
	* between operator;
	if 16 <= Smoking <= 25;
	where Smoking between 16 and 25;

run;

* Difference bewtween IF and WHERE;
* schematic data process
raw data (stored in a harddrive)
	|
Where condition
	|
Memory -> data manipulation/calculation/derivation (including IF), etc.
;




data dead;
	set sashelp.heart;
	where Status = "Dead";
run;
data alive;
	set sashelp.heart;
	where Status = "Alive";
run;


* Append or concatenation;
data combine;
	set dead alive;
run;

proc append base=dead data=alive;
run;


