function [atmtempnew oceantempnew] = ST(atmtempold,oceantempold,radforc,STpar)
%function [atmtempnew oceantempnew] = ST(atmtempold,oceantempold,radforc,STpar)
%
%updates the temperature of the atmosphere and the ocean using the Schneider-Thompson model

atmtempnew   = atmtempold   + STpar(2)*(STpar(1)*radforc-atmtempold) + STpar(3)*(oceantempold-atmtempold);
oceantempnew = oceantempold                                          + STpar(4)*(atmtempold-oceantempold);