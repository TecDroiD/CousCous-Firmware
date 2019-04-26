--[[ import servo motors ]]--
require ("servos")

servo.version()

servopins = { 3,4,5,6,7,8 }

--[[ initialize servos ]]--
for number,pin in ipairs(servopins)
do
    print("initializing servo ", number, "on pin", pin)
    servo.setup (pin)
end

--[[ create http control interface ]]--
require ("server")
