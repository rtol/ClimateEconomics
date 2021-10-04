%MRHparam

MRHlife(1) = 0;
MRHlife(2) = 1-exp(-1/363);
MRHlife(3) = 1-exp(-1/74);
MRHlife(4) = 1-exp(-1/17);
MRHlife(5) = 1-exp(-1/2);

MRH1750(1) = 275;
MRH1750(2) = 0;
MRH1750(3) = 0;
MRH1750(4) = 0;
MRH1750(5) = 0;

MRHshare(1) = 0.13;
MRHshare(2) = 0.20;
MRHshare(3) = 0.32;
MRHshare(4) = 0.25;
MRHshare(5) = 0.10;

CO2convert = 1/2.13/1000;

MRHbox = zeros(NYear,5); %five boxes
MRHbox(1,:) = MRH1750;
CO2conc = zeros(NYear,1);
CO20 = sum(MRH1750);
CO2conc(1) = CO20;
