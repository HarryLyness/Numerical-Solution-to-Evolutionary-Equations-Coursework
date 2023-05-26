function [UtyT, Unt0] = question4c(Ut,T,H,normU)
% function that supports 'Question4cCode'
UtyT=Ut(:, size(Ut,2)) - expm(1i*T*H)*[1;0;0];
UtyT = sqrt(ctranspose(UtyT)*UtyT);

Unt0 = normU(length(normU));

end