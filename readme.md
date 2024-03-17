# internsctl - Custom Linux Command

## Description

internsctl is a custom Linux command that provides various functionalities for system operations.

## Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/sunnysingh3972/Xenonstack-Linux-custom-tags.git
   ```

2. Change directory:
   ```bash
   cd internsctl
   ```

3. Make the script executable:
   ```bash
   chmod +x internsctl
   ```

4. Add the script to your PATH (optional):
   ```bash
   export PATH="$PATH:/path/to/internsctl"
   ```

## Usage

- Display command version:
   ```bash
   internsctl --version
   ```

- Display help message:
   ```bash
   internsctl --help
   ```

- Get CPU information:
   ```bash
   internsctl cpu getinfo
   ```

- Get memory information:
   ```bash
   internsctl memory getinfo
   ```

- Create a new user:
   ```bash
   internsctl user create <username>
   ```

- List all regular users:
   ```bash
   internsctl user list
   ```

- List users with sudo permissions:
   ```bash
   internsctl user list --sudo-only
   ```

- Get information about a file:
   ```bash
   internsctl file getinfo [options] <file-name>
   ```
   Options available:
   - `--size, -s`: Print size
   - `--permissions, -p`: print file permissions
   - `--owner, -o`: print file owner
   - `--last-modified, -m` check last modified
