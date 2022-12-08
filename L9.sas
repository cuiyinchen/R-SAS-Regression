* One-to-One Merge;
* So-called match merge;
data company;
   input Name $ 1-25 Age 27-28 Gender $ 30;
   datalines;
Vincent, Martina          34 F
Phillipon, Marie-Odile    28 F
Gunter, Thomas            27 M
Harbinger, Nicholas       36 M
Benito, Gisela            32 F
Rudelich, Herbert         39 M
Sirignano, Emily          12 F
Morrison, Michael         32 M
;
run;

* Critical step: sorting;
proc sort data=company;
   by Name;
run;


data finance;
   input IdNumber $ 1-11 Name $ 13-37 Salary;
   datalines;
074-53-9892 Vincent, Martina         35000
776-84-5391 Phillipon, Marie-Odile   29750
929-75-0218 Gunter, Thomas           27500
029-46-9261 Rudelich, Herbert        35000
446-93-2122 Harbinger, Nicholas      33900
228-88-9649 Benito, Gisela           28000
442-21-8075 Sirignano, Emily         5000
;
run;

proc sort data=finance;
   by Name;
run;

* One-to-one merge;
data employee_info1;
   merge company finance;
run;
* Match-merge;
data employee_info2;
   merge company finance;
   by name;
run;


/* homework */

DATA order;
INFILE datalines FIRSTOBS=3;
INPUT
CodeNum $ 1-4
Name $ 6-14
Description $ 16-60;
datalines;
code, type and descriptions of coffee
1234567890123456789012345678901234567890
A206 Mokka Coffee buttercream
A536 Walnoot Walnut halves
B713 Frambozen Raspberry marzipan
C865 Vanille Vanilla-flavored
K014 Kroon Milk chocolate with mint
K086 Koning Hazelnut in chocolate
M315 Pyramide White with dark chocolate
S163 Orbais Chocolate cream
;
Run;

DATA sold;
INFILE datalines FIRSTOBS=2;
INPUT CodeNum $ 1-4 PiecesSold 6-7;
datalines;
1234567890
C865 15
K086 9
A536 21
S163 34
K014 1
A206 12
B713 29
;
Run;

proc sort data=order; by CodeNum; run;
proc sort data=sold; by CodeNum; run;

data sorted; merge order sold; by CodeNum; run;

/* ----------------------------------------------------*/


* Transposition;
* Technique 1;
data A;
	input ID $ 1 Product $ 3-5 Sales 7-8;
datalines;
1 AAA 50
1 BBB 45
2 AAA 52
2 BBB 46
;
run;

proc sort data=A;
	by ID Product;
run;

proc transpose data=A out=trans_A;
	by ID;
	id product;
	var Sales;
run;

* Technique 2;
data T_A;
	set A;
	by ID Product;
	retain AAA BBB .;
	if first.ID then call missing(AAA, BBB);
	if Product = "AAA" then AAA = Sales;
	else if Product = "BBB" then BBB = Sales;
	if last.ID;
	drop Product Sales;
run;



* Table B to A - backward transpose;
data backward;
	set T_A;
	array _varlist (2) AAA BBB;
	array _vallist (2) $3 _temporary_ ("AAA" "BBB");
	do i = 1 to 2;
		Sales = _varlist(i);
		Product = _vallist(i);
		output;
	end;

	drop i AAA BBB;
run;

/* homework of trans*/
data score;
infile datalines;
input major $ StudentID $ DataType $ Score;
datalines;
Finance 1245 GMAT 650
DSMIS 1550 GMAT 675
DSMIS 2020 GMAT 710
Finance 1245 GPA 3.95
Finance 2121 GMAT 600
Finance 2121 GPA 3.5
DSMIS 2020 GPA 4.2
DSMIS 1550 GPA 3.82
;
run;

/* Then turn DataType into columns, i.e. GMAT and GPA will be columns. */
proc sort data=score; by StudentID; run;

proc transpose data=score out=transcore;
by StudentID;
id DataType;
var Score;
run;

/* solution */
proc sort data=score out=score_sorted;
by major StudentID;
run;

proc transpose data=score_sorted out=score_trans;
id DataType;
by major studentID;
var Score;
run;




