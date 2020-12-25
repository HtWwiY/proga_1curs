function mark_perimetr!(r::Robot)

    num_vert=0
    num_hor=0

    ch=1
    b=-1       
                        
    while ch!=0
        if (isborder(r,Sud)==false)
            move!(r, Sud)
            b+=1
        else
            ch=round!(r,Sud)
            b+=1
        end
    end

    num_hor=moves!(r,Ost)

    for i in 0:3 
        putmarkers!(r,HorizonSide(i))
    end

    move_back!(r,West,num_hor)

    while ((b!=0))
        if isborder(r,Nord)==true
            round!(r,Nord)
            b-=1
        else
            move!(r,Nord)
            b-=1
        end
    end
end

function move_back!(r::Robot,side::HorizonSide,num_steps::Int)

    for _ in 1:num_steps
        move!(r,side)
    end

end