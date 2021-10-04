%MLIAM01

clear all
load MLIAM
init01
init02
init03

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
        output(i,:) = CobbDouglas(TFP(i,:),capital(i,:),population(i,:),lambda).*(1-relabcost(i-1,:));
        consumption(i,:) = (1-savings)*output(i,:);
    end

    if t == 2015,
        emred(i,1) = 0.05;
        for j = 2:NReg,
            emred(i,j) = emred(i,1)*unitabcost(1)/unitabcost(j)*output(i-1,1)/output(i-1,j)*CO2emit(i-1,j)/CO2emit(i-1,1);
        end
    end
    
    if t > 2015,
        emred(i,1) = min(0.99,emred(i-1,1)*(1+globalDR(i-1)));
        for j = 2:NReg,
            emred(i,j) = min(0.99,emred(i,1)*unitabcost(1)/unitabcost(j)*output(i-1,1)/output(i-1,j)*CO2emit(i-1,j)/CO2emit(i-1,1));
        end
    end     
    
    if t > 2010,
        energyint(i,:) = AEEI.*energyint(i-1,:);
        emissint(i,:) = ACEI.*emissint(i-1,:);
        energy(i,:) = energyint(i,:).*output(i,:);
        CO2emit(i,:) = emissint(i,:).*energy(i,:).*(1-emred(i,:));
        CO2global(i) = CO2global(i-1)*sum(CO2emit(i,:))/sum(CO2emit(i-1,:));
        
        discountrate(i,:) = PRTP + RRA*(consumption(i,:)./consumption(i-1,:)-1);
        globalDR(i) = PRTP + RRA*(sum(consumption(i,:))/sum(consumption(i-1,:))-1);
    end
      
    if t > 2015    
        relabcost(i,:) = unitabcost.*emred(i,:).^2;
        totabcost(i,:) = relabcost(i,:).*output(i,:);
        margabcost(i,:) = 2*unitabcost.*emred(i,:).*output(i,:)./CO2emit(i,:)*1000;
    end        
end