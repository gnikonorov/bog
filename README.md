# bog

`Bog` is a lightweight logging solution for bash scripts.

## Overview

```
source 'bog.sh'

bog_log_debug   "This is a debug message"
bog_log_info    "This is an info message"
bog_log_warning "This is a warning message"
bog_log_error   "This is an error message"
bog_log_fatal   "This is a fatal message"
```

```
$ ./test.sh
DEBUG: Sun Oct 21 16:14:39 EDT 2018 - This is a debug message
INFO: Sun Oct 21 16:14:39 EDT 2018 - This is an info message
WARNING: Sun Oct 21 16:14:39 EDT 2018 - This is a warning message
ERROR: Sun Oct 21 16:14:39 EDT 2018 - This is an error message
FATAL: Sun Oct 21 16:14:39 EDT 2018 - This is a fatal message
$
```
`Bog` is easy to include in your shell scripts. Just source `bog.sh`.

### Logging levels

Bog implements the following logging levels:
* DEBUG
* INFO
* WARNING
* ERROR
* FATAL

### Logging modes

Bog allows logging modes:
* To set the mode: `bog_set_log_mode $BOG_LOG_TO_FILE`.
* The following modes are supported:
  * `$BOG_LOG_TO_STDOUT_STDERR`: Logs output to `STDOUT`/`STDERR`
    * In this mode `DEBUG`, `INFO`, and `WARNING` messages will go to `STDOUT` and `ERROR` and `FATAL` messages will go to `STDERR`
  * `$BOG_LOG_TO_FILE`: Logs output to a file
  * `$BOG_LOG_TO_BOTH`: Logs output to `STDOUT`/`STDERR`, and also to a file

### Log file names

Bog allows you to specify the name of a file to write to. To specify a filename:
* `bog_set_log_file "my_log_file.log"`

By default, the file used is `bog.log`. Do not use this function to specify a log file path. If you would like to specify a path, please see the `Log directory` section directly below.

### Log directory

Bog allows you to specify the directory in which to store logs. If you do not specify a value, `.` ( the current directory ) is used. You may specify any valid folder structure the process will have write access to.

A flag may be passed to indicate you wish to create any necessary folders. By default, no folders are created.

To specify a log directory and not create any folders:
* `bog_set_log_directory "/dir/not/created/if/dne" 0`
* `bog_set_log_directory "/dir/not/created/if/dne"`

To specify a log directory and create all needed subfolders:
* `bog_set_log_directory "/dir/created/if/dne" 1`
* `bog_set_log_directory "/dir/created/if/dne" peat`
* `bog_set_log_directory "/dir/created/if/dne" marsh`

### Log entry format

Bog log entries are of form `<LEVEL>: <TIME> - <MESSAGE>`. For example:
```
DEBUG: Sun Oct 21 16:14:39 EDT 2018 - This is a debug message
```

The timestamp is taken from running `date`, and you can specify the timestamp by providing a `date` compatable format string. For example:
```
bog_set_timestamp_format '%T'
bog_log_debug "This is a debug message"
```

Would yield:
```
DEBUG: 16:28:12 - This is a debug message
```
