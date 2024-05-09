local wasinpit = false

local pitentrytime = 0

local pitexittime = 0

local pitstopdone = false

local timeinpit = 0

function script.windowMain()

    ui.text("Time of previous pitstop:")

    local car = ac.getCar(0)

    local inpit = car.isInPitlane

    local enteringpitlane = inpit and not wasinpit

    local exitingpitlane = not inpit and wasinpit

    if enteringpitlane then
        wasinpit = true
        ac.log(wasinpit, os.clock())
        pitentrytime = os.clock()
        pitstopdone = false

    end

    if exitingpitlane then
        wasinpit = false
        ac.log(wasinpit, os.clock())
        pitexittime = os.clock()
        timeinpit = pitexittime - pitentrytime
        ac.log(timeinpit)
        pitstopdone = true
    end

    if pitstopdone == true then
        ui.text(timeinpit.." seconds")
        
    end

end
