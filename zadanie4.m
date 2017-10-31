N = 1000
M = N
d = 100
X = rand(d, N)
Y = rand(d, M)
tic
dsts(X, Y)
toc

N = 10000
X = rand(d, N)
Y = rand(d, M)
tic
dsts(X, Y)
toc
function d = dsts(X, Y)
    n = size(X, 2)
    m = size(Y, 2)
    d = zeros(n, m)
    for i=1:m
        d(:, i) = dsts1(X, Y(:, i))
    end   
end
function med = dsts1(X, y)
    med = arrayfun(@(i) dst(X(:, i), y), 1:size(X, 2))
end
function ed = dst(x, y)
    ed = sqrt(sum(arrayfun(@(i) (x(i) - y(i))^2, 1:size(x))))
end