import HorizonSideRobots.move!

HOR = 0  
VERT = 0                  

function num11!(r::Robot)

    global HOR = 0
    global VERT = 0

    v = 0
    h = 0

    num = 0
    amount_steps = []

    while ((isborder(r, Nord) == false) || (isborder(r, Ost) == false))
        v = moves!(r, Nord)
        VERT += v
        push!(amount_steps, v)

        h=moves!(r, Ost)
        HOR += h

        push!(amount_steps, h)
        num += 2
    end

    gl = moves!(r, West)
    hf = moves!(r, Sud)

    march_mark!(r, Ost, gl - HOR)
    march_mark!(r, Nord, hf - VERT)
    march_mark!(r, West, HOR)
    march_mark!(r, Sud, VERT)

    moves!(r, Ost)
    moves!(r, Nord)

    while (num > 0) == true
        side = isodd(num) ? Sud : West
        move!(r, side, amount_steps[num])
        num -= 1
    end

end

function march_mark!(r::Robot, side::HorizonSide, num::Int)

    move!(r, side, num)
    putmarker!(r)
    moves!(r, side)

end

move!(r, side, amount_steps) = for _ in 1:amount_steps move!(r, side) end
