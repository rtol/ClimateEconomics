%MLIAM06

clear all
load MLIAM
perturb = zeros(551,1); %note the fragility
MLIAM05
output0 = output;
CO2conc0 = CO2conc;
atmtemp1 = atmtemp;
impact0 = impact;
dr0 = discountrate;
perturb(266) = 1;
MLIAM05

discountfactor = zeros(NYear,NReg);
for i=1:NReg,
    discountfactor(266,i) = 1;
end
for i=267:NYear,
    discountfactor(i,:) = discountfactor(i-1,:)./(1+dr0(i-1,:));
end

addrelimp = impact0 - impact;
addabsimp = addrelimp.*output/100;
SCC= discountfactor.*addabsimp;
SCC = 1000*sum(SCC)

globaveinc = sum(output(266,:))/sum(population(266,:));
equityweight = output(266,:)./population(266,:);
equityweight = equityweight/globaveinc;
equityweight = equityweight.^RRA;

globalSCC = equityweight*SCC';
   

