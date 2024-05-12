# your solution here...

1-
echo Hello $USER
2-
export COURSE_ID=DevOpsFursa
3-
# Define the path to the .token file
token_file="$HOME/.token"


# Check if the file exists

if [ -e "$token_file" ]; then
    # Get the octal representation of the file permissions
    permissions=$(stat -c "%a" "$token_file")

    # Check if the permissions are different from 600
    if [ "$permissions" != "600" ]; then
        echo "Warning: .token file has too open permissions"
    fi
else
    echo ".token file not found in the home directory."
fi
4-
umask 006
5-
export PATH="$PATH:/home/<ghazal>/usercommands"
6-
date -u +"%Y-%m-%dT%H:%M:%S%z"
7-
alias ltxt='ls *.txt'
8-
# Define the path to the tmp directory
tmp_dir="$HOME/tmp"

# Check if the directory exists
if [ ! -d "$tmp_dir" ]; then
    # If it doesn't exist, create it
    mkdir "$tmp_dir"
    echo "Created ~/tmp directory"
else
    # If it exists, clean it (delete all contents)
    rm -rf "$tmp_dir"/*
    echo "Cleaned ~/tmp directory"
fi
9-
# Check if a process is bound to port 8080
if lsof -ti :8080 &> /dev/null; then
    # If a process is found, kill it
    echo "Process bound to port 8080 found. Killing..."
    kill $(lsof -ti :8080)
else
    echo "No process bound to port 8080 found."
fi

