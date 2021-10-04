%initialize

unitabcost = [0.1 0.1 0.1];
emred = zeros(NYear,NReg);
relabcost = zeros(NYear,NReg);
totabcost = zeros(NYear,NReg);
margabcost = zeros(NYear,NReg);

PRTP = 0.03;
RRA = 1;

discountrate = zeros(NYear,NReg);
globalDR = zeros(NYear,1);