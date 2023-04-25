
--Start of Global Scope---------------------------------------------------------

-- Prepare a counter for an increasing number inside the Timer function
local count = 0

-- Create a periodic Timer and register the function "shoutHello" on it
-- The handle needs to be hold so that the Timer runs
local tmr = Timer.create()
Timer.setExpirationTime(tmr, 1000)
Timer.setPeriodic(tmr, true)

--End of Global Scope-----------------------------------------------------------

--Start of Function and Event Scope---------------------------------------------

--Declaration of the 'main' function as an entry point for the event loop
local function main()
  -- If timer handle is created sucessfully the starting Timer
  if tmr then
    Timer.start(tmr)
  else
    print('Could not create the Timer')
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
--Registration of the 'shoutHello' function to the Timers'OnExpired' event
Timer.register(tmr, 'OnExpired', shoutHello)

--End of Function and Event Scope------------------------------------------------
