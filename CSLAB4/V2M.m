function [ mT ] = V2M( vT, Nx, Ny )
%V2M Converts Vector vT in Matrix mT with zeros on borders
mT = zeros( Nx+2, Ny+2 );
if length(vT) == Nx*Ny
    for j = 2:Ny+1
        for i = 2:Nx+1
            mT(i,j) = vT(Nx*(j-2)+i-1,1);
        end
    end
else
    error('Nx and Ny are not match to size of vT');
end

