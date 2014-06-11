function [ vT ] = M2V( mT, Nx, Ny )
%M2V Converts Matrix mT with zeros on borders in Vector vT without
%boundarys
if ( size(mT, 1) ~= Nx+2 ) || ( size(mT, 2) ~= Ny+2 )
    error('Nx and Ny are not match to size of mT');
else
    vT = zeros(Nx*Ny, 1);
    for j = 2:Ny+1
            for i = 2:Nx+1
                vT(Nx*(j-2)+i-1,1) = mT(i,j);
            end
    end
end

end

