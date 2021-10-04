%MLIAM10

clear all

ctax0 = [0 0 0 0];

cs = [3.0 3.0 3.0; 0.25 0.50 0.25]; %exercise 1
%cs = [1.5 3.0 4.5; 0.25 0.50 0.25]; %exercises 2 and 3

NPV0 = -fMLIAM10(ctax0,cs);

options  =  optimset('MaxFunEvals',1000,'MaxIter',1000); 
ctax1 = fminsearch(@(ctax) fMLIAM10(ctax,cs), ctax0, options);

NPV1 = -fMLIAM10(ctax1,cs);
