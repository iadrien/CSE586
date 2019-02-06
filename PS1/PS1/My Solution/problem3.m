clear all;
I = imread('cameraman.tif');
I_noise = imnoise(I,'gaussian', 0, 0.3);

% change the image matrix to double
I_noise = double(I_noise); 

n=length(I);

% number of iterations allowed
max_itr = 50000;    

% stepsize
stepsize = 0.2; 

% compare the telorence affects
powerfactor = [1,2,5,7];
index = 1;

% run models
for factor = powerfactor
  tolerence = 10.^(-factor);

  [newimage,Energy,iter(index)] = rof(I_noise,stepsize,max_itr,tolerence);  
  
  index = index + 1;
end

