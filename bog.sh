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

# BOG logging modes
BOG_LOG_TO_STDOUT_STDERR=1
BOG_LOG_TO_FILE=2
BOG_LOG_TO_BOTH=3
BOG_LOG_MODE=0

# BOG log file
BOG_LOG_DEFAULT_LOG_FILE='bog.log'
BOG_LOG_FILE=''

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

    output_string="DEBUG: $(date) - $log_message"
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

    output_string="INFO: $(date) - $log_message"
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

    output_string="WARNING: $(date) - $log_message"
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

    output_string="ERROR: $(date) - $log_message"
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

    output_string="FATAL: $(date) - $log_message"
    if [[ $BOG_LOG_MODE == "$BOG_LOG_TO_STDOUT_STDERR" ]] || [[ $BOG_LOG_MODE == "$BOG_LOG_TO_BOTH" ]]; then
        >&2 echo -e "$output_string"
    fi

    if [[ $BOG_LOG_MODE == "$BOG_LOG_TO_FILE" ]] || [[ $BOG_LOG_MODE == "$BOG_LOG_TO_BOTH" ]]; then
        echo -e "$output_string" >> "$BOG_LOG_FILE"
    fi
}

# by default logging will go to STDOUT/STDERR
BOG_LOG_MODE=$BOG_LOG_TO_STDOUT_STDERR
BOG_LOG_FILE=$BOG_LOG_DEFAULT_LOG_FILE