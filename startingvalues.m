function [Ustartingvalues] = startingvalues(q, H, U0, h)
Ustartingvalues = [U0];
t=h;
for i=1:q-1
    Uj = expm(1i*t*H)*U0;
    Ustartingvalues = [Ustartingvalues,Uj];
    t=t+h;
end
