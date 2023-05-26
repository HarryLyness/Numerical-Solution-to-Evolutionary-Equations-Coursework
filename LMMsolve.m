function [Ut, normt, Qt, t] = LMMsolve(alpha, beta, H, Ustartingvalues, T, N)
format long
h = T/N;
q = length(Ustartingvalues(1,:)); 
% Collection of U0,...Uq 
bigu = Ustartingvalues;

%collection of Uj,...,Uk
Uvalues = Ustartingvalues;

% allocating startingvalues with times
tn = 0;
t=[0];
if q == 1
    something=1;
else 
    for i=1:q-1
        tn = tn+h;
        t = [t,tn];
    end
end


% implicit case
if alpha(length(alpha)) ~= 0 && beta(length(beta)) ~= 0
    identity = speye(length(H));
    for i=1:N-q+1
        tn = tn+h;
        t=[t,tn];
        Uq=inv(identity-(h*beta(length(beta)))/ ...
            alpha(length(alpha))*H*1i)*residual(Uvalues,alpha,beta,H,h,q);
        bigu = [bigu,Uq];
        Uvalues = [Uvalues,Uq];
        Uvalues(:,1) = [];
    end
else
    % now we do the main loop for explicit
    for i=1:N-q+1
        tn = tn + h;
        t = [t,tn];
        Uq = residual(Uvalues,alpha,beta,H,h,q);
        bigu=[bigu,Uq];
        Uvalues=[Uvalues,Uq];
        Uvalues(:,1) = [];
    end
end

% saving variables in correct form
for i=1:length(bigu(1,:))
    normt(i) = (ctranspose(bigu(:, i))*bigu(:, i)).^(1/2);
    Qt(i) = ctranspose(bigu(:, i))*H*bigu(:, i);
    %normt(i) = norm(bigu(:,i));
end
Ut = bigu;
end
