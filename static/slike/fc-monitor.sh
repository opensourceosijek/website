#!/usr/bin/bash

# FC SAN Traffic Monitor - host-specific multipath paths
# Testirano na Proxmox VE 9.x

INTERVAL=5
WORD_SIZE=4   # FC word = 4 bytes

declare -A TX_PREV RX_PREV STATE SPEED H2HCIL

# boja po opterećenju
colorize() {
    local val=$1 max=$2
    local pct=$((val*100/max))
    if [ $pct -lt 30 ]; then
        tput setaf 2
    elif [ $pct -lt 70 ]; then
        tput setaf 3
    else
        tput setaf 1
    fi
}

# inicijalno očitanje hostova
for h in /sys/class/fc_host/host*; do
    host=$(basename "$h")
    TX_PREV[$host]=$(cat "$h/statistics/tx_words" 2>/dev/null || echo 0)
    RX_PREV[$host]=$(cat "$h/statistics/rx_words" 2>/dev/null || echo 0)
    STATE[$host]="[AO]"
    spd=$(cat "$h/speed" 2>/dev/null || echo 0)
    SPEED[$host]=${spd//[^0-9]/}
    # hcil mapping za host
    H2HCIL[$host]=$(basename $(readlink -f $h/device))  # ovo vraća npr. host1
done

tput civis

while true; do
    tput clear
    tput cup 0 0

    tput bold
    echo "=================================================================================="
    printf "%-8s %-6s %22s %22s %10s\n" "HOST" "STATE" "TX (MB/s / Gbps)" "RX (MB/s / Gbps)" "LINK SPEED"
    tput sgr0
    echo "=================================================================================="

    for h in /sys/class/fc_host/host*; do
        host=$(basename "$h")
        tx_now=$(cat "$h/statistics/tx_words" 2>/dev/null || echo 0)
        rx_now=$(cat "$h/statistics/rx_words" 2>/dev/null || echo 0)
        speed=${SPEED[$host]}

        tx_prev=${TX_PREV[$host]}
        rx_prev=${RX_PREV[$host]}

        tx_delta=$((tx_now - tx_prev))
        rx_delta=$((rx_now - rx_prev))

        tx_MB=$(awk -v d="$tx_delta" -v i="$INTERVAL" -v w="$WORD_SIZE" \
                 'BEGIN { printf "%.2f", (d*w)/(i*1024*1024) }')
        rx_MB=$(awk -v d="$rx_delta" -v i="$INTERVAL" -v w="$WORD_SIZE" \
                 'BEGIN { printf "%.2f", (d*w)/(i*1024*1024) }')

        tx_Gbps=$(awk -v mb="$tx_MB" 'BEGIN { printf "%.2f", mb*8/1024 }')
        rx_Gbps=$(awk -v mb="$rx_MB" 'BEGIN { printf "%.2f", mb*8/1024 }')

        tx_int=$(awk -v g="$tx_Gbps" 'BEGIN { printf "%d", g*100 }')
        rx_int=$(awk -v g="$rx_Gbps" 'BEGIN { printf "%d", g*100 }')
        speed_int=$((speed*100))

        colorize $tx_int $speed_int
        tx_str=$(printf "%7s MB/s (%5s Gbps)" "$tx_MB" "$tx_Gbps")
        colorize $rx_int $speed_int
        rx_str=$(printf "%7s MB/s (%5s Gbps)" "$rx_MB" "$rx_Gbps")
        tput sgr0

        printf "%-8s %-6s %22s %22s %10s\n" "$host" "${STATE[$host]}" "$tx_str" "$rx_str" "$speed Gbps"

        TX_PREV[$host]=$tx_now
        RX_PREV[$host]=$rx_now

        # --- multipath putanje po hostu ---
        hcil_num=${host//host/}  # host1 -> 1
        multipathd show paths 2>/dev/null | awk -v hc="$hcil_num" '
            BEGIN { show=0 }
            NR>1 {
                if ($1 ~ /^[0-9]+:[0-9]+:[0-9]+:[0-9]+$/) {
                    split($1,a,":")
                    if (a[1]==hc) show=1
                    else show=0
                    # AO/ANO
                    state="[AO]"
                    if ($5=="undef") state="[ANO]"
                    if (show) print "        "$0" "state
                }
            }'
    done

    echo
    echo "---------------------------------------"
    echo "Legenda:"
    echo "[AO]  = active / optimized"
    echo "[ANO] = active / non-optimized"
    echo "---------------------------------------"
    echo "Press Ctrl+C to exit"

    sleep "$INTERVAL"
done
