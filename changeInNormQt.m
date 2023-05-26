function [normU,QtU] = changeInNormQt(normt,Qt,Ut)
normU = [];
QtU = [];
for n=1:length(Ut)
    temp1=abs(normt(n)-normt(1));
    normU = [normU,temp1];
    temp2=abs(Qt(n)-Qt(1));
    QtU = [QtU, temp2];
end
end

