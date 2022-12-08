* Example one - SGPLOT;
proc sgplot data=sashelp.heart;
  scatter x=height y=weight / group=sex;
run;

proc sgplot data=sashelp.stocks
  (where=(date >= "01jan2000"d and stock = "IBM"));
  title "Stock Trend";
  series x=date y=close;
  series x=date y=low;
  series x=date y=high;
run;


* Example two - SGPANEL;
proc sgpanel data=sashelp.heart noautolegend;
  title "Cholesterol Distribution in Heart Study";
  panelby sex;
  histogram cholesterol;
  density cholesterol;
run;

* Example three - SGSCATTER;
proc sgscatter data=sashelp.iris;
  title "Scatterplot Matrix for Iris Data";
  matrix sepallength petallength sepalwidth petalwidth
         / group=species;
run;

ods graphics on;
title 'Fisher (1936) Iris Setosa Data';
proc corr data=sashelp.iris plots=matrix(histogram);
*by species; 
run;
ods graphics off;


* Example four - SGRENDER;
proc template;
define statgraph sgdesign;
dynamic _HEIGHT _WEIGHT _SEX;
begingraph / attrpriority=Color;
   *entrytitle halign=center 'Type in your title...';
   *entryfootnote halign=left 'Type in your footnote...';
   layout lattice / rowdatarange=data columndatarange=data rowgutter=10 columngutter=10;
      layout overlay;
         scatterplot x=_HEIGHT y=_WEIGHT / group=_SEX name='scatter' markerattrs=(symbol=CIRCLE );
      endlayout;
      sidebar / align=bottom spacefill=false;
         discretelegend 'scatter' / opaque=true border=true halign=center valign=center title='Sex' displayclipped=true order=rowmajor;
      endsidebar;
   endlayout;
endgraph;
end;
run;

proc sgrender data=SASHELP.CLASS template=sgdesign;
dynamic _HEIGHT="HEIGHT" _WEIGHT="WEIGHT" _SEX="SEX";
run;

proc sgplot data=sashelp.class;
  scatter x=height y=weight / group=sex;
run;
