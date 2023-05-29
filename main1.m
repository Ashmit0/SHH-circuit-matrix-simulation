c1 = 1e-7 ; 
l = 1e-5 ; 
t = [ 0.22 , 4.5  ] ; 
n = 10; 

w_ratio = linspace( 0.7 , 1.3 , 1000 ) ; 
z = zeros( length(t) , length( w_ratio )) ; 

for index = 1:length(t)
    c2 = t(1,index)*c1 ; 
    w_resonance = 1/sqrt(l*( c1 + c2 )) ; 
    w = w_resonance * w_ratio ; 

    for index2 = 1:length(w) 
        j = circuit_laplacian( t(1,index) , w(index2) , n );
        % creates the circuit laplacian matrix  
        [ v , d ] = eig( j' * j ) ; 
        
        array = zeros( 1 , n + 1 ); 
        temp = 0 ; 
        for k = 1:n+1
            array(1,k) = d(k , k ) ; 
            if round( d(k,k) , 6 ) == 0 
                temp = k ; 
            end 
        end 
        if length( unique( array )) ~= length( array )
            disp( '** ** ** **');
        end 
        % checkes for degrnerate eigenvalues
        
        temp_matrix = transpose(v) * j * v ; 
        lambda = zeros( 1 , n + 1 ) ; 
        for k = 1:n+1 
            lambda( 1 ,k ) = temp_matrix( k , k ) ; 
        end
        
        r = 0 ; 
        for k = 1:n+1 
            if round( abs( lambda(k) ) , 5) ~= 0  
                r = r + ((v(2,k) - v(n+1,k))^2)/(lambda(k)) ;
            end 
        end 
        z( index , index2 ) = abs( r ) ;
    end 
end 


%% 
wp = [ w_ratio( : , 1 : 499) w_ratio( : , 501:end) ];
p = [ z( : , 1:499 ) , z( : ,501:end) ]; 
set(0, 'DefaultLineLineWidth', 2);
set(groot,'defaulttextinterpreter','latex');  
set(groot, 'defaultAxesTickLabelInterpreter','latex');  
set(groot, 'defaultLegendInterpreter','latex');
% createfigure( wp , p )

plot( wp , p( 1 , : ))
% ylim([10,max( 1.2*p(1,:))])
xlim([ 0.7 , 1.3  ])
hold on 
plot( wp , p( 2 , : ))
% plot( wp , p( 3 , : ))
% plot( wp , p( 4 , : ))

title('impedance frequency responce of the Su-Schriffer- Heeger circuit, N = 10' ...
    , 'FontSize', 18 )
xlabel('$\omega/\tilde{\omega}$' , 'FontSize', 18 )
ylabel('$Z_{SHH}$ ($\Omega$)' , 'FontSize', 18 )
% plot( wp , p( 5 , : ))
% plot( wp , p( 6 , : ))
% plot( wp , p( 7 , : ))
% legend( '$t = 0.1$' , '$t = 0.2$', '$t = 0.3$' , ...
%     '$t = 0.5$', '$t = 1$' , '$t = 2$', '$t = 5$', 'FontSize', 12 )
legend( '$t = 0.22$' , '$t = 4.5$', 'FontSize', 12 )