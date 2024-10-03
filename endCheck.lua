function checkColision(ball, playerOne, playerTwo)
    playerTwoEnd = playerTwo.y + playerTwo.height;
    playerOneEnd = playerOne.y + playerOne.height;

    if ball.x > playerTwo.x and ball.x < playerTwo.x + 10 and ball.y > playerTwo.y and ball.y < playerTwoEnd then
        ball.xdirection = "-"
    end

    if ball.x > playerOne.x and ball.x < playerOne.x + 10 and ball.y > playerOne.y and ball.y < playerOneEnd then
        ball.xdirection = "+"
    end
end

function checkLose()
    love.graphics.setFont(font)
    if ball.x >= screen_width then
        messageMidle = "Player 2 Lose"
        players.secondPlayer.life = players.secondPlayer.life - 1
        ball.x = screen_width / 2
        ball.y = screen_height / 2
        ball.speed = 0
    elseif ball.x <= 0 then
        messageMidle = "Player 1 Lose"
        players.firstPlayer.life = players.firstPlayer.life - 1
        ball.x = screen_width / 2
        ball.y = screen_height / 2
        ball.speed = 0
    end
end
