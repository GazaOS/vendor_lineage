#!/usr/bin/env bash
#
# GazaOS Automated Upstream Patch Application Script
# SPDX-License-Identifier: Apache-2.0
#
# This script scans vendor/lineage/patches/ and applies required patches
# to un-forked upstream repositories (Lunaris-AOSP / LineageOS) cleanly.
#

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Resolve Android build top directory
if [ -n "${ANDROID_BUILD_TOP}" ] && [ -d "${ANDROID_BUILD_TOP}" ]; then
    TOP_DIR="${ANDROID_BUILD_TOP}"
elif [ -d "$(pwd)/build/soong" ]; then
    TOP_DIR="$(pwd)"
elif [ -d "${SCRIPT_DIR}/../../build/soong" ]; then
    TOP_DIR="$(cd "${SCRIPT_DIR}/../.." && pwd)"
elif [ -d "/data/lunaris/build/soong" ]; then
    TOP_DIR="/data/lunaris"
else
    TOP_DIR="$(cd "${SCRIPT_DIR}/../.." && pwd)"
fi

PATCH_DIR="${SCRIPT_DIR}/patches"

echo "=== GazaOS Upstream Patch Application ==="
echo "Base tree: ${TOP_DIR}"
echo "Patches:   ${PATCH_DIR}"

if [ ! -d "${PATCH_DIR}" ]; then
    echo "No patches directory found at ${PATCH_DIR}. Skipping."
    exit 0
fi

APPLIED_COUNT=0

for target_dir in "${PATCH_DIR}"/*; do
    if [ -d "${target_dir}" ]; then
        rel_target="$(basename "${target_dir}" | tr '_' '/')"
        dest_path="${TOP_DIR}/${rel_target}"
        
        if [ -d "${dest_path}/.git" ]; then
            echo "--> Processing patches for ${rel_target}..."
            for patch_file in "${target_dir}"/*.patch; do
                if [ -f "${patch_file}" ]; then
                    patch_name="$(basename "${patch_file}")"
                    # Check if patch is already applied
                    if git -C "${dest_path}" apply --reverse --check "${patch_file}" >/dev/null 2>&1; then
                        echo "    [ALREADY APPLIED] ${patch_name}"
                    elif git -C "${dest_path}" apply --check "${patch_file}" >/dev/null 2>&1; then
                        git -C "${dest_path}" apply "${patch_file}"
                        echo "    [APPLIED] ${patch_name}"
                        APPLIED_COUNT=$((APPLIED_COUNT + 1))
                    else
                        echo "    [FAILED/CONFLICT] ${patch_name}"
                    fi
                fi
            done
        else
            echo "    [SKIP] Target ${rel_target} does not exist in source tree."
        fi
    fi
done

echo "=== Completed! ${APPLIED_COUNT} patch(es) applied. ==="
