function playerMoves(leftKey, rightKey, upKey, downKey, player, dt)
    if leftKey then
        if love.keyboard.isDown(leftKey) then
            player.x = player.x - player.speed * dt;
        end
    end

    if rightKey then
        if love.keyboard.isDown(rightKey) then
            player.x = player.x + player.speed * dt;
        end
    end

    if upKey then
        if love.keyboard.isDown(upKey) then
            if player.y > 40 then
                player.y = player.y - player.speed * dt;
            end
        end
    end

    if downKey then
        if love.keyboard.isDown(downKey) then
            if player.y < (screen_height - 100) then
                player.y = player.y + player.speed * dt;
            end
        end
    end
end

function moveBall(xdirection, ydirection, dt)
    if xdirection == "+" then
        ball.x = ball.x + ball.speed * dt
    elseif xdirection == "-" then
        ball.x = ball.x - ball.speed * dt
    end

    if ydirection == "+" then
        ball.y = ball.y + ball.speed * dt
    elseif ydirection == "-" then
        ball.y = ball.y - ball.speed * dt
    end
end

function ballYMove()
    -- #Altera o y se está indo para cima ou para baixo
    if ball.y >= (screen_height - 5) then
        ball.ydirection = "-"
    elseif ball.y <= 40 then
        ball.ydirection = "+"
    end
    -- #Altera o y se está indo para cima ou para baixo
end
