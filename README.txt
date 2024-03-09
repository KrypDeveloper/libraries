# Documentação da Library para LSU(Lua Scripting Utility)

## Introdução
Esta library foi desenvolvida para facilitar o desenvolvimento de jogos no Roblox, fornecendo uma série de funções úteis para manipular personagens, posições, GUIs e muito mais.

## Uso Básico
Para utilizar esta library, siga os passos abaixo:

1. Faça o carregamento da library no seu script Roblox:

```lua
local LSU = loadstring(game:HttpGet("https://raw.githubusercontent.com/KrypDeveloper/MAXIMUS-LIBRARY/main/Maximus.lua"))()
```

2. Use as funções fornecidas conforme necessário.

## Funções Disponíveis

### LSU.TeleportPlayer(x, y, z)
Teleporta o jogador para as coordenadas especificadas.

- Parâmetros:
  - `x`: Coordenada X
  - `y`: Coordenada Y
  - `z`: Coordenada Z

### LSU.getpos()
Obtém a posição atual do jogador.

- Retorna:
  - Um vetor contendo as coordenadas XYZ da posição atual do jogador.

### LSU.getid()
Obtém o ID do lugar atual.

- Retorna:
  - O ID do lugar atual.

### LSU.TweenTp(x, y, z, speed)
Teleporta suavemente o jogador para as coordenadas especificadas utilizando uma animação de transição.

- Parâmetros:
  - `x`: Coordenada X
  - `y`: Coordenada Y
  - `z`: Coordenada Z
  - `speed`: Velocidade da animação de transição

### LSU.TeleportPlace(id)
Teleporta o jogador para um lugar diferente.

- Parâmetros:
  - `id`: ID do lugar para teleportar o jogador.

### LSU.KillPlayer()
Mata o jogador instantaneamente.

### LSU.Load(link)
Carrega e executa um script externo.

- Parâmetros:
  - `link`: URL do script externo a ser carregado.

### LSU.IY()
Carrega e executa o Infinite Yield, uma poderosa ferramenta de administração.

### LSU.RemoveGui()
Remove todas as GUIs do jogador.

### LSU.SetSpeed(speed)
Define a velocidade de caminhada do jogador.

- Parâmetros:
  - `speed`: Velocidade de caminhada desejada.

### LSU.Anchor(state)
Define se o jogador está ancorado (fixo no lugar) ou não.

- Parâmetros:
  - `state`: `true` para ancorar o jogador, `false` para desancorar.

## Exemplo de Uso

```lua
local LSU = loadstring(game:HttpGet("https://raw.githubusercontent.com/KrypDeveloper/MAXIMUS-LIBRARY/main/Maximus.lua"))()

-- Teleporta o jogador para as coordenadas (10, 20, 30)
LSU.TeleportPlayer(10, 20, 30)

-- Obtém a posição atual do jogador
local currentPosition = LSU.getpos()
print("Posição atual do jogador:", currentPosition)

-- Carrega e executa um script externo
LSU.Load("https://example.com/myscript.lua")
```