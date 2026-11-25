#!/bin/bash
# SPDX-FileCopyrightText: 2026 Takumi Watanabe
# SPDX-License-Identifier: BSD-3-Clause

ng () {
        echo "${1}行目のテスト失敗" >&2
        res=1
}

res=0

# 基本動作のテスト
out=$(echo 1234 | ./cutnumber)
[ "${out}" = "1200" ] || ng "$LINENO"

[ "${res}" = 0 ] && echo OK
exit "$res"

# 10の位で丸めるテスト
out=$(echo 1234 | ./cutnumber -p 1)
[ "${out}" = "1230" ] || ng "$LINENO"
