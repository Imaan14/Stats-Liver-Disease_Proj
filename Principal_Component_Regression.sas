/* Assigning Library to Dataset */ 
libname mydata '/home/My folders/Group Assignment/'; 

/* Deriving principal components from dataset using first school of thought*/
ODS GRAPHICS ON; 
proc princomp data=mydata.group_1_train 
out=alcohol_blood_test prefix=z outstat=test1 plots=all; 
var mcv alkphos sgpt sgot gammagt; 
run; 
ODS GRAPHICS OFF; 

/* Deriving principal components from dataset using parallel analysis */ 
proc factor data=mydata.group_1_train 	
method=principal parallel(nsims=1000 seed=1234); 	
var mcv alkphos sgpt sgot gammagt; 
run; 

/* Running regression model with principal components */ 
proc reg data=alcohol_blood_test; 
model drinks = z1 z2 z3/VIF; 
title 'Principal Component Regression with drinks as response'; 
run;
