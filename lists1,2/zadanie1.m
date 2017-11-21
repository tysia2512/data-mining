%%%%%%%%% a %%%%%%%%
dist = makedist('Uniform', 'lower', -1, 'upper', 1)
figure
subplot(2, 2, 1)
nums10k = arrayfun(@(x) (x - 0.5) * 2, rand(1, 10000))
h10k = histogram(nums10k, 100)

subplot(2, 2, 2)
nums100k = arrayfun(@(x) (x - 0.5) * 2, rand(1, 100000))
h100k = histogram(nums100k, 100)

subplot(2, 2, [3 4])
x = -1.02:0.02:1.02
pdfu = pdf(dist, x)
plot(x, pdfu, 'Linewidth', 1)

%%%%%%%%% b %%%%%%%%
figure
subplot(2, 2, 1)
norm10k = normrnd(5, 3, [1, 10000])
h10k = histogram(norm10k, 100)

subplot(2, 2, 2)
norm10k = normrnd(5, 3, [1, 100000])
h10k = histogram(norm10k, 100)

subplot(2, 2, [3 4])
x = -10:0.1:20
pdfu = normpdf(x, 5, 3)
plot(x, pdfu, 'Linewidth', 1)

%%%%%%%%% c %%%%%%%%
figure
x_mu = 2
x_sd = 25
y_mu = 3
y_sd = 1
subplot(2, 2, 1)
xs10k = normrnd(x_mu, x_sd, [1, 10000])
ys10k = normrnd(y_mu, y_sd, [1, 10000])
scatter(xs10k, ys10k, 1, 'filled')

subplot(2, 2, 2)
xs100k = normrnd(x_mu, x_sd, [1, 100000])
ys100k = normrnd(y_mu, y_sd, [1, 100000])
scatter(xs100k, ys100k, 1, 'filled')

subplot(2, 2, [3 4])
x = -200.0:2.0:200.0
y = -10:0.1:10
z = dnorm(x, y, x_mu, x_sd, y_mu, y_sd)
surf(x, y, z)

%%%%%%%%% d %%%%%%%%
p = transpose(cat(1, xs100k, ys100k))
cond = sum(arrayfun(@(i) p(i, 1) > p(i, 2), 1:size(p)))
experimental = cond / size(p, 1)
theoretical = 1 - normcdf(0, x_mu - y_mu, x_sd + y_sd)

%%%%%%%%% c %%%%%%%%
function zs = dnorm(xs, ys, x_mu, x_sd, y_mu, y_sd)
px = transpose(normpdf(xs, x_mu, x_sd))
py = normpdf(ys, y_mu, y_sd)
zs = px * py
end