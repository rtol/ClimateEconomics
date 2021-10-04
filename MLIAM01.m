%MLIAM01

clear all
load MLIAM
init01

for t=StartYear+1:EndYear,
    i = t - StartYear + 1;
    MRHbox(i,:) = MRH(MRHbox(i-1,:),CO2emit(i-1),MRHlife,MRHshare,CO2convert);
    CO2conc(i) = sum(MRHbox(i,:));
    RF(i) = RadForc(CO2conc(i),RF0,CO20);
    [atmtemp(i) oceantemp(i)] = ST(atmtemp(i-1),oceantemp(i-1),RF(i),STpar);
end