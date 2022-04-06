# fluent-bit-extras

This repository provides some extra parsers and lua scripts to be used in [fluent-bit](https://fluentbit.io/).

## Parsers

- `json_iso8601`: the JSON parser configured to parse time in ISO8601 format.

## LUA scripts

### logging.lua

|  Function name  |                                                                      Description                                                                      |
|-----------------|-------------------------------------------------------------------------------------------------------------------------------------------------------|
| `compute_level` | This method map log levels to the ones in [`error`, `warning`, `info`, `debug`, `trace`] or set it to `info` if `level` is not present in the record. |

### record.lua

| Function name |                           Description                           |
|---------------|-----------------------------------------------------------------|
| `print`       | This method prints the record on stdout without any alteration. |
| `drop`        | This method drops the record.                                   |

### syslog.lua

|   Function name    |                                                                                         Description                                                                                          |
|--------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `compute_priority` | Gets the priority from the message (`pri`) and adds in the record the `syslogPriorityNumber`; `syslogFacilityNumber`, `syslogFacilityCode`, `syslogSeverityNumber` and `syslogSeverityCode`. |

Where:

- `syslogPriorityNumber`: is the priority value (as number)
- `syslogFacilityNumber`: is the facility number value
- `syslogFacilityCode`: is the facility name (`local0`, `local1`, `kern`, ...)
- `syslogSeverityNumber`: is the severity number
- `syslogSeverityCode`: is the severity name (`alert`, `emerg`, `crit`, ...)

### tag.lua

|  Function name  |            Description             |
|-----------------|------------------------------------|
| `add_to_record` | Add the current tag in the record. |

