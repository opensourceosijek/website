#!/usr/bin/bash

# ============================================================
# FC SAN Traffic Monitor - Version 6
# Proxmox VE / Linux DM-Multipath + ALUA aware
#
# Prikazuje:
#  - FC host TX/RX promet (MB/s + Gbps)
#  - Link speed
#  - Multipath putanje po hostu
#  - access_state (AO/ANO) iz sysfs
#  - PRIO iz multipathd
# 
#  HH + ChatGPT
# ====================================

INTERVAL=5
WORD_SIZE=4

declare -A TX_PREV RX_PREV SPEED PRIO_MAP

trap 'echo; echo "Exit."; exit 0' INT TERM

# ------------------------------------------------------------
# učitaj multipath priority mapu
load_prio_map() {

    PRIO_MAP=()

    while read -r dev prio; do
        PRIO_MAP["$dev"]="$prio"
    done < <(
        multipathd show paths format "%d %p" 2>/dev/null | awk 'NR>1'
    )
}

# ------------------------------------------------------------
# Initial read
for h in /sys/class/fc_host/host*; do
    host=$(basename "$h")
    TX_PREV[$host]=$(cat "$h/statistics/tx_words" 2>/dev/null || echo 0)
    RX_PREV[$host]=$(cat "$h/statistics/rx_words" 2>/dev/null || echo 0)

    spd=$(cat "$h/speed" 2>/dev/null || echo 0)
    SPEED[$host]=${spd//[^0-9]/}
done

# ------------------------------------------------------------
while true; do

    load_prio_map

    printf "\033[H\033[J"

    echo "=================================================================================="
    printf "%-8ž%-8s %-6s %22s %22s %10s\n" \
           "HOST" "STATE" "TX (MB/s / Gbps)" "RX (MB/s / Gbps)" "LINK"
    echo "=================================================================================="

    for h in /sys/class/fc_host/host*; do
        host=$(basename "$h")
        hnum=${host//host/}
        speed=${SPEED[$host]:-0}

        tx_now=$(cat "$h/statistics/tx_words" 2>/dev/null || echo 0)
        rx_now=$(cat "$h/statistics/rx_words" 2>/dev/null || echo 0)

        tx_delta=$(( tx_now - TX_PREV[$host] ))
        rx_delta=$(( rx_now - RX_PREV[$host] ))

        tx_MB=$(awk -v d="$tx_delta" -v i="$INTERVAL" -v w="$WORD_SIZE" \
                 'BEGIN { printf "%.2f", (d*w)/(i*1024*1024) }')
        rx_MB=$(awk -v d="$rx_delta" -v i="$INTERVAL" -v w="$WORD_SIZE" \
                 'BEGIN { printf "%.2f", (d*w)/(i*1024*1024) }')

        tx_Gbps=$(awk -v mb="$tx_MB" 'BEGIN { printf "%.2f", mb*8/1024 }')
        rx_Gbps=$(awk -v mb="$rx_MB" 'BEGIN { printf "%.2f", mb*8/1024 }')

        host_state="ANO"
        paths=()

        for dev in /sys/block/sd*/device; do
            hcil=$(basename "$(readlink -f "$dev")" | cut -d: -f1)
            if [[ "$hcil" == "$hnum" ]]; then
                sd=$(basename "$(dirname "$dev")")
                paths+=("$sd")
            fi
        done

        for sd in "${paths[@]}"; do
            acc="/sys/block/$sd/device/access_state"
            [[ -f "$acc" ]] || continue
            state=$(cat "$acc")
            [[ "$state" == "active/optimized" ]] && host_state="AO"
        done

        printf "%-8s [%-3s] %22s %22s %10s\n" \
               "$host" "$host_state" \
               "$tx_MB MB/s ($tx_Gbps Gbps)" \
               "$rx_MB MB/s ($rx_Gbps Gbps)" \
               "$speed Gbps"

        for sd in "${paths[@]}"; do

            acc=$(cat /sys/block/$sd/device/access_state 2>/dev/null)

            case "$acc" in
                active/optimized)     tag="[AO]" ;;
                active/non-optimized) tag="[ANO]" ;;
                *)                    tag="[--]" ;;
            esac

            prio="${PRIO_MAP[$sd]:--}"

            printf "        %-5s %-22s prio=%-4s %s\n" \
                   "$sd" "$acc" "$prio" "$tag"
        done

        TX_PREV[$host]=$tx_now
        RX_PREV[$host]=$rx_now
    done

    echo
    echo "Legenda:"
    echo "[AO]  active / optimized"
    echo "[ANO] active / non-optimized"

    sleep "$INTERVAL"
done
