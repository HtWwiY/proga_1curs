X = 0
Y = 0

include("_num7.jl")

function num12!(r::Robot ,n::Int)

    hor = moves!(r, West)
    vert = moves!(r, Sud)

    global X = 0
    global Y = 0

    k = 0
    bb = 0

    while isborder(r, Nord) == false
        if mod(div(Y, n), 2) == mod(k, 2)
            up!(r, Ost, n, bb)
            moves!(r, West)
            move!(r, Nord)

            X = 0
            Y += 1
        else
            k += 1
            bb = mod(bb  +1, 2)
        end
    end

    if mod(div(Y, n), 2) == mod(k, 2)               
        up!(r, Ost, n, bb)
    else
        up!(r, Ost, n, mod(bb+1, 2))
    end

    moves!(r, West)
    moves!(r, Sud)

    move_back!(r, Ost, hor)
    move_back!(r, Nord, vert)
end

function up!(r::Robot, side::HorizonSide, n::Int, num::Int) 

    global X
    
    while isborder(r, side) == false           
        if mod(div(X, n), 2) == mod(num, 2)         
            putmarker!(r)
        end
        X += 1
        move!(r, side)
    end

    if mod(div(X, n), 2) == mod(num, 2)
        putmarker!(r)
    end

end
