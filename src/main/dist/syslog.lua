-- SYSLOG_FACILITIES:
-- The index of the array is the facility number.
-- The value is the logical code of the facility.
SYSLOG_FACILITIES = {
    [0] = "kern",
    [1] = "user",
    [2] = "mail",
    [3] = "daemon",
    [4] = "auth",
    [5] = "syslog",
    [6] = "lpr",
    [7] = "news",
    [8] = "uucp",
    [9] = "cron",
    [10] = "auth2",
    [11] = "ftp",
    [12] = "ntp",
    [13] = "audit",
    [14] = "alert",
    [15] = "cron2",
    [16] = "local0",
    [17] = "local1",
    [18] = "local2",
    [19] = "local3",
    [20] = "local4",
    [21] = "local5",
    [22] = "local6",
    [23] = "local7"
}

-- SYSLOG_SEVERITIES:
-- The index of the array is the severity number.
-- The value of the array is the logical code of the severity.
SYSLOG_SEVERITIES = {
    [0] = "emerg",
    [1] = "alert",
    [2] = "crit",
    [3] = "err",
    [4] = "warning",
    [5] = "notice",
    [6] = "info",
    [7] = "debug"
}

-- Process "pri" field in the record
-- Add the facility and severity number/codes in the record.
function compute_priority(tag, timestamp, record)
    -- Copy the current record to the new record
    new_record = record

    -- Record should contain syslog priority
    if record["pri"] ~= nil then

        -- In syslog, priority = facility * 8 + severity
        local priority = tonumber(record["pri"])
        local facility = math.floor(priority / 8)
        local severity = math.fmod(priority, 8)

        -- Alter record.
        new_record["syslogPriorityNumber"] = priority
        new_record["syslogFacilityNumber"] = facility
        new_record["syslogFacilityCode"] = SYSLOG_FACILITIES[facility]
        new_record["syslogSeverityNumber"] = severity
        new_record["syslogSeverityCode"] = SYSLOG_SEVERITIES[severity]

    end

    -- 2: Alter record, but not the timestamp.
    return 2, 0, new_record
end