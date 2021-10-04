%CO2 parameters

CO2emitbau = CO2emit;
energyint = energy./outputobs;
emissint = CO2emit./energy;

AEEI = energyint(2010-StartYear+1,:)./energyint(1960-StartYear+1,:);
AEEI = AEEI.^(1/50);
ACEI = emissint(2010-StartYear+1,:)./emissint(1960-StartYear+1,:);
ACEI = ACEI.^(1/50);

AEEI = [0.98926539 0.98782002 0.99025746];
ACEI = [0.99594960 1.00029674 1.00979371];