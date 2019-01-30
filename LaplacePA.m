% Laplace Equation by Iteration PA Assignment

clear all;
clc;

% Set dimensions of 2D space
xdim = 30;
ydim = 30;


% Initialize V matrices
V = zeros(xdim+1,ydim+1);
V_prev = zeros(xdim+1, ydim+1);


i=1:1:xdim+1;

% Set boundary conditions
V(1,i) = 1; % left
V(xdim+1,i) = 1; % right
V(i,ydim+1) = 0; % top
V(i,1) = 0; % bottom


error = max(max(abs(V-V_prev)));
iter = 0;

while error>0.000001
    iter = iter+1;
    
    % Finite difference method iteration loop
    for i=2:1:xdim
        for j=2:1:ydim
            V(i,j) = (V(i-1,j) + V(i,j-1) + V(i+1,j) + V(i,j+1))/4;
        end
    end
    % Calculate new error
    error = max(max(abs(V-V_prev)));
    % Update previous V solution for iteration
    V_prev = V;
    
end

%Plot the electric field distribution
figure;
title('Electric Field Distribution');
[ex,ey]=gradient(V);
quiver(-ex,-ey); %Quiver command creates a plot, E=-grad(V), hence the negative sign

figure;
title('Electric Field Distribution');
surf(V)

% Simulation using imboxfilt

clear all;
clc;

% Set dimensions of 2D space
xdim = 30;
ydim = 30;


% Initialize V matrices
V = zeros(xdim+1,ydim+1);
V_prev = zeros(xdim+1, ydim+1);


i=1:1:xdim+1;

% Set boundary conditions
V(1,i) = 1; % left
V(xdim+1,i) = 1; % right
V(i,ydim+1) = 0; % top
V(i,1) = 0; % bottom


error = max(max(abs(V-V_prev)));
iter = 0;

while error>0.000001
    iter = iter+1;
    
    % Finite difference method iteration using imboxfilt
    V = imboxfilt(V, 5);
    
    % Set boundary conditions
    V(1,i) = 1; % left
    V(xdim+1,i) = 1; % right
    V(i,ydim+1) = 0; % top
    V(i,1) = 0; % bottom
    
    % Calculate new error
    error = max(max(abs(V-V_prev)));
    % Update previous V solution to calculate error
    V_prev = V;
end

%Plot the electric field distribution using imboxfilt
figure;
title('Electric Field Distribution');
[ex,ey]=gradient(V);
quiver(-ex,-ey); %Quiver command creates a plot, E=-grad(V), hence the negative sign

figure;
title('Electric Field Distribution');
surf(V)



