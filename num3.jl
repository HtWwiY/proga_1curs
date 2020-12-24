function square_painter!(r::Robot) #Главная функция

    num_vert = moves!(r, Sud)
    num_hor = moves!(r, West)
    
    putmarker!(r)
    putmarkers!(r,Ost)
    
    while isborder(r,Nord)==false
        move!(r,Nord)
        putmarker!(r)

        if isborder(r,Ost)==false
            putmarkers!(r,Ost)
        else
            putmarkers!(r,West)
        end
    end
  
    moves!(r,West)
    moves!(r,Sud)

    move_back!(r,Ost,num_hor)
    move_back!(r,Nord,num_vert)

end

function move_back!(r::Robot,side::HorizonSide,num_steps::Int)

    for _ in 1:num_steps
        move!(r,side)
    end

end
