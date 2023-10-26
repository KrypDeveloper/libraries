local GPTLibrary = {}

-- Função para criar uma janela arrastável
function GPTLibrary.CreateWindow(title)
    local window = Instance.new("ScreenGui")
    window.Name = title
    window.Parent = game.CoreGui

    -- Aqui você pode personalizar a janela com frames, botões, etc.
    -- Exemplo: local frame = Instance.new("Frame")
    -- frame.Parent = window
    -- frame.Size = UDim2.new(0, 200, 0, 100)
    -- frame.Position = UDim2.new(0, 10, 0, 10)

    return window
end

-- Função para criar um botão na janela
function GPTLibrary.CreateButton(window, buttonName)
    local button = Instance.new("TextButton")
    button.Name = buttonName
    button.Text = buttonName
    button.Parent = window

    -- Aqui você pode personalizar o botão, como definir seu tamanho, posição e eventos de clique.

    return button
end

return GPTLibrary
