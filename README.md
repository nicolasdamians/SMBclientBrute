# SMB Brute Force Script

## Project Overview
This script is designed for brute-forcing SMB credentials as part of ethical hacking and penetration testing exercises. It was developed as part of a Capture The Flag (CTF) exercise to prepare for the OSCP certification, focusing on enumeration and pivoting techniques.

## Features
- **Parallel Execution**: Utilizes background processes for faster credential testing.
- **Custom Port Support**: Allows specifying a custom SMB port (`-p` option), particularly useful in pivoting scenarios.
- **Complex Password Support**: Handles passwords with spaces or special characters.
- **Efficient Termination**: Automatically stops all processes once valid credentials are found.
- **Real-Time Progress Visibility**: Displays progress updates and attempted credentials during execution.
- **Error Handling**: Validates inputs and provides clear error messages for missing files or parameters.

## Usage Instructions
### Required Inputs
1. **username_file**: A file containing a list of potential usernames.
2. **password_file**: A file containing a list of potential passwords (supports spaces).
3. **host**: The target SMB server's IP address or hostname.
4. **port**: The port number where the SMB service is running (e.g., 445 or a custom port).

### Example Command
```bash
./smbbrute.sh users.txt passwords.txt 192.168.1.10 445
```

### Output
- Displays failed login attempts with usernames and passwords tried.
- Highlights successful credential combinations in real-time.
- Shows a final message if no valid credentials are found.

## Dependencies
### Required
- `smbclient`: Used to interact with SMB shares.
- Bash shell: Ensure the script runs in a compatible shell environment.

### Optional
- **GNU Parallel**: For optimized parallel execution, if available.

### Installation
To install required dependencies:
```bash
sudo apt-get install smbclient
```

## Motivation
This script was inspired by a CTF exercise aimed at developing skills needed for the OSCP certification. It is particularly valuable for practicing scenarios involving SMB enumeration and lateral movement through pivoting.

## Legal and Ethical Disclaimer
This script is intended solely for authorized security testing and CTF exercises. Misuse of this tool for unauthorized access is strictly prohibited and may violate laws or ethical guidelines. Always obtain proper authorization before using this tool on any system.

---

### Contributions
Feel free to fork and submit pull requests to improve the script further. Feedback and suggestions are welcome!

