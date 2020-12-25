function num6!(r::Robot)

    amount_steps = []

    while ((isborder(r, Nord) == false) || (isborder(r, Ost) == false))
        push!(amount_steps, moves!(r, Nord))
        push!(amount_steps, moves!(r, Ost))
    end

    k = moves!(r, West)

    i = 3
    check = 0

    while (check == 0) == true
        move!(r, Sud)
        check = find!(r, HorizonSide(mod(i, 4)), k)
        i += 2
    end

    i -= 2

    while ismarker(r) == false
        if isborder(r, HorizonSide(mod(i, 4))) == true
            putmarker!(r)
            move!(r, HorizonSide(mod(i-1, 4)))
        else
            putmarker!(r)
            move!(r, HorizonSide(mod(i, 4)))
            i += 1
        end
    end

    moves!(r, Nord)
    moves!(r, Ost)

    
   for (j, n) in enumerate(amount_steps)
        side = isodd(j) ? West : Sud
        moves2!(r, side, n)
    end

end

function find!(r::Robot, side::HorizonSide, number::Int)
    h = 0

    for _ in 1:number
        if isborder(r, side) == false
            move!(r, side)
        else
            h = 1
            break
        end
    end

    return h

end

moves2!(r, side, num_steps) = for _ in 1:num_steps move!(r, side) end
