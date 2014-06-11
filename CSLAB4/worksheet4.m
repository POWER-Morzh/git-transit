function worksheet4( )
%WORKSHEET4 Partial Differential Equations Instationary Equations
%   Solution of PDE


%% a)

% At the time t = Inf the temperature in all grid points will be equal zero
% because the boundary conditions are equal zero and no heating sources are
% prested

%% b) Implementetion of explicit Euler
% Initial data
Nx = 31;
Ny = Nx;
dt = 1/256;

vT = cInitVecT(Nx,Ny); % create T vector with initial values


vT = explicitEulerStep(Nx, Ny, dt, vT); % vT meens vector T



%% c)

% Initialization of lists of all values, which we will use in our code
tList = [1/8 2/8 3/8 4/8];
%tListString = {'1/8' '2/8' '3/8' '4/8};
dtList = [1/64 1/128 1/256 1/512 1/1024 1/2048 1/4096];
NxNyList = [3 7 15 31];

%Creating of all plots
for it = 1:length(tList)
    hfigSurf(it) = figure('Name',num2str(tList(it)));% Creation of figures for different times
end
figSurfPNG = figure; % this figure is used to print plots in PNG files
i = 1; % i is used to plot plots
for iN = NxNyList % Go throught all Nx
    [X, Y] = meshgrid(0:1/(iN+1):1,0:1/(iN+1):1); % Cration of meshgrid to use it in surf to plot surfaceces [0,1]
    for idt = dtList % Go throught all dt
        vT = cInitVecT(iN, iN); % We will always initialize oru vector and each time it will have different sizes
        for it = 1:length(tList) % Go throught all times
            for t = 0:idt:1/8
                vT = explicitEulerStep(iN, iN, idt, vT);
            end
            mT = V2M( vT, iN, iN ); % mT - matrix T
            % Saving in PNG
            img = figure(figSurfPNG);
            surf(X,Y,mT);
            imgPath = 'images\'; % folder in wich the program will save all PNG
            imgName = [ num2str(tList(it)) '-' num2str(iN) '-' num2str(idt) '.png' ]; % Name of files which is depend on Nx, dt, t
            print(img, '-dpng', [imgPath imgName]);
            % End of Saving in PNG
            figure(hfigSurf(it)); % Create figure which will be divided in 28 parts
                subplot(4,7,i);
                surf(X,Y,mT);
        end
        i = i + 1;
    end
end

%End of creating plots

%% d) Implicit Euler
% Initial data
Nx = 3;
Ny = Nx;
dt = 1/64;

vT = cInitVecT(Nx,Ny); % create T vector with initial values
vT = implicitEulerStep(Nx, Ny, dt, vT); % vT meens vector T

%% e) Check are there stable solutions
% Initial data
dt = 1/64;
surfImEuler = figure('Name','Implicit Euler');% Creation of figures for different times

i = 1; % i is used to plot plots
for iN = NxNyList % Go throught all Nx
    [X, Y] = meshgrid(0:1/(iN+1):1,0:1/(iN+1):1); % Cration of meshgrid to use it in surf to plot surfaceces [0,1]
    vT = cInitVecT(iN,iN); % create T vector with initial values for each NxNy
    for tt = tList % Go throught all t
        for t = 0:dt:1/8 % Go from 0 to 1/8 then from 1/8 to 2/8
            vT = implicitEulerStep(iN, iN, dt, vT);
        end
        mT = V2M( vT, iN, iN ); % mT - matrix T to plot
        figure(surfImEuler); % Create figure which will be divided in 28 parts
            subplot(4,4,i);
            surf(X,Y,mT);
        i = i + 1;
    end
end
end

