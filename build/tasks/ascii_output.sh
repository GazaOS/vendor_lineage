#!/usr/bin/env bash

PACKAGE_PATH="$1"
TARGET_DEVICE="$2"
BUILD_VARIANT="$3"

CL_RST="\033[0m"
CL_RED="\033[1;31m"
CL_GRN="\033[1;32m"
CL_YEL="\033[1;33m"
CL_BLU="\033[1;34m"
CL_MAG="\033[1;35m"
CL_CYN="\033[1;36m"
CL_WHT="\033[1;37m"

echo -e "${CL_BLU}================================================================================${CL_RST}"
echo -e "${CL_GRN}   ██████╗  █████╗ ███████╗ █████╗  ██████╗ ███████╗${CL_RST}"
echo -e "${CL_GRN}  ██╔════╝ ██╔══██╗╚══███╔╝██╔══██╗██╔═══██╗██╔════╝${CL_RST}"
echo -e "${CL_GRN}  ██║  ███╗███████║  ███╔╝ ███████║██║   ██║███████╗${CL_RST}"
echo -e "${CL_GRN}  ██║   ██║██╔══██║ ███╔╝  ██╔══██║██║   ██║╚════██║${CL_RST}"
echo -e "${CL_GRN}  ╚██████╔╝██║  ██║███████╗██║  ██║╚██████╔╝███████║${CL_RST}"
echo -e "${CL_GRN}   ╚═════╝ ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝ ╚═════╝ ╚══════╝${CL_RST}"
echo -e "${CL_BLU}     Hybrid ROM (Lunaris + crDroid + LineageOS) | Free Palestine 🇵🇸${CL_RST}"
echo -e "${CL_BLU}================================================================================${CL_RST}"

if [ -n "${PACKAGE_PATH}" ]; then
    PKG_NAME="$(basename "${PACKAGE_PATH}")"
    PKG_DIR="$(dirname "${PACKAGE_PATH}")"
    if [ -f "${PACKAGE_PATH}" ]; then
        PKG_SIZE="$(du -h "${PACKAGE_PATH}" | cut -f1)"
    else
        PKG_SIZE="unknown"
    fi
    FINISHED_AT="$(date '+%Y-%m-%d %H:%M:%S')"

    echo -e ""
    echo -e "${CL_GRN}================================================================================${CL_RST}"
    echo -e "${CL_CYN}                🎊✨ BUILD COMPLETED SUCCESSFULLY! ✨🎊${CL_RST}"
    echo -e "${CL_GRN}================================================================================${CL_RST}"
    echo -e ""
    echo -e "${CL_WHT}📦 Package:${CL_RST}     ${CL_YEL}${PKG_NAME}${CL_RST}"
    echo -e "${CL_WHT}📍 Location:${CL_RST}    ${CL_BLU}${PKG_DIR}/${CL_RST}"
    if [ -n "${TARGET_DEVICE}" ]; then
        echo -e "${CL_WHT}📱 Device:${CL_RST}      ${CL_CYN}${TARGET_DEVICE} [${BUILD_VARIANT}]${CL_RST}"
    fi
    echo -e "${CL_WHT}💾 Size:${CL_RST}        ${CL_YEL}${PKG_SIZE}${CL_RST}"
    echo -e "${CL_WHT}⏱️ Finished At:${CL_RST} ${CL_MAG}${FINISHED_AT}${CL_RST}"
    echo -e ""
    echo -e "${CL_RED}                ❤️ Thank you for building GazaOS! 🇵🇸${CL_RST}"
    echo -e ""
    echo -e "${CL_GRN}================================================================================${CL_RST}"
    echo -e "${CL_YEL}        🎉 Your ROM is hot out of the oven & ready to flash! 🎉${CL_RST}"
    echo -e "${CL_GRN}================================================================================${CL_RST}"
    echo -e ""
fi
