# ShadowConnect - Stealth Reverse Shell Generator

<p align="center">
  <img src="https://img.shields.io/badge/Platform-Linux%20%7C%20Unix-blue" alt="Platform">
  <img src="https://img.shields.io/badge/Language-Bash%20Shell-green" alt="Language">
  <img src="https://img.shields.io/badge/Status-Undetected-brightgreen" alt="Status">
  <img src="https://img.shields.io/badge/License-MIT-orange" alt="License">
</p>

## 🚀 Overview

**ShadowConnect** is an advanced, fully undetected (FUD) reverse shell generator designed for penetration testing and ethical hacking purposes. It automatically creates a highly obfuscated, self-contained reverse shell payload, using multiple anti-analysis measures and persistence mechanisms to avoid detection.

## ✨ Features

- 🔥 **Automatic Generation** - Creates a ready-to-use reverse shell with a single command.
- 🛡️ **Advanced Obfuscation** - Automatically applies multiple layers of obfuscation.
- 🕵️ **Stealth Techniques** - Built-in process spoofing and timestamp manipulation.
- 🔗 **Multiple Persistence** - Automatically sets up cron jobs and Systemd services.
- 🌐 **Connection Fallbacks** - Uses bash, netcat, and python for connections.
- 🧩 **Modular Design** - Easy to extend and add new techniques.

## 🛠️ Usage

### Generate a reverse shell:
```bash
# 1. Clone the repository
git clone https://github.com/yourusername/stealth-reverse-shell.git
cd stealth-reverse-shell

# 2. Generate the payload
./generator.sh <your_c2_ip> <your_c2_port>

# 3. Deploy and execute the generated script
# The generated script will be named 'reverse_shell.sh'
```

### Example:
```bash
./generator.sh 10.0.0.1 4444
```

This will create a `reverse_shell.sh` file in the current directory.

## 🎯 Obfuscation & Stealth

ShadowConnect automatically applies the following techniques to the generated payload:

- **Process Name Spoofing** - Masquerades as `[kworker/0:0]`.
- **Timestamp Manipulation** - Matches system file timestamps.
- **Decoy Code** - Wraps the payload in a legitimate-looking script.
- **Payload Obfuscation** - Makes the payload difficult to analyze.
- **Multiple Layers** - Combines different techniques for maximum evasion.

## ⚠️ DISCLAIMER

**IMPORTANT: LEGAL AND ETHICAL USE ONLY**

This project is developed for **educational and ethical purposes only**. The authors and contributors are not responsible for any misuse or damage caused by this software.

**By using this software, you agree to use it only for legal and ethical purposes and accept full responsibility for your actions.**

## 🤝 Contributing

We welcome contributions for:
- Improving obfuscation techniques
- Adding new evasion methods
- Enhancing documentation
- Bug fixes and optimizations

**Please ensure all contributions adhere to ethical guidelines and legal requirements.**

## 📄 License

MIT License - see [LICENSE](LICENSE) file for details.
