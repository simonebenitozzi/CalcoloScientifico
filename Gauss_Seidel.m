clear all, close all, clc
N = 10000; n = 1; toll = 10^-6; M=1000;

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
x = inv(L)*((L-A)*xPrev + b);

while(n<=N & (norm(x - xPrev) > toll))
    xPrev = x;
    x = inv(L)*((L-A)*xPrev + b);
    n = n+1;
end

bRes = A*x;
tf = isequal(b, bRes);
err = norm(x - xPrev)