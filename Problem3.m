f = [0.18, 0.22, 0.1, 0.12, 0.1, 0.09, 0.4, 0.16, 0.5, 0.07]; %minimum total cost
intcon = [1,2,3,4,5,6,7,8,9,10] %consider only integer
a = [-90, -110, -100, -90, -75, -35, -65, -100, -120, -65; % -(total calories) has to less than -420
    0, 2, 2, 2, 5, 3, 0, 4, 0, 1; % total fat has to less than 20
    0, 0, 0, 0, 270, 8, 0, 12, 0, 0; % total cholesteral has to less than 30
    -6, -4, -2, -3, -1, 0, -1, 0, 0, -1; % -(total iron) has to less than -5
    -20, -48, -12, -8, -30, 0, -52, -250, -3, -26; % -(total calcium) has to less than -400
    -3, -4, -5, -6, -7, -2, -1, -9, -1, -3; % -(total protein) has to less than -20
    -5, -2, -3, -4, 0, 0, -1, 0, 0, -3]; % -(total fiber) has to less than -12
b = [-420; 20; 30; -5; -400; -20; -12]; 
aeq = [];   beq = []; % no equality constraint
lb = [ 0; 0; 0; 0; 0; 0; 0; 0; 0; 0];               % no bran cereal, which is 0 =< bran cereal =< 0
ub = [ 0; Inf; Inf; Inf; Inf; Inf; 1; 1; Inf; 1];   % wheat toast =< 1, milk =< 1, orange =< 1, everything  >= 0
% solve the integer linear programming
opt = intlinprog(f,intcon,a,b,aeq,beq,lb,ub);
fprintf('Optimal Solution:\n')
fprintf('Bran cereal %.0f cup.\t', -opt(1,1));
fprintf('Dry cereal is %.0f cups.\t', opt(2,1));
fprintf('Oatmeal is %.0f cups.\t', opt(3,1));
fprintf('Oat bran is %.0f cup.\n', opt(4,1));
fprintf('Egg is %.0f.\t', opt(5,1));
fprintf('Bacon is %.0f slice.\t', -opt(6,1));
fprintf('Orange is %.0f.\t', -opt(7,1));
fprintf('Milk-2%% is %.0f cup.\t', opt(8,1));
fprintf('Orange juice is %.0f cup.\n', -opt(9,1));
fprintf('Wheat toast is %.0f slice.\n\n', opt(10,1));
value = a*opt;
fprintf('Optimal Nutritients:\n')
fprintf('Calories is %.0f calories.\t', -value(1,1));
fprintf('Fat is %.0f g.\t', value(2,1));
fprintf('Cholesterol is %.0f mg.\n', value(3,1));
fprintf('Iron is %.0f mg.\t\t', -value(4,1));
fprintf('Calcium is %.0f mg.\t\t', -value(5,1));
fprintf('Protein is %.0f g.\t', -value(6,1));
fprintf('Fiber is %.0f g.\n\n', -value(7,1));
fprintf('Optimal total cost is %.2f\n', f*opt);