#!/bin/bash
#
# Copyright (C) 2020 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

set -e

# Required!
export DEVICE=I002D
export VENDOR=asus

export DEVICE_BRINGUP_YEAR=2020

# Load extract_utils and do some sanity checks
MY_DIR="${BASH_SOURCE%/*}"
if [[ ! -d "${MY_DIR}" ]]; then MY_DIR="${PWD}"; fi

lineage_ROOT="${MY_DIR}/../../.."

HELPER="${lineage_ROOT}/tools/extract-utils/extract_utils.sh"
if [ ! -f "${HELPER}" ]; then
    echo "Unable to find helper script at ${HELPER}"
    exit 1
fi
source "${HELPER}"

# Initialize the helper
setup_vendor "$DEVICE" "$VENDOR" "$lineage_ROOT"

# Copyright headers and guards
write_headers "I002D"

# The standard common blobs
write_makefiles "${MY_DIR}/proprietary-files.txt" true

write_makefiles "${MY_DIR}/proprietary-files-vendor.txt" true

write_makefiles "${MY_DIR}/proprietary-files-system_ext.txt" true

# Finish
write_footers

