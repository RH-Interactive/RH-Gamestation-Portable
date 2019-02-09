#!/bin/bash

#BR_LAST_MERGE_COMMIT=8ce27bb9fee80a406a4199657ef90e3c315e7457
#git diff --name-only $BR_LAST_MERGE_COMMIT > buildroot.gamestation.diff

cat buildroot.gamestation.diff                              |
    grep -vE '^board/gamestation/'                          | # gamestation board
    grep -vE '^configs/gamestation-'                        | # gamestation defconfig
    grep -vE '^scripts/linux'                            | # gamestation utilities
    grep -vE '^package/gamestation/'                        | # gamestation packages
    grep -vE '^\.gitignore$'
