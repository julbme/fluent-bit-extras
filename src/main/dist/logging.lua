-- LOGGING_LEVEL_MAPPINGS:
-- The index of the array is the original level.
-- The value of the array is the new level.
LOGGING_LEVEL_MAPPINGS = {
    ["fatal"] = "error",
    ["emerg"] = "error",
    ["emergency"] = "error",
    ["alert"] = "error",
    ["crit"] = "error",
    ["err"] = "error",
    ["warning"] = "warn",
    ["notice"] = "info"
}

-- Process the record and determine appropriate level alert.
function compute_level(tag, timestamp, record)
    -- Create a variable for the level
    local new_level = nil

    -- If the record is already having a level, get and lowercase it
    -- Otherwise, set the default to info.
    if record["level"] ~= nil then
        new_level = string.lower(record["level"])
    else
        new_level = "info"
    end

    -- Map level to a new one if needed.
    if LOGGING_LEVEL_MAPPINGS[new_level] ~= nil then
        new_level = LOGGING_LEVEL_MAPPINGS[new_level]
    end

    -- Copy initial record, and add level
    new_record = record
    new_record["level"] = new_level
    
    -- 2: Alter record, but not the timestamp.
    return 2, 0, new_record
end