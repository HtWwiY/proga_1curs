MARKERS = 0

function num10!(r::Robot)

    global MARKERS = 0

    side = West
    
    t = 0

    while isborder(r, Nord) == false
        t += row!(r, side)
        side = inverse(side)
        move!(r, Nord)
    end  

    t += row!(r ,side)
    s = t / MARKERS

    return s
    
end


function row!(r::Robot, side::HorizonSide)

    temp = 0

    while isborder(r, side) == false
        temp += what_temp(r)
        move!(r, side)
    end

    temp += what_temp(r)

    return temp
    
end

function what_temp(r::Robot)

    global MARKERS

    if ismarker == true
        MARKERS += 1
        return temperature(r)
    else
        return 0
    end

end

inverse(side::HorizonSide) = HorizonSide(mod(Int(side) + 2, 4))