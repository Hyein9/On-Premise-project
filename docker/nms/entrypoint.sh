#!/bin/sh

# -f 로 foreground 강제, 로그는 stdout
# 백그라운드(&)로 띄워서 둘 다 실행
snmpd -f -Lo &
SNMPD_PID=$!

snmptrapd -f -Lo &
TRAPD_PID=$!

echo "snmpd PID: $SNMPD_PID"
echo "snmptrapd PID: $TRAPD_PID"

# 둘 다 직접 wait (fork한 자식이라 문제없음)
wait $SNMPD_PID $TRAPD_PID
