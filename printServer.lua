op = require("component").openprinter
fs = require("filesystem")
local cName = "Unknown"
local lines = {}
local lineCount = 0
local printServer = {}
function printServer.setName(n)
    cName = n
end
function printServer.addLine(s)
    lineCount = lineCount + 1
    lines[lineCount] = s
end
function printServer.setTitle(t)
    op.setTitle(t)
end
function printServer.printPage()
    cCount = 0
    for x = 1,lineCount do
        -- totalPages = lineCount / 18
        cPage = 1
        cCount = cCount + 1
        if(cCount > 18) then
            cCount = 0
            op.writeln("Printed by: " .. cName .. "Pg " .. cPage)
            op.print()
            cPage = cPage + 1
        else
            cCount = cCount + 1
            op.writeln(lines[x])
        end
    end
    op.writeln("Printed by: " .. cName .. "Pg " .. cPage)
    op.print()


    print("Printing Page")
end
function printServer.getBlackInkLevel()
    return op.getBlackInkLevel()
end
function printServer.getColorInkLevel()
    return op.getColorInkLevel()
end
function printServer.getPaperLevel()
    return op.getPaperLevel()
end

return printServer
