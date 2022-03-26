format rational

n = 4;


A = [1 1 1 1; 1 2 3 4; 1 3 6 10; 1 4 10 20];
P = eye(n, n);
L = eye(n, n);


for j=1:n-1 % diagonal

    val = 0;
    for i=j:n
    	if abs (A(i,j))>val
            val = abs (A(i,j));
            imax = i;
        end
    end
    %
    indx = imax ;

    fprintf('IDX: %i -- VAL: %i\n', indx, val)
    if indx > j
        P([j indx], :) = P([indx j], :);
        L([j indx], 1:j-1) = L([indx j], 1:j-1); %scambio solo moltiplicatori
        A([j indx], :) = A([indx j], :);
    end

    fprintf('PRINT --- %i\n', j)
    A
    L
    P
    fprintf('A(j,j) = %i\n', A(j,j))


    for i= j+1:n % row
        
        L(i,j) = A(i,j)/A(j,j); % moltiplicatore
        A(i,j) = 0; % mettiamo 0 sotto la matrice
        
        for k = j+1:n % column
            A(i, k) = A(i, k) - (L(i, j) * A(j, k));
              
        end
    end 

end

U = A
