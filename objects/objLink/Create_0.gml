mvmtSpeed = 8
gridPeriodLength = 64
walkingAnimationSpeed = .03*room_speed
itemUseAnimationSpeed = .02*room_speed
itemHeldDelayConstant = .5*room_speed
swordBlastSpeed = 10
startingHealth = 6
maxHealthConstant = 12
damageTimerConstant = 2*room_speed
walkTimeConstant = gridPeriodLength / mvmtSpeed

key1 = false
key2 = false
key3 = false
key4 = false

leftButton = vk_left
rightButton = vk_right
upButton = vk_up
downButton = vk_down
useItemButton = vk_space

up = false
down = false
left = false
right = false
moving = false
facingUp = false
facingDown = true
facingLeft = false
facingRight = false
walkTime = 0

death = false
damageTrigger = false
damageTimer = 0
damageColor = c_red
knockedBack = false

barrierCollision = false
inBounds = true
inLeftBound = true
inRightBound = true
inTopBound = true
inBottomBound = true
tilemap = layer_tilemap_get_id("Collision")

itemHeld = 0
itemSwitch = false
itemHeldDelay = 0
usingItem = false
usingItemTrigger = false
usingGadget = false
currentHealth = startingHealth
pauseGame = false
noItemTimer = 0

viewMoving = 0
firstRoomStep = true
changingRooms = 0

cameraX1 = 0
cameraY1 = 0
xValue = 0
yValue = 0

startImageBlend = image_blend