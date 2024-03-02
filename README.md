It assumes you have ``wal`` installed

Run ./install.sh (remember to chmod +x so you can run it).

Also add the following code to the ~/.bashrc file:

```
# Import colorscheme from 'wal' asynchronously
# &   # Run the process in the background.
# ( ) # Hide shell job control messages.
# source: https://itsfoss.com/pywal/
(cat ~/.cache/wal/sequences &)
```
