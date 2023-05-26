% plots for question 4b
tic
[Ut1, normt1, Qt1, t1] = LMMsolve([-1,1], [1,0], [1,4,5;4,2,6;5,6,3], [1;0;0], 5, 500);
[normU1, QtU1] = changeInNormQt(normt1,Qt1,Ut1);
[Ut2, normt2, Qt2, t2] = LMMsolve([-1,1], [0,1], [1,4,5;4,2,6;5,6,3], [1;0;0], 5, 500);
[normU2, QtU2] = changeInNormQt(normt2,Qt2,Ut2);
[Ut3, normt3, Qt3, t3] = LMMsolve([-1,1], [1/2,1/2], [1,4,5;4,2,6;5,6,3], [1;0;0], 5, 500);
[normU3, QtU3] = changeInNormQt(normt3,Qt3,Ut3);
[alpha, beta] = LMMcoefficients(4, 0.5);
svals=startingvalues(4, [1,4,5;4,2,6;5,6,3], [1;0;0], 5/500);
[Ut4, normt4, Qt4, t4] = LMMsolve(alpha, beta, [1,4,5;4,2,6;5,6,3], svals, 5, 500);
[normU4, QtU4] = changeInNormQt(normt4,Qt4,Ut4);

semilogy(t1,normU1)
hold on
semilogy(t2,normU2)
semilogy(t3,normU3)
semilogy(t4,normU4)
xlabel('time')
%ylabel('absolute change in l^2 norm')
title('change in norm')
legend({'FE','BE', 'TR','LMM'},'Location','northwest','Orientation','horizontal')
figure()
hold off

semilogy(t1,QtU1)
hold on 
semilogy(t2,QtU2)
semilogy(t3,QtU3)
semilogy(t4,QtU4)
xlabel('time')
%ylabel('absolute change in Q')
title('change in Q')
legend({'FE','BE', 'TR','LMM'},'Location','northwest','Orientation','horizontal')
hold off
toc