proc reg data=mydata.group_1_train;
   model drinks = MCV alkphos sgpt sgot gammagt / vif tol collin;
run;
