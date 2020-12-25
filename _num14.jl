function num14!(r::Robot)

    i = 0
    bb = 0
    t = 1

    while i < 4
        if  (t == 1)
            if (isborder(r, HorizonSide(i)) == true) 
                t=round!(r, HorizonSide(i))
                putmarker!(r)
                bb += 1
            else
                putmarkers!(r, HorizonSide(i))
                bb += 1
            end
        else
            move_by_markers!(r, inverse(HorizonSide(i)))
            i += 1
            t = 1
        end
    end

    putmarker!(r)

end

function putmarkers!(r::Robot, side::HorizonSide)

    if  isborder(r, side) == false
        move!(r, side)
        putmarker!(r)
    end

end

function round!(r::Robot, side::HorizonSide)

    x = 0
    gg = 1

    while isborder(r, side) == true
        if isborder(r, next(side)) == true
            gg = 0
            break
        end
        move!(r, next(side))
        x += 1
    end

    if (gg! = 0)
        move!(r, side)
        while isborder(r, prev(side)) == true
            move!(r ,side)
        end
        move!(r, prev(side))
        moves!(r, prev(side), x-1)
    else
        moves!(r, prev(side), x)
    end

    return gg

end

function move_by_markers!(r::Robot, side::HorizonSide)

    x = 0

    while ismarker(r) == true
        if isborder(r, side) == true
            round!(r, side)
            x += 1
        else
            move!(r, side)
            x += 1
        end
        if (x > 19)
            break
        end
    end

end

prev(side::HorizonSide) = HorizonSide(mod(Int(side) - 1, 4))