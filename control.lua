--[[ servo control ]]--
require ("servos");
local servopins = { 3,4,5,6,7,8 }

local joints = {"base","shoulder","ellbow", "wrist", "hand", "gripper"}
local buffer = '';

if (file.open("control.html") ) then
	buffer = file.read(4096);
	file.close();
end

-- get movement parameters
for id,name in ipairs(joints) do
	local val = _GET[name]; 
    print (name .. " value " ); 
    pin = servopins[id];
    
	-- and set servo value
	if (val ~= nil) then
        print ("setting new pin " .. pin .." value to " .. val);
		servo.set(pin,val)
	end
	
	buffer = buffer:gsub('_'..name..'_', servo.get(pin));
end

return buffer;
