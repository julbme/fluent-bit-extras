-- Adds the current tag to the record.
function add_to_record(tag, timestamp, record)
    -- Add tag to the record
    new_record = record
    new_record["tag"] = tag

    -- 2: Alter record, but not the timestamp.
    return 2, 0, new_record
 end