%MLIAM08

clear all

ctax0 = 0;
citer0 = [0 0 0];

NPV0 = -fMLIAM12(0.0, citer0, 1);

options  =  optimset('MaxFunEvals',1000,'MaxIter',1000); 

ctax1 = fminsearch(@(ctax) fMLIAM11(ctax,citer0,1), ctax0, options);
ctax2 = fminsearch(@(ctax) fMLIAM11(ctax,citer0,2), ctax0, options);
ctax3 = fminsearch(@(ctax) fMLIAM11(ctax,citer0,3), ctax0, options);

citer1(1) = ctax1;
citer1(2) = ctax2;
citer1(3) = ctax3;

ctax1 = fminsearch(@(ctax) fMLIAM11(ctax,citer1,1), ctax0, options);
ctax2 = fminsearch(@(ctax) fMLIAM11(ctax,citer1,2), ctax0, options);
ctax3 = fminsearch(@(ctax) fMLIAM11(ctax,citer1,3), ctax0, options);

citer2(1) = ctax1;
citer2(2) = ctax2;
citer2(3) = ctax3;

ctax1 = fminsearch(@(ctax) fMLIAM11(ctax,citer2,1), ctax0, options);
ctax2 = fminsearch(@(ctax) fMLIAM11(ctax,citer2,2), ctax0, options);
ctax3 = fminsearch(@(ctax) fMLIAM11(ctax,citer2,3), ctax0, options);

citer3(1) = ctax1;
citer3(2) = ctax2;
citer3(3) = ctax3;
