#!/bin/bash
#
# Logging framework for BASH scripts. Source this script to use BOG.
#
# By default, output will go to STDOUT and STDERR streams as follows:
#   debug, info and warning will go to STDOUT
#   error and fatal will go to STDERR
#
# Logging may be specified to go to STDOUT/STDERR, a file, or both.
# By default, logging will go to STDOUT/STDERR
#
# The following parameters may be configured:
#   The log file to write to
#   The log mode
#   The time format of log entries. Note that the provided format must be compatable with the `date` command

# BOG logging modes
BOG_LOG_TO_STDOUT_STDERR=1
BOG_LOG_TO_FILE=2
BOG_LOG_TO_BOTH=3
BOG_LOG_MODE=0

# BOG log file
BOG_LOG_DEFAULT_LOG_FILE='bog.log'
BOG_LOG_FILE=''

# The date format used by log entries
BOG_LOG_DATE_FORMAT=''
BOG_LOG_DATE_FORMAT_UNSET='UNSET'

# Return codes
BOG_LOG_OK=0
BOG_LOG_INVALID_LOG_MODE=1

################################################################
# Logs the provided message 'log_message' as a debug message.
#
# Globals:
#   BOG_LOG_FILE
#   BOG_LOG_MODE
#   BOG_LOG_TO_BOTH
#   BOG_LOG_TO_FILE
#   BOG_LOG_TO_STDOUT_STDERR
# Arguments:
#   log_message: The message to log
# Returns:
#   None
################################################################
function bog_log_debug() {
    local log_message="$1"
    local output_string

    local timestamp
    if [ "$BOG_LOG_DATE_FORMAT" == "$BOG_LOG_DATE_FORMAT_UNSET" ]; then
        timestamp="$(date)"
    else
        timestamp=$(date +\'${BOG_LOG_DATE_FORMAT}\')
    fi

    output_string="DEBUG: ${timestamp} - ${log_message}"
    if [[ $BOG_LOG_MODE == "$BOG_LOG_TO_STDOUT_STDERR" ]] || [[ $BOG_LOG_MODE == "$BOG_LOG_TO_BOTH" ]]; then
        echo -e "$output_string"
    fi

    if [[ $BOG_LOG_MODE == "$BOG_LOG_TO_FILE" ]] || [[ $BOG_LOG_MODE == "$BOG_LOG_TO_BOTH" ]]; then
        echo -e "$output_string" >> "$BOG_LOG_FILE"
    fi
}

################################################################
# Logs the provided message 'log_message' as an info message.
#
# Globals:
#   BOG_LOG_FILE
#   BOG_LOG_MODE
#   BOG_LOG_TO_BOTH
#   BOG_LOG_TO_FILE
#   BOG_LOG_TO_STDOUT_STDERR
# Arguments:
#   log_message: The message to log
# Returns:
#   None
################################################################
function bog_log_info() {
    local log_message="$1"
    local output_string

    local timestamp
    if [ "$BOG_LOG_DATE_FORMAT" == "$BOG_LOG_DATE_FORMAT_UNSET" ]; then
        timestamp="$(date)"
    else
        timestamp=$(date +\'${BOG_LOG_DATE_FORMAT}\')
    fi

    output_string="INFO: ${timestamp} - ${log_message}"
    if [[ $BOG_LOG_MODE == "$BOG_LOG_TO_STDOUT_STDERR" ]] || [[ $BOG_LOG_MODE == "$BOG_LOG_TO_BOTH" ]]; then
        echo -e "$output_string"
    fi

    if [[ $BOG_LOG_MODE == "$BOG_LOG_TO_FILE" ]] || [[ $BOG_LOG_MODE == "$BOG_LOG_TO_BOTH" ]]; then
        echo -e "$output_string" >> "$BOG_LOG_FILE"
    fi
}

################################################################
# Logs the provided message 'log_message' as a warning message.
#
# Globals:
#   BOG_LOG_FILE
#   BOG_LOG_MODE
#   BOG_LOG_TO_BOTH
#   BOG_LOG_TO_FILE
#   BOG_LOG_TO_STDOUT_STDERR
# Arguments:
#   log_message: The message to log
# Returns:
#   None
################################################################
function bog_log_warning() {
    local log_message="$1"
    local output_string

    local timestamp
    if [ "$BOG_LOG_DATE_FORMAT" == "$BOG_LOG_DATE_FORMAT_UNSET" ]; then
        timestamp="$(date)"
    else
        timestamp=$(date +\'${BOG_LOG_DATE_FORMAT}\')
    fi

    output_string="WARNING: ${timestamp} - ${log_message}"
    if [[ $BOG_LOG_MODE == "$BOG_LOG_TO_STDOUT_STDERR" ]] || [[ $BOG_LOG_MODE == "$BOG_LOG_TO_BOTH" ]]; then
        echo -e "$output_string"
    fi

    if [[ $BOG_LOG_MODE == "$BOG_LOG_TO_FILE" ]] || [[ $BOG_LOG_MODE == "$BOG_LOG_TO_BOTH" ]]; then
        echo -e "$output_string" >> "$BOG_LOG_FILE"
    fi
}

################################################################
# Logs the provided message 'log_message' as an error message.
#
# Globals:
#   BOG_LOG_FILE
#   BOG_LOG_MODE
#   BOG_LOG_TO_BOTH
#   BOG_LOG_TO_FILE
#   BOG_LOG_TO_STDOUT_STDERR
# Arguments:
#   log_message: The message to log
# Returns:
#   None
################################################################
function bog_log_error() {
    local log_message="$1"
    local output_string

    local timestamp
    if [ "$BOG_LOG_DATE_FORMAT" == "$BOG_LOG_DATE_FORMAT_UNSET" ]; then
        timestamp="$(date)"
    else
        timestamp=$(date +\'${BOG_LOG_DATE_FORMAT}\')
    fi

    output_string="ERROR: ${timestamp} - ${log_message}"
    if [[ $BOG_LOG_MODE == "$BOG_LOG_TO_STDOUT_STDERR" ]] || [[ $BOG_LOG_MODE == "$BOG_LOG_TO_BOTH" ]]; then
        >&2 echo -e "$output_string"
    fi

    if [[ $BOG_LOG_MODE == "$BOG_LOG_TO_FILE" ]] || [[ $BOG_LOG_MODE == "$BOG_LOG_TO_BOTH" ]]; then
        echo -e "$output_string" >> "$BOG_LOG_FILE"
    fi
}

################################################################
# Logs the provided message 'log_message' as a fatal message.
#
# Globals:
#   BOG_LOG_FILE
#   BOG_LOG_MODE
#   BOG_LOG_TO_BOTH
#   BOG_LOG_TO_FILE
#   BOG_LOG_TO_STDOUT_STDERR
# Arguments:
#   log_message: The message to log
# Returns:
#   None
################################################################
function bog_log_fatal() {
    local log_message="$1"
    local output_string

    local timestamp
    if [ "$BOG_LOG_DATE_FORMAT" == "$BOG_LOG_DATE_FORMAT_UNSET" ]; then
        timestamp="$(date)"
    else
        timestamp=$(date +\'${BOG_LOG_DATE_FORMAT}\')
    fi

    output_string="FATAL: ${timestamp} - ${log_message}"
    if [[ $BOG_LOG_MODE == "$BOG_LOG_TO_STDOUT_STDERR" ]] || [[ $BOG_LOG_MODE == "$BOG_LOG_TO_BOTH" ]]; then
        >&2 echo -e "$output_string"
    fi

    if [[ $BOG_LOG_MODE == "$BOG_LOG_TO_FILE" ]] || [[ $BOG_LOG_MODE == "$BOG_LOG_TO_BOTH" ]]; then
        echo -e "$output_string" >> "$BOG_LOG_FILE"
    fi
}

###########################################################################
# Sets the mode of the logger.
#
# Globals:
#   BOG_LOG_MODE
#   BOG_LOG_TO_BOTH
#   BOG_LOG_TO_FILE
#   BOG_LOG_TO_STDOUT_STDERR
# Arguments:
#   log_mode: The mode to log in
# Returns:
#   A status code indicating wether the log setting mode was successful.
###########################################################################
function bog_set_log_mode() {
    local new_log_mode="$1"

    local valid_log_modes=($BOG_LOG_TO_STDOUT_STDERR $BOG_LOG_TO_FILE $BOG_LOG_TO_BOTH)
    if [[ ! "${valid_log_modes[*]}" =~ ${new_log_mode} ]]; then
        >&2 echo "Invalid log mode '${new_log_mode}' provided; not setting log mode."
        return $BOG_LOG_INVALID_LOG_MODE
    fi
    BOG_LOG_MODE="$new_log_mode"

    return $BOG_LOG_OK
}

#############################################################################
# Sets the path of the log file the logger will write to.
#
# Globals:
#   BOG_LOG_FILE
# Arguments:
#   log_file: The file to log to
# Returns:
#   A status code indicating wether the log file assignment was successful
#############################################################################
function bog_set_log_file() {
    # TODO: Add option of creating subdirectory for loging? Maybe?
    local new_log_file="$1"
    BOG_LOG_FILE="$new_log_file"

    return $BOG_LOG_OK
}

###################################################################################
# Sets the timestamp format the logger will use. This format must be compatible
# with the date command.
#
# Globals:
#   BOG_LOG_DATE_FORMAT
# Arguments:
#   date_format: The new date format to use
# Returns:
#   A status code indicating wether the format assignment was successful
###################################################################################
function bog_set_timestamp_format() {
    local new_date_format="$1"

    # TODO: Verify that this format is valid?
    # TODO: remove quotes around time format
    BOG_LOG_DATE_FORMAT="$new_date_format"

    return $BOG_LOG_OK
}

# by default logging will go to STDOUT/STDERR
BOG_LOG_MODE=$BOG_LOG_TO_STDOUT_STDERR
BOG_LOG_FILE=$BOG_LOG_DEFAULT_LOG_FILE
BOG_LOG_DATE_FORMAT=$BOG_LOG_DATE_FORMAT_UNSET