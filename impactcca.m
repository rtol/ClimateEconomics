function [adap, impa, imp] = impactcca(temp,impar)

adap = -0.5*temp*impar(1,:)./impar(2,:);
impa = impar(1,:)*temp.*(1-adap) - impar(2,:).*adap.^2;

imp = impar(3,:)*temp + impar(4,:)*temp^2;
