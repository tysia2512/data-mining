n = 10000
changing = 0
staying = 0

for i=1:n
    s = play(1)
    if s
        changing = changing + 1
    end
end
for i=1:n
    s = play(0)
    if s
        staying = staying + 1
    end
end

changeP = changing / n
stayP = staying / n

function isSuccess = play(change)
    award = randi([1 3])
    chosen = randi([1 3])
    shown = 0
    if chosen == award
        shift = randi([1 2])
        shown = mod(chosen + shift, 3) + 1
    else shown = bitxor(chosen, award)
    end
    if change == 1
        isSuccess = (chosen == award)
    else
        isSuccess = not(chosen == award)
    end
end