function [res] = residual(Uvalues,alpha,beta,H,h,q)
sumalphaU = 0;
sumbetaFu = 0;
for j=1:q
    sumalphaU = sumalphaU + alpha(j)*Uvalues(:,j);
    sumbetaFu = sumbetaFu + beta(j)*f(Uvalues(:,j),H);
end
res = (h*sumbetaFu-sumalphaU)/(alpha(length(alpha)));
end 