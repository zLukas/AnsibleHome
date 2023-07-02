#! /usr/bin/bash -e

ZIP_NAME="sqlite.zip"
SQLITE_DIR="sqlite"
URL="https://www.sqlite.org/2023/sqlite-tools-linux-x86-3420000.zip"


if [[ -e "/usr/bin/sqlite3" && -e "/usr/bin/sqldiff" && -e "/usr/bin/sqlite3_analyzer" ]]
then
    echo "binaries exist in /usr/bin/ nothing to do"

else
    mkdir -p "${SQLITE_DIR}"
    mkdir -p "${SQLITE_DIR}/zip"
    mkdir -p "${SQLITE_DIR}/bin"
    chmod 777  "${SQLITE_DIR}"/*
    cd "${SQLITE_DIR}"

    echo " sqlite.zip not found, downloading..."
    wget -O "zip/${ZIP_NAME}" "${URL}"

    unzip -o "zip/${ZIP_NAME}" -d "bin/"

    # add binaries to usr/bin
    sudo mv bin/sqlite-tools-linux-x86-3420000/* /usr/bin/

    # remove temp dir 
    cd ..
    sudo rm -rf sqlite
fi
