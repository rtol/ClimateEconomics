function imp = impactcc(temp,impar,impelas,inccap,inccap0)

imp = impar(1,:)*temp + impar(2,:)*temp^2 + impar(3,:)*temp^6;
imp = imp.*(inccap./inccap0).^impelas;