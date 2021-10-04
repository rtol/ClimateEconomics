%population parameters

popgrowth = population(2010-StartYear+1,:)./population(2009-StartYear+1,:)-1;
popdecline = 0.95;
popgrowth = popdecline*popgrowth;