%% p1 a
% data from ps3
load("PS4\matlab.mat");

figure ('name','Faces all');
for i=1:21
    drawFaceParts( -ptsA{i}, 'r-');
end
title('Faces Alined')
xlabel('x');
ylabel('y');
axis equal;
axis off;


mseError=zeros(1,21);
figure ('name','Faces all from autoencoder');
autoenc = trainAutoencoder(ptsA, 136, 'MaxEpochs', 2000);
reconstruct = predict(autoenc,ptsA);
for i=1:21
%     %autoenc = trainAutoencoder(ptsA{i},68);
%     reconstruct = predict(autoenc,ptsA{i});
     mseError(i) = mse(ptsA{i}-reconstruct{i});
     drawFaceParts( -reconstruct{i}, 'r-');
end
title('Faces Alined Autoencoder')
xlabel('x');
ylabel('y');
axis equal;
axis off;

figure ('name', 'MSE for each face');
plot(mseError);

%% p1b
%% 1%

mseError=zeros(1,21);
figure ('name','Faces all from autoencoder 1%');
autoenc = trainAutoencoder(ptsA, 1, 'MaxEpochs', 2000);
reconstruct = predict(autoenc,ptsA);
for i=1:21
%     %autoenc = trainAutoencoder(ptsA{i},68);
%     reconstruct = predict(autoenc,ptsA{i});
     mseError(i) = mse(ptsA{i}-reconstruct{i});
     drawFaceParts( -reconstruct{i}, 'r-');
end
title('Faces Alined Autoencoder 1%')
xlabel('x');
ylabel('y');
axis equal;
axis off;

figure ('name', 'MSE for each face 1%');
plot(mseError);

%% 3%

mseError=zeros(1,21);
figure ('name','Faces all from autoencoder 3%');
autoenc = trainAutoencoder(ptsA, 4, 'MaxEpochs', 2000);
reconstruct = predict(autoenc,ptsA);
for i=1:21
%     %autoenc = trainAutoencoder(ptsA{i},68);
%     reconstruct = predict(autoenc,ptsA{i});
     mseError(i) = mse(ptsA{i}-reconstruct{i});
     drawFaceParts( -reconstruct{i}, 'r-');
end
title('Faces Alined Autoencoder 3%')
xlabel('x');
ylabel('y');
axis equal;
axis off;

figure ('name', 'MSE for each face 3%');
plot(mseError);

%% 10%

mseError=zeros(1,21);
figure ('name','Faces all from autoencoder 10%');
autoenc = trainAutoencoder(ptsA, 14, 'MaxEpochs', 2000);
reconstruct = predict(autoenc,ptsA);
for i=1:21
%     %autoenc = trainAutoencoder(ptsA{i},68);
%     reconstruct = predict(autoenc,ptsA{i});
     mseError(i) = mse(ptsA{i}-reconstruct{i});
     drawFaceParts( -reconstruct{i}, 'r-');
end
title('Faces Alined Autoencoder 1%')
xlabel('x');
ylabel('y');
axis equal;
axis off;

figure ('name', 'MSE for each face 10%');
plot(mseError);

%% p1 c
%% w 0.1
mseError=zeros(1,21);
figure ('name','Faces all from autoencoder of w 0.1');
autoenc = trainAutoencoder(ptsA, 136, 'MaxEpochs', 2000, 'L2WeightRegularization', 0.1);
reconstruct = predict(autoenc,ptsA);
for i=1:21
%     %autoenc = trainAutoencoder(ptsA{i},68);
%     reconstruct = predict(autoenc,ptsA{i});
     mseError(i) = mse(ptsA{i}-reconstruct{i});
     drawFaceParts( -reconstruct{i}, 'r-');
end
title('Faces Alined Autoencoder Full Size w = 0.1')
xlabel('x');
ylabel('y');
axis equal;
axis off;

figure ('name', 'MSE for each face w=0.1');
plot(mseError);
disp(sum(mseError));
%% w 0.2
mseError=zeros(1,21);
figure ('name','Faces all from autoencoder of w 0.2');
autoenc = trainAutoencoder(ptsA, 136, 'MaxEpochs', 2000, 'L2WeightRegularization', 0.2);
reconstruct = predict(autoenc,ptsA);
for i=1:21
%     %autoenc = trainAutoencoder(ptsA{i},68);
%     reconstruct = predict(autoenc,ptsA{i});
     mseError(i) = mse(ptsA{i}-reconstruct{i});
     drawFaceParts( -reconstruct{i}, 'r-');
end
title('Faces Alined Autoencoder Full Size w = 0.2')
xlabel('x');
ylabel('y');
axis equal;
axis off;

figure ('name', 'MSE for each face w=0.2');
plot(mseError);
disp(sum(mseError));
%% w 0.3
mseError=zeros(1,21);
figure ('name','Faces all from autoencoder of w 0.3');
autoenc = trainAutoencoder(ptsA, 136, 'MaxEpochs', 2000, 'L2WeightRegularization', 0.3);
reconstruct = predict(autoenc,ptsA);
for i=1:21
%     %autoenc = trainAutoencoder(ptsA{i},68);
%     reconstruct = predict(autoenc,ptsA{i});
     mseError(i) = mse(ptsA{i}-reconstruct{i});
     drawFaceParts( -reconstruct{i}, 'r-');
end
title('Faces Alined Autoencoder Full Size w = 0.3')
xlabel('x');
ylabel('y');
axis equal;
axis off;

figure ('name', 'MSE for each face w=0.3');
plot(mseError);
disp(sum(mseError));
%% w 0.4
mseError=zeros(1,21);
figure ('name','Faces all from autoencoder of w 0.4');
autoenc = trainAutoencoder(ptsA, 136, 'MaxEpochs', 2000, 'L2WeightRegularization', 0.4);
reconstruct = predict(autoenc,ptsA);
for i=1:21
%     %autoenc = trainAutoencoder(ptsA{i},68);
%     reconstruct = predict(autoenc,ptsA{i});
     mseError(i) = mse(ptsA{i}-reconstruct{i});
     drawFaceParts( -reconstruct{i}, 'r-');
end
title('Faces Alined Autoencoder Full Size w = 0.4')
xlabel('x');
ylabel('y');
axis equal;
axis off;

figure ('name', 'MSE for each face w=0.4');
plot(mseError);
disp(sum(mseError));
%% w 0.1
mseError=zeros(1,21);
figure ('name','Faces all from autoencoder of w 0.5');
autoenc = trainAutoencoder(ptsA, 136, 'MaxEpochs', 2000, 'L2WeightRegularization', 0.5);
reconstruct = predict(autoenc,ptsA);
for i=1:21
%     %autoenc = trainAutoencoder(ptsA{i},68);
%     reconstruct = predict(autoenc,ptsA{i});
     mseError(i) = mse(ptsA{i}-reconstruct{i});
     drawFaceParts( -reconstruct{i}, 'r-');
end
title('Faces Alined Autoencoder Full Size w = 0.5')
xlabel('x');
ylabel('y');
axis equal;
axis off;

figure ('name', 'MSE for each face w=0.5');
plot(mseError);
disp(sum(mseError));