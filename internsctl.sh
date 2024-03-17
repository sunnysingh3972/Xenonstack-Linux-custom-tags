#!/bin/bash
# Function to display help
display_help() {
    echo "Usage: internsctl [OPTION]... [COMMAND]..."
    echo "Options:"
    echo "  --version          Display command version"
    echo "  --help             Display this help message"
    echo "Commands:"
    echo "  cpu getinfo        Get CPU information"
    echo "  memory getinfo     Get memory information"
    echo "  user create        Create a new user"
    echo "  user list          List all regular users"
    echo "  user list --sudo-only   List users with sudo permissions"
    echo "  file getinfo       Get information about a file"
    echo "Options for file getinfo command:"
    echo "  --size, -s         Print size of the file"
    echo "  --permissions, -p  Print file permissions"
    echo "  --owner, -o        Print file owner"
    echo "  --last-modified, -m  Print last modified time"
}

# Function to display command version
display_version() {
    echo "internsctl version v0.1.0"
}

# Function to get CPU information
get_cpu_info() {
    lscpu
}

# Function to get memory information
get_memory_info() {
    free
}

# Function to create a new user
create_user() {
    username="$1"
    sudo adduser "$username"
}

# Function to list regular users or sudo users
list_users() {
    if [[ "$1" == "--sudo-only" ]]; then
        getent group sudo | cut -d: -f4 | tr ',' '\n'
    else
        getent passwd | cut -d: -f1
    fi
}

# Function to get file information
get_file_info() {
        if [ -z "$2" ]; then
        file="$1"
        option="$2"
    else
        file="$2"
        option="$1"
    fi

    case "$option" in
        "--size" | "-s")
            stat --format="%s" "$file"
            ;;
        "--permissions" | "-p")
            stat --format="%A" "$file"
            ;;
        "--owner" | "-o")
            stat --format="%U" "$file"
            ;;
        "--last-modified" | "-m")
            stat --format="%y" "$file"
            ;;
        *)
            echo "File: $file"
            echo "Access: $(stat -c "%A" "$file")"
             echo "Size(B): $(stat -c "%s" "$file")"
            echo "Owner: $(stat -c "%U" "$file")"
            echo "Modify: $(stat -c "%y" "$file")"
            ;;
    esac
}

# Main script logic
case "$1" in
    "")
        display_help
        ;;
    "--help")
        display_help
        ;;
    "--version")
        display_version
        ;;
    "cpu")
        if [[ "$2" == "getinfo" ]]; then
            get_cpu_info
        else
            echo "Invalid command: $2"
        fi
        ;;
    "memory")
        if [[ "$2" == "getinfo" ]]; then
            get_memory_info
        else
            echo "Invalid command: $2"
        fi
        ;;
    "user")
        if [[ "$2" == "create" ]]; then
            create_user "$3"
        elif [[ "$2" == "list" ]]; then
            list_users "$3"
        else
            echo "Invalid command: $2"
        fi
         ;;
    "file")
        if [[ "$2" == "getinfo" ]]; then
            get_file_info "$3" "$4"
        else
            echo "Invalid command: $2"
        fi
        ;;
    *)
        echo "Invalid command: $1"
        ;;
esac
