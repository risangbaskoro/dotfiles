mkdir -p ~/mnt/personal/

/usr/local/bin/rclone mount personal:personal ~/mnt/personal/ --volname personal --allow-non-empty --vfs-cache-mode writes --vfs-cache-poll-interval 1m --daemon
