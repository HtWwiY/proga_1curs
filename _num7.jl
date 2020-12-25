function num7!(r::Robot) 

    hor = moves!(r, West)
    vert = moves!(r, Sud)

    chess_row!(r, Ost, 2)                 
    
    while isborder(r, Nord) == false
        move!(r, Nord)

        if isborder(r, Ost) == false
            chess_row!(r, Ost, 2)
        else
            chess_row!(r, West, 2)
        end

    end

    moves!(r, West)
    moves!(r, Sud)

    move_back!(r, Ost, hor)
    move_back!(r, Nord, vert)

end
        
function chess_row!(r::Robot, side::HorizonSide, num::Int)

    amount_steps = 0

    while isborder(r, side) == false
        if mod(amount_steps, 2) == mod(num, 2)
            putmarker!(r)
        end

        move!(r, side)
        amount_steps += 1
    end

    return amount_steps

    amount_steps += 1   
                                     
    if mod(amount_steps, 2) == mod(num, 2)
        putmarker!(r)
    end

end

function move_back!(r::Robot, side::HorizonSide, amount_steps::Int)

    for _ in 1:amount_steps
        move!(r, side)
    end

end
