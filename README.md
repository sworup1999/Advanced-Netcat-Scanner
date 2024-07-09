# Advanced-Netcat-Scanner
Advanced Networking Scanning Tool using Netcat (nc)    A Bash script for performing advanced networking scans using netcat (nc). This tool supports SYN, ACK, NULL scans, and a comprehensive scan combining these methods.
# Table of Contents
* Introduction
* Features
* Installation
* Usage
* Scanning Methods
* Contributing

# Introduction
This Bash script provides a command-line interface to perform various types of network scans using netcat (nc). It is useful for security professionals and network administrators to quickly assess the security posture of their networks.

# Features
SYN Scan: Sends SYN packets to specified ports.
ACK Scan: Sends ACK packets to specified ports.
NULL Scan: Sends empty packets to specified ports.
Comprehensive Scan: Performs SYN, ACK, and NULL scans for thorough analysis.


# Installation
Clone the repository:


Copy code
```
git clone https://github.com/yourusername/your-repository.git
```
Navigate to the directory:


Copy code
```
cd your-repository
```
Usage
Run the script as root:


Copy code
```
sudo bash networking_scanner.sh
```
Follow the on-screen prompts to select scan type, enter target IP/domain, and specify ports.

Scanning Methods
SYN Scan
The SYN scan sends SYN packets to specified ports:


Copy code
```
nc -z -v -n -w 1 -sS $target $port
```
ACK Scan
The ACK scan sends ACK packets to specified ports:

Copy code
```
nc -z -v -n -w 1 -sA $target $port
```
NULL Scan
The NULL scan sends empty packets to specified ports:

Copy code
```
nc -z -v -n -w 1 -s $target $port
```
Comprehensive Scan
The comprehensive scan combines SYN, ACK, and NULL scans:


Copy code
```
syn_scan $target $ports
ack_scan $target $ports
null_scan $target $ports
```
# Contributing
Contributions are welcome! Please fork the repository and submit pull requests for any improvements or additional features.

