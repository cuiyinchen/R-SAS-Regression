* Library name, dataset name, variable name;
data demo0; * two level names, but temp dataset is created when library name is not specified;
	set sashelp.heart;
run;


















data demo1;
	* Numeric variable - has length but does not need to change;
	NumVar1 = 10000;
	NumVar2 = 0.55;
	NumVar3 = exp(5 + sqrt(10));
	NumVar4 = .;
	* Character variable;
	* Quoted between quotation marks;
	* Number can be character strings, be cautious;
	* length is very important;
	* Values are case sensitive;
	length CharVar1 $ 4 CharVar2 $ 20 CHARVAR4 $ 20;
	*CharVar1 = "John";
	*CharVar2 = "0.55";
	CharVar1 = "Adam Smith";
	CharVar3 = " ";
	CHARVAR4 = "ABCD";
	charvar4 = "ADAM SMITH";
run;





data demo2;
	set sashelp.heart;
	
	* Creating new variables;
	IF AgeAtStart >= 60 THEN senior=1; 
	IF AgeAtStart <  60 THEN senior=0;
	* Modifying existing variables;
	IF DeathCause="other" THEN DeathCause="Other";
	* Categorize values;
	length Smoking_Status $ 20;
	if Smoking = 0 then Smoking_Status = "Non-smoker";
	if 1 <= Smoking <= 5 then Smoking_Status = "Light (1-5)";
	if 6 <= Smoking <= 15 then Smoking_Status = "Moderate (6-15)";
	if 16 <= Smoking <= 25 then Smoking_Status = "Heavy (16-25)";
	if Smoking > 25 then Smoking_Status = "Very Heavy (> 25)";

	* Parallel IF statements - every statement will be executed;
	* ELSE statement;
	IF AgeAtStart >= 60 THEN senior=1; 
	ELSE IF AgeAtStart <  61 THEN senior=0;

run;




* Keep and drop variables;
data demo3 /*(keep=SEX STATUS drop=AgeAtStart)*/;
	set demo2 /*(keep=SEX STATUS drop=AgeAtStart)*/;
	keep Sex Status;
	drop AgeAtStart;
run;
