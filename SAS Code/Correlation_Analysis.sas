proc corr data=mydata.group_1_train plots (only) = scatter;
	var MCV alkphos sgpt sgot gammagt;
	with drinks;
run;

proc corr data=mydata.group_1_train;
   var MCV alkphos sgpt sgot gammagt drinks;
run;
