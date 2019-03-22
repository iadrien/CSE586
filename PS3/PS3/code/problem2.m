% read files
files=dir('./dat/*.pts');
numfiles=length(files);
x=cell(1,numfiles);

for i=1:numfiles
    filepath = strcat(files(i).folder,'\',files(i).name);
    x{i}=readPoints(filepath);
end

% create mean of the face
meanface = zeros(68,2);
for i=1:numfiles
    meanpoint = mean(x{i});
    for j=1:size(x{i},1)
       x{i}(j,1)= x{i}(j,1)-meanpoint(1);
       x{i}(j,2)= x{i}(j,2)-meanpoint(2);
    end
end

for i =1:numfiles
    meanface = meanface + x{i}/numfiles;
end

% compose the data into one matrix for pca
for i=1:numfiles
    for j=1:size(x{i},1)
       x{i}(j,1)= x{i}(j,1)-meanface(j,1);
       x{i}(j,2)= x{i}(j,2)-meanface(j,2);
    end
end

composex = zeros(21, 2*68);
for i =1:numfiles
    for j=1:size(x{i},1)
       composex(i,2*j-1)= x{i}(j,1);
       composex(i,2*j)=x{i}(j,2);
    end
end

% use matlab inbuilt pca
[coeff, score, laten] = pca(composex,'Economy',false);

% three most eigen value
eigenvalues = laten(1:3);
eigenvector = coeff(:,1:3);

% Show the results by plotting shape variations with respect to these three principal 
% components independently by varying between two standard deviations around the mean
facevariation = zeros(size(meanface,1), 2);
for i = 1 : size(meanface)       
    facevariation(i,1) = meanface(i,1) + 2 * sqrt(eigenvalues(1)) * eigenvector(2*i-1,1);
    facevariation(i,2) = meanface(i,2) + 2 * sqrt(eigenvalues(1)) * eigenvector(2*i,1);                          
end
figure('name','Face on first component(red mean face)');
drawFaceParts(meanface, 'r-');
drawFaceParts(facevariation, 'k-');
title('Faces on first component');
axis equal;
axis off;
camroll(180);

% second
facevariation = zeros(size(meanface,1), 2);
for i = 1 : size(meanface)       
    facevariation(i,1) = meanface(i,1) + 2 * sqrt(eigenvalues(2)) * eigenvector(2*i-1,1);
    facevariation(i,2) = meanface(i,2) + 2 * sqrt(eigenvalues(2)) * eigenvector(2*i,1);                          
end
figure('name','Face on second component(red mean face)');
drawFaceParts(meanface, 'r-');
drawFaceParts(facevariation, 'k-');
title('Faces on second component');
axis equal;
axis off;
camroll(180);

% third
facevariation = zeros(size(meanface,1), 2);
for i = 1 : size(meanface)       
    facevariation(i,1) = meanface(i,1) + 2 * sqrt(eigenvalues(3)) * eigenvector(2*i-1,1);
    facevariation(i,2) = meanface(i,2) + 2 * sqrt(eigenvalues(3)) * eigenvector(2*i,1);                          
end
figure('name','Face on third component(red mean face)');
drawFaceParts(meanface, 'r-');
drawFaceParts(facevariation, 'k-');
title('Faces on third component');
axis equal;
axis off;
camroll(180);

figure('name', 'PCA decay');
plot(latent);