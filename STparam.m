%STparam

atmtemp0 = 0;
oceantemp0 = 0;

atmtemp = zeros(NYear,1);
oceantemp = zeros(NYear,1);

atmtemp(1) = atmtemp0;
oceantemp(1) = oceantemp0;

STpar(1) = climsens/RF0/log(2);
STpar(2) = 0.0256;
STpar(3) = 0.00738;
STpar(4) = 0.00568;