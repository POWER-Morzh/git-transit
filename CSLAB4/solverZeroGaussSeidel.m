function [ Tn1 ] = solverZeroGaussSeidel(Nx, Ny, dt, Tn)
%SOLVERGAUSSSEIDEL return vector T with size Nx*Ny with computed
%approximate values

% Intialize initial matrix T and hx,hy
Tn1 = zeros(Nx+2, Ny+2);
hx = 1 / (Nx + 1);
hy = 1 / (Ny + 1);
% End of initialization


%% Computing of approximate values
    % Create vector of boundary conditions, we don't need it in our problem
    % because our boundary conditions equal zero
    boundaryB = zeros(size(Tn));
    for j = 1:Ny
        for i = 1:Nx
            if (i == 1)
                boundaryB(Nx*(j-1)+i,1) = boundaryB(Nx*(j-1)+i,1) - Tn1(i,j+1);
            end
            if (j == 1)
                boundaryB(Nx*(j-1)+i,1) = boundaryB(Nx*(j-1)+i,1) - Tn1(i+1,j);
            end
            if (i == Nx)
                boundaryB(Nx*(j-1)+i,1) = boundaryB(Nx*(j-1)+i,1) - Tn1(i+2,j+1);
            end
            if (j == Ny)
                boundaryB(Nx*(j-1)+i,1) = boundaryB(Nx*(j-1)+i,1) - Tn1(i+1,j+2);
            end
        end
    end
    % disp(boundaryB);
    % End of initializetion of matrix with boundary conditions
    
    % Computing final T
    R = 1; % residual norm
    iter = 0;
    stopIter = 15000;
    while(R > 1e-6)
        for j = 2:Ny+1
            for i = 2:Nx+1
                Tn1(i,j) = ( (Tn1(i-1,j)+Tn1(i+1,j))*dt/hx^2 + (Tn1(i,j-1) + Tn1(i,j+1))*dt/hy^2 + Tn(Nx*(j-2)+i-1,1) ) / (1 + 2*dt/hx^2 + 2*dt/hy^2);
            end
        end
        sumT = 0;
        for j = 2:Ny+1
            for i = 2:Nx +1
                sumT = sumT + ( Tn(Nx*(j-2)+i-1,1) - ( Tn1(i,j) - (Tn1(i-1,j) + Tn1(i+1,j) - 2*Tn1(i,j))*dt/hx^2 - ( - 2*Tn1(i,j) + Tn1(i,j-1) + Tn1(i,j+1))*dt/hy^2 ) )^2;
            end
        end
        R = sqrt(1/(Nx*Ny)*sumT);
        iter = iter+1;
        if( iter > stopIter)
            break;
        end
    end
    Tn1 = M2V(Tn1, Nx, Ny); % Converts matrix Tn1 in vector Tn1 for ongoing computations
    %R
    %iter
    % T is ready

end

