% read files
files=dir('./dat/*.pts');
numfiles=length(files);
x=cell(1,numfiles);
ptsA=cell(1,numfiles);
for i=1:numfiles
    filepath = strcat(files(i).folder,'\',files(i).name);
    x{i}=readPoints(filepath);
end

% Set the mean to the frst point set, x mu = x1.
xmu = x{1};

numiteration=20;
energies=zeros(1,numiteration);

for iteration = 1:numiteration
    
    % Initial condition
    oldxmu = xmu;
    
    % Align all xi to x mu by minimizing
    for i=1:numfiles
      [ptsA{i}, pars] = getAlignedPts(xmu, x{i}); 
    end

    % Calculate the new mean as
    xmu = 0;
    for i=1:numfiles
        xmu = xmu + ptsA{i}/numfiles;
    end
    
    % Align x mu to x1 (and use it as new x mu)
    xmu = getAlignedPts(x{1}, xmu);
    
    % Compute energy
    
    for i=1:numfiles
        energies(iteration)=energies(iteration)+norm(xmu-ptsA{i});
    end
    
end

figure ('name','Faces');
drawFaceParts( -x{1}, 'r-');
drawFaceParts( -xmu, 'k-');
title('Face 1 (red) and Face Alined (black)')
xlabel('x');
ylabel('y');
axis equal;
axis off;

figure('name','Energy');
plot(energies);
title('Energy Plot');
xlabel('Iterations');
ylabel('Energy');

figure ('name','Faces all');
for i=1:numfiles
    drawFaceParts( -x{i}, 'r-');
end
drawFaceParts( -xmu, 'k-');
title('Faces (red) and Face Alined (black)')
xlabel('x');
ylabel('y');
axis equal;
axis off;