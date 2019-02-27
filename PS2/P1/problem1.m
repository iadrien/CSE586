
% Euler's Method
% Initial conditions and setup
h = 1; %(enter your step size here);  % step size
x = 0:h:5; %(enter the starting value of x here):h:(enter the ending value of x here);  % the range of x
y = zeros(size(x));  % allocate the result y
y(1) = 1; %(enter the starting value of y here);  % the initial y value
n = numel(y);  % the number of y values

for i=1:n-1
    f = 2-exp(-4*x(i))-2*y(i); %the expression for y' in your DE
    y(i+1) = y(i) + h * f;
end

hold on;
plot(x,y);

%% 0.1
h = 0.1;%(enter your step size here);  % step size
x = 0:h:5; %(enter the starting value of x here):h:(enter the ending value of x here);  % the range of x
y = zeros(size(x));  % allocate the result y
y(1) = 1; %(enter the starting value of y here);  % the initial y value
n = numel(y);  % the number of y values

for i=1:n-1
    f = 2-exp(-4*x(i))-2*y(i); %the expression for y' in your DE
    y(i+1) = y(i) + h * f;
end

hold on;
plot(x,y);

%% 0.05
h = 0.05;%(enter your step size here);  % step size
x = 0:h:5; %(enter the starting value of x here):h:(enter the ending value of x here);  % the range of x
y = zeros(size(x));  % allocate the result y
y(1) = 1; %(enter the starting value of y here);  % the initial y value
n = numel(y);  % the number of y values

for i=1:n-1
    f = 2-exp(-4*x(i))-2*y(i); %the expression for y' in your DE
    y(i+1) = y(i) + h * f;
end

hold on;
plot(x,y);

%% 0.01
h = 0.01;%(enter your step size here);  % step size
x = 0:h:5; %(enter the starting value of x here):h:(enter the ending value of x here);  % the range of x
y = zeros(size(x));  % allocate the result y
y(1) = 1; %(enter the starting value of y here);  % the initial y value
n = numel(y);  % the number of y values

for i=1:n-1
    f = 2-exp(-4*x(i))-2*y(i); %the expression for y' in your DE
    y(i+1) = y(i) + h * f;
end

hold on;
plot(x,y);

%% 0.005
h = 0.005;%(enter your step size here);  % step size
x = 0:h:5; %(enter the starting value of x here):h:(enter the ending value of x here);  % the range of x
y = zeros(size(x));  % allocate the result y
y(1) = 1; %(enter the starting value of y here);  % the initial y value
n = numel(y);  % the number of y values

for i=1:n-1
    f = 2-exp(-4*x(i))-2*y(i); %the expression for y' in your DE
    y(i+1) = y(i) + h * f;
end

hold on;
plot(x,y);

%% 0.001
h = 0.001;%(enter your step size here);  % step size
x = 0:h:5; %(enter the starting value of x here):h:(enter the ending value of x here);  % the range of x
y = zeros(size(x));  % allocate the result y
y(1) = 1; %(enter the starting value of y here);  % the initial y value
n = numel(y);  % the number of y values

for i=1:n-1
    f = 2-exp(-4*x(i))-2*y(i); %the expression for y' in your DE
    y(i+1) = y(i) + h * f;
end

hold on;
plot(x,y);

legend('h=1','h=0.1','h=0.05','h=0.01','h=0.005','h=0.001');