# SandboxWin

## Windows Sandbox Configuration Repository

This repository contains a collection of pre-configured Windows Sandbox environments for various use cases. Windows Sandbox is a lightweight virtual environment built into Windows 10/11 that allows you to run applications in an isolated, temporary desktop environment without affecting your main OS.

## Repository Structure

The repository is organized as follows:

- `.wsb` files: Windows Sandbox configuration files for different use cases
- `sandScript/`: Installation scripts for common applications
- `template.wsb`: Standardized template for creating new configurations

## Available Configurations

### Security-Focused
- `moreSecurity.wsb`: High-security environment with networking disabled
- `GPUSandboxFix.wsb`: Configuration with GPU-related fixes
- `unkownSoftware.wsb`: Isolated environment for analyzing unknown software

### Development & Testing
- `.standardDev.wsb`: Secure development environment
- `malwareDev.wsb`: Environment for malware analysis with workspace mapping

### Web Browsing
- `darkBrowser.wsb`: TOR Browser environment
- `defaultBrowser.wsb`: Standard browsing environment

### Media & Entertainment
- `standardMovies.wsb`: Media consumption environment

## Installation Scripts

The `sandScript/` directory contains utility scripts for installing common applications:

- `InstallTOR.cmd`: Downloads and installs the latest Tor Browser
- `InstallVSCode.cmd`: Downloads and installs the latest Visual Studio Code

## Prerequisites

- Windows 10 Pro/Enterprise/Education (version 1903 or later) or Windows 11
- Virtualization must be enabled in BIOS/UEFI
- At least 4GB RAM (8GB recommended)
- Administrator privileges

## How to Use

### Method 1: Direct Execution
1. Double-click any `.wsb` file to launch Windows Sandbox with that configuration

### Method 2: Command Line
1. Open Command Prompt or PowerShell as Administrator
2. Navigate to the repository directory
3. Execute: `Start-Process .\filename.wsb`

## Standardized Configuration Elements

All configurations follow these standardized elements:

- Memory: 4096 MB
- Network: Enabled/Disabled based on security requirements
- Clipboard: Enabled/Disabled based on security requirements
- Audio/Video Input: Disabled for security
- Printer Redirection: Disabled
- Protected Client: Enabled
- VGpu: Disabled (can be enabled if needed)
- Mapped Folders: Standardized path mapping to C:\Scripts

## Creating Custom Configurations

Use `template.wsb` as a starting point for creating your own configurations. The template includes comments explaining each configuration option.

## Security Best Practices

- Keep networking disabled when not needed
- Disable clipboard redirection for high-security tasks
- Use read-only mappings when possible
- Regularly update the installation scripts
- Review configuration files before use

## Contributing

Feel free to submit pull requests for new configurations or improvements to existing ones.

## License
This project is licensed under the MIT License.

## Acknowledgments
- Windows Sandbox documentation: https://docs.microsoft.com/en-us/windows/security/threat-protection/windows-sandbox/
- .wsb Configuration file format: https://docs.microsoft.com/en-us/windows/security/threat-protection/windows-sandbox/windows-sandbox-configure-using-wsb-files
