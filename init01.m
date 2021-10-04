%initialize

climsens = 4.260547;
EndYear = 2300;
StartYear = 1750;
NYear = EndYear-StartYear+1;
year = zeros(NYear,1);
year(1) = StartYear;
for i=2:NYear
    year(i) = year(i-1)+1;
end

MRHparam;
RFparam;
STparam;