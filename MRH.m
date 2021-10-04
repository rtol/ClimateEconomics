function CO2concnew = MRH(CO2concold,CO2emit,CO2life,CO2share,CO2convert)
%function CO2concnew = MRH(CO2concold,CO2emit,CO2life,CO2share,CO2convert)
%
%updates the atmospheric concentration of carbon dioxide using the
%Maier-Reimer Hasselmann model

CO2concnew = (1-CO2life).*CO2concold + CO2convert*CO2share*CO2emit;
