
#1-Greet the user.
echo Hello $USER

#2-Define an environment variable called COURSE_ID with a value equals to DevOpsFursa.
export COURSE_ID=DevOpsFursa

#3-If the file .token exists in the home directory of the user,
#check its permissions.
#If the octal representation of the permissions set is different from 600 (read and write by the user only),
#print the following warning message to the user: Warning: .token file has too open permissions

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
fi

#4-Change the umask of the user such that the default permissions of new created files will be r and w for the user and the group only.
umask 006

#5-Add /home/<username>/usercommands
export PATH="$PATH:/home/<$USER>/usercommands/"

#6-Print the current date on screen in ISO 8601 format. The precision should be seconds, and the timezone should be UTC.
date -u +"%Y-%m-%dT%H:%M:%S%z"

#7-whenever the user is executing ltxt, all files with .txt extension are printed.
alias ltxt='ls *.txt'

#8-If it doesn't exist, create the ~/tmp directory on the user's home dir. If it exists, clean it.

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

#9-If it exists, kill the process that is bound to port 8080.
# Check if a process is bound to port 8080
if lsof -ti :8080 &> /dev/null; then
    # If a process is found, kill it
    echo "Process bound to port 8080 found. Killing..."
    kill $(lsof -ti :8080)
else
    echo "No process bound to port 8080 found."
fi




