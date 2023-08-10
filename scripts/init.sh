#!/usr/bin/env bash
echo "Adding kutuku.pret to etc/hosts"
echo "127.0.0.1     kutuku.pret    ">> /etc/hosts

# 1. Loading Base System 
cd /content
echo "Downloading base system dist-tts-server.7z"

gdown "105957AqKTtshgD_OtFSK4ZbXMoG1lXWL"

mkdir -p /container/dist
mkdir -p /container/src
 
cd /container/dist

7z x /content/dist-tts-server.7z

# 2. Setup Environment Variables
export PATH=/container/dist/bin:/container/dist/sbin:$PATH
export LD_LIBRARY_PATH=/container/dist/lib/x86_64-linux-gnu
echo "export PATH=/container/dist/bin:/container/dist/sbin:$PATH" >> /root/.bashrc
echo "export DIST_DIR=/container/dist" >> /root/.bashrc
echo "export ETC_DIR=/container/dist/etc" >> /root/.bashrc
echo "export TTS_DIR=/container/dist/tts-indonesia" >> /root/.bashrc
echo "export LD_LIBRARY_PATH=/container/dist/lib/x86_64-linux-gnu"

# 3. Set root password
echo "root:sejati86"|sudo chpasswd

# 4. Starting dropbear
svc dropbear s
# 5. Starting vsftpd

cp /container/dist/etc/vsftpd.conf  /etc/
cp /container/dist/etc/ftpusers  /etc/

# 6. Starting dropbear
svc vsftpd s

# 7. starting gotty
svc gotty s
# 7. starting bore
svc bore-tunnel s
sleep 3
cat /tmp/bore.log
# 8. Setup python site-packages
cd /container
mkdir -p /container/site-packages
#https://drive.google.com/file/d/1-Bz1gotwZeSRRDa8Ss7q-FudHaJAwLAK/view?usp=sharing 
echo "Downloading python site-packages site-packages.squashfs"
gdown "1-Bz1gotwZeSRRDa8Ss7q-FudHaJAwLAK"

echo "Mounting  site-packages.squashfs"
squashfuse site-packages.squashfs site-packages

echo "saving server info supabase"
save-server-info.py
# 9. Starting TTS-server
#svc tts-server s
# cd /container/dist/tts-indonesia

# git-pull
# rm -rf .git/objects
# 7z x checkpoint.7z.001
# rm -rf checkpoint.7z.*

# waitress 

