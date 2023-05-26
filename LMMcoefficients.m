function [alpha, beta] = LMMcoefficients(q, beta0)
format long
betaq = 1-beta0;
Beta0Column = zeros(q+2,1);
alpharow = ones(1,q+1);
alpharowr = [];
for r=1:q+1
    for i=1:q+1
        alpharowr(i) = (i-1)^r;
    end
    %Beta0Column(r) = r*(beta0*(0)^(r-1)+q^(r-1)*betaq);
    Beta0Column(r+1) = r*(beta0*(0)^(r-1)+q^(r-1)*betaq);
    alpharow = [alpharow;alpharowr];
end 
% remove final rows on beta column and alpha column
alpharow(length(alpharow),:) = [];
Beta0Column(length(Beta0Column)) = [];
alpha = transpose(linsolve(alpharow,Beta0Column));
beta = zeros(1,q+1);
beta(1)=beta0;
beta(q+1)=betaq;
end