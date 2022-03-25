clear all, close all, clc
N = 100; n = 1; toll = 10^-6; M=1000; w=1.6;

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

L = tril(A);
b = ones(M, 1);
x = rand(M, 1);
xPrev = x;
x = w*(L\((L-A)*xPrev + b)) + (1-w)*xPrev;

while(n<=N & (norm(x - xPrev) > toll))
    xPrev = x;
    x = w*(L\((L-A)*xPrev + b)) + (1-w)*xPrev;
    n = n+1;
end

bRes = A*x;
err = norm(x - xPrev)