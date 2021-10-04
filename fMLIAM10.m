function NPV = fMLIAM08(ctax,cs)

if ((ctax(1) < 0) | (ctax(2) < 0) | (ctax(3) < 0) | (ctax(4) < 0)),
    NPV = 1000000000000000;
else    

NPV = 0;

for s = 1:3,
climsens = cs(1,s);

load MLIAM
init01
init02
init03
init04
init05
init08

%optrec = reshape(orv,NPol,NReg);

%emred(StartPolicy-StartYear+1,:) = orv; %optrec(1,:);
%for i=2:NPol-1,
%    for j=1:StepPol,
%        emred(StartPolicy-StartYear+j+10*i,:) = orv; %optrec(i,:);
%    end
%end
%for j=1:EndYear-StartPolicy-StepPol*NPol+1,
%    emred(StartPolicy-StartYear+j+10*NPol,:) = orv; %optrec(i,:);
%end

carbontax = ctax(1);

for t=StartYear+1:EndYear,
    i = t - StartYear + 1;
    MRHbox(i,:) = MRH(MRHbox(i-1,:),CO2global(i-1),MRHlife,MRHshare,CO2convert);
    CO2conc(i) = sum(MRHbox(i,:));
    RF(i) = RadForc(CO2conc(i),RF0,CO20);
    [atmtemp(i) oceantemp(i)] = ST(atmtemp(i-1),oceantemp(i-1),RF(i),STpar);
    impact(i,:) = impactcc(atmtemp(i),impactpar,0,1,1);
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
        output(i,:) = max(0.3*population(i,:),CobbDouglas(TFP(i,:),capital(i,:),population(i,:),lambda).*(1-relabcost(i-1,:)+impact(i-1,:)/100));
        outputpc(i,:) = output(i,:)./population(i,:)*1000;
        consumption(i,:) = (1-savings)*output(i,:);
        welfare(i,:) = population(i,:).*log(consumption(i,:));
        impact(i,:) = impactcc(atmtemp(i),impactpar,impelas,outputpc(i,:),outputpc2010);
    end

    if t > 2010,
        energyint(i,:) = AEEI.*energyint(i-1,:);
        emissint(i,:) = ACEI.*emissint(i-1,:);
        energy(i,:) = energyint(i,:).*output(i,:);
        CO2emitbau(i,:) = emissint(i,:).*energy(i,:);
        
        if t == 2050,
            carbontax = ctax(2);   %exercise 1 and 2
            %carbontax = ctax(1+s); %exercise3
        end
        
        emred(i,:) = min(0.99,0.5*0.001*carbontax*CO2emitbau(i,:)./unitabcost./output(i,:));
        
        %permit trade
        %permitprice(i) = 1000*emitalloc(i,:)*CO2emitbau(i,:)'/sum(0.5*CO2emitbau(i,:).^2./unitabcost./output(i,:));
        %emred(i,:) = 0.5*0.001*permitprice(i)*CO2emitbau(i,:)./unitabcost./output(i,:);
        %permittrade(i,:) = (emitalloc(i,:)-emred(i,:)).*CO2emitbau(i,:);
        
        CO2emit(i,:) = CO2emitbau(i,:).*(1-emred(i,:));
        CO2global(i) = CO2global(i-1)*sum(CO2emit(i,:))/sum(CO2emit(i-1,:)) + perturbation(i);
 
        discountrate(i,:) = PRTP + RRA*(consumption(i,:)./consumption(i-1,:)-1);
        globalDR(i) = PRTP + RRA*(sum(consumption(i,:))/sum(consumption(i-1,:))-1);
        carbontax = carbontax*(1+globalDR(i)); 
    end
      
    if t > 2015
        relabcost(i,:) = unitabcost.*emred(i,:).^2 + 0.001*permitprice(i)*permittrade(i,:)./output(i,:);
        totabcost(i,:) = relabcost(i,:).*output(i,:);
        margabcost(i,:) = 2*unitabcost.*emred(i,:).*output(i,:)./CO2emit(i,:)*1000;
    end        
end

NPVs = 0;
for i=1:NReg
    NPVs = NPVs + utilDF'*welfare(:,i);
end

NPV = NPV - cs(2,s)*NPVs;

temp = atmtemp(450)

end

end