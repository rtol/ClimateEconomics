%MLIAM01

clear all
load MLIAM
init01
init02

for t=StartYear+1:EndYear,
    i = t - StartYear + 1;
    MRHbox(i,:) = MRH(MRHbox(i-1,:),CO2global(i-1),MRHlife,MRHshare,CO2convert);
    CO2conc(i) = sum(MRHbox(i,:));
    RF(i) = RadForc(CO2conc(i),RF0,CO20);
    [atmtemp(i) oceantemp(i)] = ST(atmtemp(i-1),oceantemp(i-1),RF(i),STpar);
    if t > 2010,
        population(i,:) = population(i-1,:).*(1+popgrowth);
        popgrowth= popdecline*popgrowth;
        TFPgrowth= TFPdecline*TFPgrowth;
    end
    if t > 1960,
        capital(i,:) = invest(capital(i-1,:),output(i-1,:),savings,depreciation);
        TFP(i,:) = TFP(i-1,:).*(1+TFPgrowth);
    end
    if t >= 1960,
        output(i,:) = CobbDouglas(TFP(i,:),capital(i,:),population(i,:),lambda);
    end
    if t > 2010,
        energyint(i,:) = AEEI.*energyint(i-1,:);
        emissint(i,:) = ACEI.*emissint(i-1,:);
        energy(i,:) = energyint(i,:).*output(i,:);
        CO2emit(i,:) = emissint(i,:).*energy(i,:);
        CO2global(i) = CO2global(i-1)*sum(CO2emit(i,:))/sum(CO2emit(i-1,:));
    end
end