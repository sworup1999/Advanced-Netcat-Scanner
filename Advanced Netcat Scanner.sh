#!/bin/bash

# Advanced Networking Scanning Tool using netcat (nc)
# Created by Sworup Kumar Sahu

clear

# Function to display banner
banner() {
    echo -e "\033[1;92m"
    echo "=============================="
    echo "   Advanced Netcat Scanner"
    echo "=============================="
    echo "  Made by Sworup Kumar Sahu"
    echo "=============================="
    echo -e "\033[1;m"
}

# Function to perform TCP scan (SYN scan)
syn_scan() {
    local target=$1
    local ports=$2
    echo "Performing SYN Scan on ports: $ports..."
    echo "=============================="
    for port in $(echo $ports | sed "s/,/ /g"); do
        nc -z -v -n -w 1 -sS $target $port
    done
    echo "=============================="
    echo "SYN Scan completed."
}

# Function to perform TCP scan (ACK scan)
ack_scan() {
    local target=$1
    local ports=$2
    echo "Performing ACK Scan on ports: $ports..."
    echo "=============================="
    for port in $(echo $ports | sed "s/,/ /g"); do
        nc -z -v -n -w 1 -sA $target $port
    done
    echo "=============================="
    echo "ACK Scan completed."
}

# Function to perform TCP scan (NULL scan)
null_scan() {
    local target=$1
    local ports=$2
    echo "Performing NULL Scan on ports: $ports..."
    echo "=============================="
    for port in $(echo $ports | sed "s/,/ /g"); do
        nc -z -v -n -w 1 -s $target $port
    done
    echo "=============================="
    echo "NULL Scan completed."
}

# Function to perform comprehensive scan
comprehensive_scan() {
    local target=$1
    local ports=$2
    echo "Performing Comprehensive Scan on TCP ports: $ports..."
    echo "=============================="
    echo "SYN Scan Results:"
    syn_scan $target $ports
    echo "ACK Scan Results:"
    ack_scan $target $ports
    echo "NULL Scan Results:"
    null_scan $target $ports
    echo "=============================="
    echo "Comprehensive Scan completed."
}

# Main script execution
banner

echo "Enter the target IP or domain:"
read target

echo -e "\nSelect scan type:"
echo "1. SYN Scan"
echo "2. ACK Scan"
echo "3. NULL Scan"
echo "4. Comprehensive Scan (SYN, ACK, and NULL)"

read -p "Choice: " choice

echo "Enter ports to scan (e.g., 80,443 or 1-65535):"
read ports

case $choice in
    1)
        syn_scan $target $ports
        ;;
    2)
        ack_scan $target $ports
        ;;
    3)
        null_scan $target $ports
        ;;
    4)
        comprehensive_scan $target $ports
        ;;
    *)
        echo "Invalid choice"
        ;;
esac

echo "Scan completed."

