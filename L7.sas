* + - * /;
data l6;
	a = 50 + 5.2;
	b = 72.5 * 5 / 2;
	c = 3 * (1 - 4);
	d = 2 ** 3;
	e = 2 + .;
	f = . * 2 + 3 - 3 / 5 + .;
run;













* Read in the data;
data quiz2; 
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


* Numeric function;
* Benefit of using numeric sas function - missing data;
data NumFunctions;
	set quiz2;
	* Use operator to perform math calculation;
	Tot_score1 = exam1 + exam2;
	Avg_score1 = (exam1 + exam2)/2;

	* Calculate the total score per person;
	Tot_score2 = sum(exam1, exam2);
	Avg_score2 = mean(exam1, exam2);
	min2 = min(exam1, exam2);
	max2 = max(exam1, exam2);
run;








* Character functions;
data blanks;
	a = "No";
	b = "blanks";
	c = a || b;
	c = cat(a, b);

	length d $ 9;
	d = "blanks";
	e = d || a;

	f = strip(a);
	g = strip(b);
	h = strip(b) || strip(a);
	i = strip(b) || " " || strip(a);
run;


data example2;
infile datalines dsd firstobs=2 obs=5;
informat name $20. hobby $10.;
input age name $ hobby $;
age_char = put(age, best.);
datalines;
A=Age B=Name C=Hobby
25,joe,hoCkey
32,sArah Yu,Running
18,abigail,painting
47,Elizabeth lafrance,baseball
A=Age B=name C=Hobby
;
run;

data charFunction;
	set example2;
	* Case specific functions;
	Name_up = upcase(NAME);
	Name_low = lowcase(NAME);
	Name_prop = propcase(NAME);
	* Find functions;
	find_pos1 = find(Name, "joe");
	find_pos2 = find(Name, "Yu");

	* case sensitive;
	if find(Name_up, "Joe") > 0 then put "find Joe in Name_up";
	if find(Name_low, "Joe") > 0 then put "find Joe in Name_low";
	if find(Name_prop, "Joe") > 0 then put "find Joe in Name_prop";

	* get a sub string from the parent string;
	* Mention Find() and substr() are frequently coupled to extract info;
	sub_name1 = substr(Name, 2, 3);
	FstNam = scan(Name, 1); 
	SndNam = scan(Name, 2);

	* combine more than 1 functions;
	find_pos3 = find(upcase(Name), "JOE");
run;



data bweight;
	set sashelp.bweight;

	* Determine if Low birth weight;
	length Weight_Status $50;
	if 2500 <= Weight <= 4200 then Weight_Status = "Low Birth Weight";
	else if 1000 <= Weight <= 2499 then Weight_Status = "Very Low Birth Weight";
	else if . < Weight < 1000 then Weight_Status = "Extremely Low Birth Weight";
	* Acronym for Weight_status;
	length WS_code $50;
	if 2500 <= Weight <= 4200 then WS_code = "LBW";
	else if 1000 <= Weight <= 2499 then WS_code = "VLBW";
	else if . < Weight < 1000 then WS_code = "ELBW";

	* using a do loop;
	length Weight_Status WS_code $50;
	if 2500 <= Weight <= 4200 then do;
		Weight_Status = "Low Birth Weight";
		WS_code = "LBW";
	end;
	else if 1000 <= Weight <= 2499 then do;
		Weight_Status = "Very Low Birth Weight";		
		WS_code = "VLBW";
	end;
	else if . < Weight < 1000 then do;
		Weight_Status = "Extremely Low Birth Weight";
		WS_code = "ELBW";
	end;


* Do loop;
	* with a counter variable;
	sum1_100 = 0;
	do counter = 1 to 100;
		sum1_100 = sum1_100 + counter;
	end;
	* Iteration
		sum1_100	counter		sum1_100
Loop 1: 0         + 1		=	1
Loop 2: 1         + 2       = 	3
Loop 3: 3 		  + 3		=   6
	...;

	* Can be replaced by any names, e.g. i;
	do i = 1 to 100;
	end;
run;



