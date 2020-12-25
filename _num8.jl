import HorizonSideRobots.move!

function num8(r::Robot)

    k = 0 
    side = Ost

    while isborder(r ,Nord) == true
        k += 1
        move!(r, side, k)
        side = inverse(side)
    end

end

move!(r,side,num_steps) = for _ in 1:num_steps move!(r, side) end

inverse(side::HorizonSide) = HorizonSide(mod(Int(side) + 2, 4))


