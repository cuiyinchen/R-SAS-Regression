* In-stream data;
data example1;
	infile datalines dsd firstobs=2 obs=5;
	informat name $20. hobby $10.;
	input age name $ hobby $;
datalines;
A=Age B=Name C=Hobby
25,joe,hoCkey
32,sArah Yu,Running
18,abigail,painting
47,Elizabeth Lafrance,baseball
A=Age B=name C=Hobby
;
run;








* external file;
* using proc import;
proc import out=example3 datafile="G:\Project Jstarts\Courses\Statistical Data Analysis with SAS\data\L4.txt" replace /*dbms=excel*/;
DELIMITER=",";
getnames=yes;
run;






* To read in data from an existing dataset, use SET statement;
data lecture4;
	set sashelp.heart;
run;

* Create permanent dataset;
* Specify the physical location to store the dataset, quoted between the double quotation marks;
* The dataset file is stored in the extention of sas7bdat;
data "G:\Project Jstarts\Courses\Statistical Data Analysis with SAS\data\test";
	set sashelp.humid;
run;
