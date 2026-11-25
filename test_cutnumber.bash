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

# 四捨五入のテスト
out=$(echo 1250 | ./cutnumber -m half_up)
[ "${out}" = "1300" ] || ng "$LINENO"

# 切り上げのテスト
out=$(echo 1234 | ./cutnumber -m ceil)
[ "${out}" = "1300" ] || ng "$LINENO"

# 切り捨てのテスト
out=$(echo 1234 | ./cutnumber -m floor)
[ "${out}" = "1200" ] || ng "$LINENO"

# 数値以外を入力した場合のテスト
out=$(echo hello | ./cutnumber 2>/dev/null)
[ "$?" = 1 ] || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO"
