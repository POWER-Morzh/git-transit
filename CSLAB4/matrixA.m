function [A] = matrixA( Nx, Ny )
%MATRIXA is the function that is calculating and printing the matrix from task (a) on the screen
    if (Nx == 0 || Ny == 0)
        disp('Please, dont use number 0 in size of matrix');
    else
        hx = 1/(Nx+1);
        hy = 1/(Ny+1);
        A = zeros(Nx*Ny,Nx*Ny);

        for i=1:Nx*Ny
            A(i,i) = -2 * (1/hx^2 + 1/hy^2);
            if(i<Nx*Ny && mod(i,Nx))
                A(i,i+1) = 1/hx^2;
                A(i+1,i) = 1/hx^2;
            end
            if(i<Nx*Ny-Nx+1)
                A(i,i+Nx) = 1/hy^2;
                A(i+Nx,i) = 1/hy^2;
            end
%             if(i>Nx)
%                 A(i,i-Nx) = 1/hy^2;
%             end
            
        end
        %disp(A);
    end

end

