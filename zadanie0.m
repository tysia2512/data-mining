a = 1:100
b = linspace(1, 99, 50)
c = linspace(-1.0, 1.0, 201)
c = arrayfun(@(x) x * pi, c)
d = cat(2, linspace(-1.0, -0.01, 100), linspace(0.01, 1.0, 100))
d = arrayfun(@(x) x * pi, d)
e = arrayfun(@(x) mysin(x), linspace(1, 100, 100))

A = reshape((1:100), [10, 10])
B = zeros(100)
B = B + diag((1:100))
B = B + diag(linspace(99, 1, 99), 1) + diag(linspace(99, 1, 99), -1)
C = triu(ones(100))
D = cat(1, arrayfun(@(x) sum_up_to(x), (1:10)), arrayfun(@(x) factorial(x), (1:10)))
% D(1, :) = (1:10)
size = 10
E = zeros(size, size)
for i = 1:size
    for j = 1:size
        if (mod(j, i) == 0)
            E(i, j) = 1
        end
    end
end
function s = sum_up_to(x)
s = x * (x + 1) / 2
end
function my_sin = mysin(x)
if sin(x) > 0
    my_sin = sin(x)
else
    my_sin = 0
end
end
