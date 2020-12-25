function num2!(r::Robot)

    hor = moves!(r, Ost)
    vert = moves!(r, Sud)

    for i in 0:3 
        putmarkers!(r, HorizonSide(i))
    end

    move_back!(r, West,hor)
    move_back!(r, Nord,vert)

end

function move_back!(r::Robot, side::HorizonSide, num_steps::Int) 

    for _ in 1:num_steps
        move!(r, side)
    end

end
