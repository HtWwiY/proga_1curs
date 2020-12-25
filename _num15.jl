function num15!(r::Robot)

    hor = 0

    gg = 1
    bb = -1       
                        
    while gg != 0
        if (isborder(r, Sud) == false)
            move!(r, Sud)
            bb += 1
        else
            gg = round!(r, Sud)
            bb += 1
        end
    end

    hor = moves!(r, Ost)

    for i in 0:3 
        putmarkers!(r, HorizonSide(i))
    end

    move_back!(r, West,hor)

    while ((bb! = 0))
        if isborder(r, Nord) == true
            round!(r, Nord)
            bb -= 1
        else
            move!(r, Nord)
            bb -= 1
        end
    end
end

function move_back!(r::Robot, side::HorizonSide, num_steps::Int)

    for _ in 1:num_steps
        move!(r, side)
    end

end