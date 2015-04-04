require ("mcp3021")

gpio0, gpio2 = 3, 4

mcp3021.setup(gpio2,gpio0,i2c.SLOW)

tmr.alarm(0,1000,1,function()
        local digitalValue = mcp3021.read(3)
        local voltageValue = mcp3021.readV(3)

        if(digitalValue~=nil) then
            print("Digital Value: " .. digitalValue)
        else
            if(digitalValue == mcp3021.ERROR_NAK) then
                print("ERROR: Received NAK from address")
            else -- mcp3021.ERROR_MSB
                print("ERROR: Invalid MSB")
            end
        end

        if(voltageValue~=nil) then
            print("Voltage Value: " .. voltageValue)
        else
            if(voltageValue == mcp3021.ERROR_NAK) then
                print("ERROR: Received NAK from address")
            else -- mcp3021.ERROR_MSB
                print("ERROR: Invalid MSB")
            end
        end

    end
)
