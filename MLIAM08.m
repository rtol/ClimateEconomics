%MLIAM08

clear all

ctax0 = 0;
NPV0 = -fMLIAM08(ctax0);

options  =  optimset('MaxFunEvals',1000,'MaxIter',1000); 
ctax1 = fminsearch(@(ctax) fMLIAM08(ctax), ctax0, options);

NPV1 = -fMLIAM08(ctax1);
