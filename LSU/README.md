# DOCUMENTAÇÃO DA LSU OFICIAL

## Importar
```lua
local LSU = loadstring(game:HttpGet("https://raw.githubusercontent.com/KrypDeveloper/MAXIMUS-LIBRARY/main/LSU/LSU.lua")()
```
## Teleportar Jogador
```lua
LSU.TeleporPlayer({
X = 15, --cordenada X aqui
Y = 20, --cordenada Y aqui
Z = 30 --coordenada Z aqui
})
```
## Teleporte Tween
```lua
LSU.TweenTp({
X = 15, --coordenada X
Y = 20, --coordenada Y
Z = 30, --coordenada Z
time = 5 --tempo para chegar no local
})
```
## Teleporte por ID
```lua
LSU.TeleportId(123456)
```
## Matar Jogador
```lua
LSU.suicide()
```
## Alterar Propriedades do jogador
```lua
LSU.SetPlayer({
Health = 100,
WalkSpeed = 100,
JumpPower = 500
})
```
## NOCLIP
```
LSU.noclip(true) --coloque true para ativar e false para desativar
```
## Executar multiplas instancias de uma vez
```lua
LSU.Execute({
elemento1 = game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
```
