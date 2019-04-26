--[[
   servo control module
  ]]--
module("servo", package.seeall)
--local servo = {}
    -- module version
    servo.version="0.0.2"

    -- pwm base configuration
    servo.base_frequency=50
    servo.center_duty = 75

    -- print servo module version
    function servo.version()
        print("Servo module version",version)
    end

    -- setup a servo
    function servo.setup(number)
        pwm.setup(number,base_frequency, center_duty)
        pwm.start(number)
    end

    -- set servo position (0 left, 100 right)
    function servo.set(number, percent) 
        value = 50 + percent
        pwm.setduty(number,value)
    end
    
    -- get servo value
    function servo.get(number) 
		local value = pwm.getduty(number) - 50;
		return value
	end	

    -- stop servo pwm
    function servo.stop(number)
        pwm.stop(number)
    end

    -- start servo pwm
    function servo.start(number) 
        pwm.start(number)
    end

--return servo
