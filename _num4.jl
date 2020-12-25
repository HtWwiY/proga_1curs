function num4!(r::Robot)

    hor = moves!(r, West)
    vert = moves!(r, Sud)

    putmarker!(r)

    t=putmarker_count!(r, Ost)
    

    for i in 1:t
        if isborder(r, Nord) == false
            if isborder(r, West) == false
                move!(r, West)
                move!(r, Nord)
                putmarker!(r)
                putmarkers!(r, West)
            else
                move!(r, Nord)
                putmarker!(r)
                moves_marker!(r, Ost, t-i)
            end
        end
    end

    moves!(r, West)
    moves!(r, Sud)

    move_back!(r, Ost, hor)
    move_back!(r, Nord, vert)

end

function moves_marker!(r::Robot, side::HorizonSide, number::Int)

    for _ in 1:number
        move!(r, side)
        putmarker!(r)
    end

end

function putmarker_count!(r::Robot, side::HorizonSide)

    number = 0

    while isborder(r,side) == false
        move!(r, side)
        putmarker!(r)
        number += 1
    end

    return number

end
