function Y = CobbDouglas(A,K,L,lambda)
%Y = CobbDouglas(A,K,L,lambda)
%
%computes output based on the Cobb-Douglas production function

Y = A.*K.^lambda.*L.^(1-lambda);
