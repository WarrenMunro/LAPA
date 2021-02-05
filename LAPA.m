
V = zeros(100);
%initial conditions
V(:,1) = 1;

for n = 1:200
    for i = 1:100
        for j = 2:99
            if i == 1
                %V(i,j) = (V(i+1,j)+V(i,j+1)+V(i,j-1))/3;
                V(i,j) = 0;
            elseif i == 100
                %V(i,j) = (V(i-1,j)+V(i,j+1)+V(i,j-1))/3;
                V(i,j) = 0;
            else
                V(i,j) = (V(i+1,j)+V(i-1,j)+V(i,j+1)+V(i,j-1))/4;
            end
        end
    end
    figure(1)
    subplot(3,1,1)
    surf(V)
    
    subplot(3,1,2)
    [Ex, Ey] = gradient(V);
    quiver(Ex, Ey)
    
    subplot(3,1,3)
    surf(imboxfilt(V,3))
    
    pause(0.1)
end

