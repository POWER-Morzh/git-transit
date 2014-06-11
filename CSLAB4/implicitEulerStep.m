function [ T ] = implicitEulerStep( Nx, Ny, dt, Tcurrent )
%IMPLICITEULERSTEP Implementerion of Implicit Euler
%
%It takes vector Tcurrent as an argument and receiving back an vector

T = solverZeroGaussSeidel(Nx, Ny, dt, Tcurrent);

end

