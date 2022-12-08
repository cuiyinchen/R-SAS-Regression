/* Note: upload the asia.csv into the folder, and clicked import data, copy the code */

FILENAME REFFILE '/home/u62769377/sasuser.v94/asia.csv';

PROC IMPORT DATAFILE=REFFILE
	DBMS=CSV
	OUT=WORK.IMPORT;
	GETNAMES=YES;
RUN;

PROC CONTENTS DATA=WORK.IMPORT; RUN;


%web_open_table(WORK.IMPORT);

proc print data=work.import;
run;

data new_asia;
set work.import;
run;

proc means data=new_asia;
where Make="Honda";
var MSRP;
run;