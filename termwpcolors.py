import subprocess
import os

# Get the current wallpaper file URI using gsettings
uri = subprocess.check_output(['gsettings', 'get', 'org.gnome.desktop.background', 'picture-uri']).decode().strip()

# Replace the home directory path with the tilde symbol
uri = uri.replace('file://' + os.path.expanduser('~'), '~')

# Strip the start and end single quotes
uri = uri.strip("'")

#print("wal -i "+uri)
print(uri)

# Execute the wal command with the wallpaper file URI
subprocess.run(['wal', '-i', os.path.expanduser(uri)])
