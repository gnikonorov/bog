#!/bin/bash
#
# Logging framework for BASH scripts. Source this script to use BOG.
#
# By default, output will go to STDOUT and STDERR streams as follows:
#   debug, info and warning will go to STDOUT
#   error and fatal will go to STDERR

function bog_log_debug() {
    local log_message="$1"
    local output_string

    output_string="DEBUG: $(date) - $log_message"
    echo -e "$output_string"
}

function bog_log_info() {
    local log_message="$1"
    local output_string

    output_string="INFO: $(date) - $log_message"
    echo -e "$output_string"
}

function bog_log_warning() {
    local log_message="$1"
    local output_string

    output_string="WARNING: $(date) - $log_message"
    echo -e "$output_string"
}

function bog_log_error() {
    local log_message="$1"
    local output_string

    output_string="ERROR: $(date) - $log_message"
    >&2 echo -e "$output_string"
}

function bog_log_fatal() {
    local log_message="$1"
    local output_string

    output_string="FATAL: $(date) - $log_message"
    >&2 echo -e "$output_string"
}