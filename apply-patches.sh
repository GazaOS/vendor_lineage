#!/usr/bin/env bash
#
# GazaOS Automated Upstream Patch Application Script
# SPDX-License-Identifier: Apache-2.0
#
# This script scans vendor/lineage/patches/ and applies required patches
# to un-forked upstream repositories (Lunaris-AOSP / LineageOS) cleanly.
#

set -e

QUIET=false
if [ "$1" = "--quiet" ] || [ "$1" = "-q" ]; then
    QUIET=true
fi

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Resolve Android build top directory
if [ -n "${ANDROID_BUILD_TOP}" ] && [ -d "${ANDROID_BUILD_TOP}" ]; then
    TOP_DIR="${ANDROID_BUILD_TOP}"
elif [ -d "$(pwd)/build/soong" ]; then
    TOP_DIR="$(pwd)"
elif [ -d "${SCRIPT_DIR}/../../build/soong" ]; then
    TOP_DIR="$(cd "${SCRIPT_DIR}/../.." && pwd)"
elif [ -d "/data/GazaOS/build/soong" ]; then
    TOP_DIR="/data/GazaOS"
else
    TOP_DIR="$(cd "${SCRIPT_DIR}/../.." && pwd)"
fi

PATCH_DIR="${SCRIPT_DIR}/patches"

if [ "${QUIET}" != "true" ]; then
    echo "=== GazaOS Upstream Patch Application ==="
    echo "Base tree: ${TOP_DIR}"
    echo "Patches:   ${PATCH_DIR}"
fi

if [ ! -d "${PATCH_DIR}" ]; then
    if [ "${QUIET}" != "true" ]; then
        echo "No patches directory found at ${PATCH_DIR}. Skipping."
    fi
    exit 0
fi

APPLIED_COUNT=0

for target_dir in "${PATCH_DIR}"/*; do
    if [ -d "${target_dir}" ]; then
        rel_target="$(basename "${target_dir}" | tr '_' '/')"
        dest_path="${TOP_DIR}/${rel_target}"
        
        if [ -d "${dest_path}/.git" ]; then
            if [ "${QUIET}" != "true" ]; then
                echo "--> Processing patches for ${rel_target}..."
            fi
            for patch_file in "${target_dir}"/*.patch; do
                if [ -f "${patch_file}" ]; then
                    patch_name="$(basename "${patch_file}")"
                    # Check if patch is already applied
                    if git -C "${dest_path}" apply --reverse --check "${patch_file}" >/dev/null 2>&1; then
                        if [ "${QUIET}" != "true" ]; then
                            echo "    [ALREADY APPLIED] ${patch_name}"
                        fi
                    elif git -C "${dest_path}" apply --check "${patch_file}" >/dev/null 2>&1; then
                        git -C "${dest_path}" apply "${patch_file}"
                        echo "    [GazaOS] Applied ${rel_target}/${patch_name}"
                        APPLIED_COUNT=$((APPLIED_COUNT + 1))
                    else
                        echo "    [GazaOS][CONFLICT] Failed to apply ${rel_target}/${patch_name}" >&2
                    fi
                fi
            done
        else
            if [ "${QUIET}" != "true" ]; then
                echo "    [SKIP] Target ${rel_target} does not exist in source tree."
            fi
        fi
    fi
done

if [ "${QUIET}" != "true" ]; then
    echo "=== Completed! ${APPLIED_COUNT} patch(es) applied. ==="
fi
