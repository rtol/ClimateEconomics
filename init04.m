%initialize

emitalloc = zeros(NYear,NReg);
emitalloc(266:NYear,:) = emitalloc(266:NYear,:) + 0.05;
permittrade = zeros(NYear,NReg);
permitprice = zeros(NYear,1);