function [ T ] = explicitEulerStep( Nx, Ny, dt, Tcurrent )
%EXPLICITEULERSTEP compute T after one step in time
%   It compute T from T = Tcurrent + dt * A * Tcurrent


T = Tcurrent + dt .* matrixA(Nx,Ny) * Tcurrent;

end

