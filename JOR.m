clear all, close all, clc
N = 1000; n = 1; toll = 10^-6; M=100; w=0.7;

A = zeros(M);
for i=1:M
    A(i,i) = 3;
    if i > 1 
        A(i, i-1) = 1;
    end
    
    if i < M 
        A(i, i+1) = 1;
    end
end
D = diag(diag(A));
b = ones(M, 1);

x = rand(M, 1);
xPrev = x;
x = w*(D\((D-A)*xPrev + b)) + (1-w)*xPrev;

while(n<=N & (norm(x - xPrev) > toll))
    xPrev = x;
    x = w*(D\((D-A)*xPrev + b)) + (1-w)*xPrev;
    n = n+1;
end

bRes = A*x;
err = norm(x - xPrev)
norm(A*x - b)
