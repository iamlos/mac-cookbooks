#!/bin/bash -e

function install()
{
    # Clean Up

    rm -rf "${installFolder}"
    mkdir -p "${installFolder}" "${installDataFolder}"

    # Install

    unzipRemoteFile "${downloadURL}" "${installFolder}"
    find "${installFolder}" -maxdepth 1 -type f -exec rm -f {} \;
}

function main()
{
    local appPath="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

    source "${appPath}/../../../lib/util.bash" || exit 1
    source "${appPath}/../attributes/default.bash" || exit 1

    header 'INSTALLING MONGODB'

    install
}

main "${@}"