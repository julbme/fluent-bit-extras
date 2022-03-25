-- Print record to stdout
function print(tag, timestamp, record)
   output = tag .. ":  [" .. string.format("%f", timestamp) .. ", { "
 
   for key, val in pairs(record) do
      output = output .. string.format(" %s => %s,", key, val)
   end
    
   output = string.sub(output,1,-2) .. " }]"
   print(output)
 
   -- 0: Nothing changed on the record
   return 0, 0, 0
end
 
-- Drops the record
function drop(tag, timestamp, record)
   -- -1: Drops the record.
   return -1, 0, 0
end