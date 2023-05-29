function [j] = circuit_laplacian( t  ,  w , n )
c1 = 1e-7 ; 
c2 = t*c1 ; 
l = 1e-5 ; 

j = zeros( n + 1 , n + 1 ) ; 

for i = 2:n+1 
    j( 1 , i ) = -1/( 1j*w*l ) ; 
end
j( 1 ,2 ) = j( 1 , 2 ) - 1j*c1*w ; 

for i = 2:n
    j( i , 1 ) = -1/( 1j*w*l ) ;
    if mod( i , 2 ) == 0 
        j( i , i +1 ) = -1j*c2*w ; 
        j( i , i -1 ) = j( i , i -1 ) - 1j*c1*w ; 
    else 
        j( i , i -1 ) = -1j*c2*w ; 
        j( i , i +1 ) = -1j*c1*w ; 
    end
end 
j( n+1, 1 ) = -1/(1j*w*l); 
j( n+1, n ) = -1j*c2*w ; 

for i = 1:n+1
    j(i , i ) = -sum( j( i , : )) ; 
end

end