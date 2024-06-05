clc
clf

%*******Test Data*******
load ./eval_weed.txt
redData_t = eval_weed(:,2);
nir1Data_t = [eval_weed(:,3) ./ redData_t]';  
nir2Data_t = [eval_weed(:,4) ./ redData_t]';
nir3Data_t = [eval_weed(:,5) ./ redData_t]';
targetData_t = eval_weed(:,7);
pTest = [nir1Data_t; nir2Data_t; nir3Data_t];

pa = 1 : length(targetData_t);

%---Plot the Original Function----
actLine = 0:0.1:0.8; 
plot(actLine, actLine); legend('Actual');
hold on

for p = 1 : length(targetData_t)
    n1 = W1 * pTest(:, p) + b1;  % Test Data
    a1 = logsig(n1); 
    a2(p) = poslin(W2 * a1 + b2); 
end % end for

xlabel('Actual Fraction of Weeds in 3 sq feet of grass area');
ylabel('Estimated Fraction of Weeds in 3 sq feet of grass area');
title('Correlation of Estimated Value with respect to the Actual Function');

scatter(targetData_t, a2);
legend('Actual', 'Estimate', 'Location', 'NorthWest');

%******************* End of Network Response Evaluation Program ***************
