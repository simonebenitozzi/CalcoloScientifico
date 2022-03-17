n = 5;
A = rand(n)*10;
b = rand(n, 1)*10;
P = eye(n);
L = eye(n);
for j=1:n-1
    [~, indx] = max(abs(A(:,j)));
    Pj = eye(n);
    Pj([j indx], :) = Pj([indx j], :);
    
    A = Pj * A;
    P = Pj * P;
    
    
    Lt = eye(n);
    Lt(j+i:n,j) = -(A(j+i:n,j)/A(j,j));
    
    A = Lt * A;
    L = L*(Lt\Pj);
    
end

U=A;
L=P*L

y = L\(P*b);
x = U\y;


A*x
b
