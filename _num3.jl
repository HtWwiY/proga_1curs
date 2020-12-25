function num3!(r::Robot) 

    hor = moves!(r, West)
    vert = moves!(r, Sud)
    
    putmarker!(r)
    putmarkers!(r,Ost)
    
    while isborder(r,Nord) == false
        move!(r,Nord)
        putmarker!(r)

        if isborder(r,Ost) == false
            putmarkers!(r, Ost)
        else
            putmarkers!(r, West)
        end
    end
  
    moves!(r, West)
    moves!(r, Sud)

    move_back!(r, Ost, hor)
    move_back!(r, Nord, vert)

end

function move_back!(r::Robot, side::HorizonSide, num_steps::Int)

    for _ in 1:num_steps
        move!(r, side)
    end

end
