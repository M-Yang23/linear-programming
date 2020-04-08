exp_ret = [0.2, 0.1, 0.15;
           0.3, 0.2, 0.1;
           0.15, 0.2, 0.17;
           0.13, 0.1, 0.19;
           0.09, 0.02, 0.09;
           0.2, 0.16, 0.15;
           0.18, 0.17, 0.11;
           0.06, 0.11, 0.11;
           0.05, 0.12, 0.1;
           0.07, 0.11, 0.1;
           0.1, 0.1, 0.08];
weight = [0.1, 0.05, 0.13, 0.13, 0.1, 0.05, 0.04, 0.2, 0.1, 0.05, 0.05];
rf = [0.045, 0.05, 0.055];
%calculate r_M respect to each expert
rm = zeros(1,3);
for i = 1:1:3
    for j = 1:1:11
        rm(1,i) = rm(1,i) + weight(1,j) * exp_ret(j,i);
    end
end
%calculate beta_{i,j} respect to each company and expert
b = zeros(12,3);
for i = 1:1:11
    for j = 1:1:3
        b(i,j) = (exp_ret(i,j) - rf(1,j)) / (rm(1,j) - rf(1,j));
    end
end
%max R which is min -R
f = [0,0,0,0,0,0,0,0,0,0,0,-1];
a = zeros(6,12);
%constraint sigma(proportion*beta)+0*R < B with respect to each expert
for i = 1:1:3
    for j = 1:1:11
        a(i,j) = b(j,i);
    end
    a(i,12) = 0;
end
%constraint -sigma(proportion*exp_ret)+R < 0 respect to each expert
for i = 4:1:6
    for j = 1:1:11
        a(i,j) = -exp_ret(j, i-3);
    end
    a(i,12) = 1;
end
b = [1.15; 1.15; 1.15; 0; 0; 0];
%constraint sum of proportion should be 1
aeq = [1,1,1,1,1,1,1,1,1,1,1,0];
beq = 1;
%assume there's no short selling, hence all proportion must be positive
lb = [0,0,0,0,0,0,0,0,0,0,0,-Inf];
ub = [];
opt = linprog(f,a,b,aeq,beq,lb,ub);
fprintf('Optimal proportions:\n');
fprintf('IBM %.4f \t\t', opt(1,1));
fprintf('Microsoft %.4f \t', opt(2,1));
fprintf('GE %.4f \t', opt(3,1));
fprintf('Exxon %.4f \t', opt(4,1));
fprintf('ATT %.4f \n', opt(5,1));
fprintf('Intel %.4f \t', opt(6,1));
fprintf('Merck %.4f \t', opt(7,1));
fprintf('GM %.4f \t', opt(8,1));
fprintf('Ford %.4f \t', opt(9,1));
fprintf('Texaco %.4f \n', opt(10,1));
fprintf('Citibank %.4f \n\n', opt(11,1));
fprintf('Optimal expected return: %.4f\n', opt(12,1));