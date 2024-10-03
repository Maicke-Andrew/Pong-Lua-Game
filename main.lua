require("hotLoad")
require("playersMovement")
require("endCheck")


function love.load()
    -- #Load de imagem das lifes e da font
    heart = love.graphics.newImage("Assets/heart.png")
    font = love.graphics.newFont(50)
    -- #Load de imagem das lifes e da font
    -- #Config da tela
    love.window.setMode(0, 0)
    screen_width = love.graphics.getWidth()
    screen_height = love.graphics.getHeight()
    -- #Config da tela
    -- #Config dos players
    players = {}
    players.firstPlayer = createPlayer(2, screen_height / 2 - 50)
    players.secondPlayer = createPlayer(screen_width - 10, screen_height / 2 - 50)
    -- #Config dos players
    -- #Ball
    ball = { x = screen_width / 2, y = screen_height / 2, speed = 500, xdirection = "+", ydirection = "+" }
    -- #Ball
    -- #Message de derota
    messageMidle = ""
    -- #Message de derota
end

function createPlayer(x, y)
    return { x = x, y = y, width = 8, height = 100, speed = 250, life = 5, win = 0 }
end

function love.update(dt)
    -- #Recarregar ao Salvar
    hotReload()
    -- #Recarregar ao Salvar
    -- #Reset Game
    if love.keyboard.isDown("r") then
        messageMidle = "";
        ball.x = screen_width / 2;
        ball.y = screen_height / 2;
        ball.speed = 500
        players.firstPlayer.y = screen_height / 2;
        players.secondPlayer.y = screen_height / 2;
    end
    -- #Reset Game
    -- #Movimento dos Usuarios
    playerMoves(null, null, "w", "s", players.firstPlayer, dt)
    playerMoves(null, null, "up", "down", players.secondPlayer, dt)
    ballYMove()
    moveBall(ball.xdirection, ball.ydirection, dt)
    -- #Movimento dos Usuarios
    -- #Check colisão
    checkColision(ball, players.firstPlayer, players.secondPlayer)
    -- #Check colisão
    -- #Reset Game
    if players.firstPlayer.life < 1 then
        players.firstPlayer.life = 5;
        players.secondPlayer.life = 5;
        players.secondPlayer.win = players.secondPlayer.win + 1
    elseif players.secondPlayer.life < 1 then
        players.firstPlayer.life = 5;
        players.secondPlayer.life = 5
        players.firstPlayer.win = players.firstPlayer.win + 1
    end

    -- #Reset Game
end

function love.draw()
    -- #Check se tem um perdedor
    checkLose(font)
    -- #Check se tem um perdedor
    -- #Mensagem de derrota
    love.graphics.print(messageMidle, (screen_width / 2 - 170), (screen_height / 2 - 32))
    -- #Mensagem de derrota
    -- #Contagem de Vitoria
    love.graphics.print(players.firstPlayer.win, screen_width / 2 - 200, 10)
    love.graphics.print(players.secondPlayer.win, screen_width / 2 + 200, 10)
    -- #Contagem de Vitoria
    -- #Vidas
    for i = 1, players.firstPlayer.life do
        love.graphics.draw(heart, 20 * (i - 1) * 1.5, 20, 0, 0.2, 0.2)
    end
    for i = 1, players.secondPlayer.life do
        teste = 30 * i
        love.graphics.draw(heart, screen_width - 200 + teste, 20, 0, 0.2, 0.2)
    end
    -- #Vidas
    -- #Bola
    love.graphics.circle("fill", ball.x, ball.y, 7)
    -- #Bola
    -- #Players
    for _, player in pairs(players) do
        love.graphics.rectangle("fill", player.x, player.y, player.width, player.height)
    end
    -- #Players
end
