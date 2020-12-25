function num5(r)

    amount_steps = []

    while ((isborder(r, Sud) == false) || (isborder(r, West) == false))
        push!(amount_steps, moves!(r, West))
        push!(amount_steps, moves!(r, Sud))
    end

    for side in (Nord, Ost, Sud, West)
        moves!(r, side)
        putmarker!(r)
    end

    for (i, n) in enumerate(amount_steps)
        side = isodd(i) ? Ost : Nord
        moves!(r, side, n)
    end

end
    
function moves!(r, side)

    amount_steps = 0

    while isborder(r, side) == false
	move!(r, side)
	    amount_steps += 1
	end

    return amount_steps

end
    
moves!(r, side, amount_steps) = for _ in 1:amount_steps move!(r, side) end
 
inverse(side::HorizonSide) = HorizonSide(mod(Int(side) + 3, 4))
