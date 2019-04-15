%% p2 c

% read data
Dataset = readtable("PS4/iris.txt");
Dataset.conjugate = ones(150,1);
Dataset = Dataset(:,[6 1:5]);

Trainingset = Dataset(51:80,:);
Trainingset = [Trainingset;Dataset(101:130,:)];
Testingset = Dataset(81:100,:);
Testingset = [Testingset; Dataset(131:150,:)];

X= table2array(Trainingset(:,1:5));
Y = [zeros(30,1);ones(30,1)];

testX = table2array(Testingset(:,1:5));
testY = [zeros(20,1);ones(20,1)];

% change sigma here
sigma = 2;
Beta = findBeta(X,Y,sigma);
[p,e] = predictwithBeta(testX, testY, Beta,sigma);


function Beta = findBeta(X,Y,sigma)
    loglikelihood = 0;
    gradient = zeros(5,1);
    Beta = ones(5,1);
    for batch = 1:size(X, 1)
        loglikelihood = loglikelihood + (1 - Y(batch, :)) * X(batch, :) * Beta + log( 1 + exp(-1 * X(batch, :) * Beta));
        
        h = exp(-1 * X(batch, :) * Beta);
        gradient = gradient + (1 - Y(batch, :) - h/(1+h)) * X(batch, :)';
    end
    
    loglikelihood = loglikelihood + norm(Beta, 2)/(2*sigma^2);
    gradient = gradient + Beta/(sigma^2);
    Beta = Beta - 0.01 * gradient;
 
end


function [pred,error] = predictwithBeta(testX, testY, Beta,sigma)
    
    pred = zeros(size(testY));
    error = 0;
    for i = 1:size(testX,1)
        pred(i)=1 / (1 + exp(-1 * testX(i, :) * Beta)) * exp(norm(Beta, 2) / sigma^2)/2;
        if pred(i)>0.5
            pred(i)=1;
        else
            pred(i)=0;
        end
        
        if pred(i) ~= testY(i)
            error = error + 1;
        end
    end
end