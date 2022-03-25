N = 1000, n = 1, toll = 10^-6;;

A = [3 1 0 0 0; 1 3 1 0 0; 0 1 3 1 0; 0 0 1 3 1; 0 0 0 1 3];
D = diag(diag(A));
b = [1; 1; 1; 1; 1];

x = rand(5, 1)
xPrev = x;
x = D\(D-A)*xPrev + D\b;

while(n<=N & (norm(x - xPrev) > toll))
    xPrev = x;
    x = D\(D-A)*xPrev + D\b;
    n = n+1;
end

A*x

