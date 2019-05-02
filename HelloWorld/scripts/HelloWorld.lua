--[[----------------------------------------------------------------------------

  Application Name:
  HelloWorld
  
  Summary:
  Introduction to lua scripting. Setting a periodic timer and printing "Hello World".
                                                                              
  Description:
  This script is creating a periodic timer and printing "Hello World from script"
  with an incrementing number on the debug console with every timer expiration.
  
  How to run:
  To demo this script, it must be loaded to any device or the emulator. The output
  can be seen at the console.
  
------------------------------------------------------------------------------]]
--Start of Global Scope---------------------------------------------------------

-- Have a counter for an increasing number inside the timer function
local count = 0

-- Create a periodic timer and register the function "shoutHello" on it
-- The handle needs to be hold so that the timer runs
local tmr = Timer.create()
Timer.setExpirationTime(tmr, 1000)
Timer.setPeriodic(tmr, true)

--End of Global Scope-----------------------------------------------------------

--Start of Function and Event Scope---------------------------------------------

--Declaration of the 'main' function as an entry point for the event loop
--@main()
local function main()
  -- If timer handle is created sucessfully the starting timer
  if tmr then
    Timer.start(tmr)
  else
    print('Could not create the timer')
  end
end
--The following registration is part of the global scope which runs once after startup
--Registration of the 'main' function to the 'Engine.OnStarted' event
Script.register('Engine.OnStarted', main)

local function shoutHello()
  -- print the "Hello World ..." string on the application logger
  count = count + 1
  -- This is just a direct print output useful for debugging purposes
  print('Hello World from script ' .. count)
end
--Registration of the 'shoutHello' function to the timers'OnExpired' event
Timer.register(tmr, 'OnExpired', shoutHello)

--End of Function and Event Scope------------------------------------------------
