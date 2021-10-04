%output parameters

capital = zeros(NYear,NReg);
TFP = zeros(NYear,NReg);
output = zeros(NYear,NReg);
outputpc = zeros(NYear,NReg);
TFPgrowth = [0.0206 0.0260 0.0236];
TFPdecline = 0.99;
outputpc2010 = [33498	3170	954];

lambda  = 0.2;
savings = 0.2;
depreciation  = 0.1;

A0 = outputobs(1960-StartYear+1,:)./population(1960-StartYear+1,:);
A0 = A0.^(1-lambda);
A0 = A0*(depreciation/savings)^lambda;
K0 = A0.^(1/(1-lambda));
K0 = K0.*population(1960-StartYear+1,:);
K0 = (savings/depreciation)^(1/(1-lambda))*K0;

capital(1960-StartYear+1,:) = K0;
TFP(1960-StartYear+1,:) = A0;