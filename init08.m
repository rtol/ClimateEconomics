%initialize

perturbation = zeros(NYear,1);
StartPolicy = 2015;
NPol = 10;
StepPol = 10;

welfare = zeros(NYear,NReg);
utilDF = zeros(NYear,1);
utilDF(StartPolicy-StartYear+1)= 1;
for i=2:EndYear-StartPolicy,
    utilDF(StartPolicy-StartYear+i)= utilDF(StartPolicy-StartYear+i-1)/(1+PRTP);
end
