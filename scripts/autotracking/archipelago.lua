CUR_INDEX = -1
SLOT_DATA = nil
LOCAL_ITEMS = {}
GLOBAL_ITEMS = {}

function onClear(slot_data)
    if AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
        print(string.format("called onClear, slot_data:\n%s", dump_table(slot_data)))
    end
    SLOT_DATA = slot_data
    CUR_INDEX = -1
    
    LOCAL_ITEMS = {}
    GLOBAL_ITEMS = {}

    if SLOT_DATA == nil then
        return
    end
    
    if slot_data['type_chart'] then
        print(slot_data['type_chart'])
        local size = 0
        for each in pairs(slot_data['type_chart']) do size = size + 1 end
        if not Tracker.ActiveVariantUID:find('chaos') then
            for i=1,size,1 do
                print(slot_data['type_chart'][i][1] .. " on " .. slot_data['type_chart'][i][2] .. ": " .. tostring(slot_data['type_chart'][i][3]))
                local tatk = string.lower(slot_data['type_chart'][i][1])
                local tdef = string.lower(slot_data['type_chart'][i][2])
                local objstr = string.sub(tatk,1,3) .. string.sub(tdef,1,3)
                print(objstr)
                local obj = Tracker:FindObjectForCode(objstr)
                if obj then
                    effc = slot_data['type_chart'][i][3]
                    if effc == 0 then
                        obj.CurrentStage = 3
                    elseif effc == 10 then
                        obj.CurrentStage = 0
                    elseif effc == 20 then
                        obj.CurrentStage = 2
                    elseif effc == 5 then
                        obj.CurrentStage = 1
                    end
                end
            end
        else
            for i=1,size,1 do
                print(slot_data['type_chart'][i][1] .. " on " .. slot_data['type_chart'][i][2] .. ": " .. tostring(slot_data['type_chart'][i][3]))
                local tatk = string.lower(slot_data['type_chart'][i][1])
                local tdef = string.lower(slot_data['type_chart'][i][2])
                local objstr = string.sub(tatk,1,3) .. string.sub(tdef,1,3)
                print(objstr)
                local obj = Tracker:FindObjectForCode(objstr)
                if obj then
                    obj.CurrentStage = slot_data['type_chart'][i][3]
                end
            end
        end
    end
end

Archipelago:AddClearHandler("clear handler", onClear)