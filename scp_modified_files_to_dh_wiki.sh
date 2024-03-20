#/bin/bash

DESTINATION_SET_IN_SSH_CONFIG="wiki"
DEST_PATH="/home/robuwikipix/wiki.robnugen.com/w/extensions/ArtRobNugenCom/"

# This will watch for changes in the source directory and scp them to the destination
inotifywait --exclude '.git/*' -mr -e close_write . | sed -ue 's/ CLOSE_WRITE,CLOSE //' | xargs -d$'\n' -I% scp  -P 22  % $DESTINATION_SET_IN_SSH_CONFIG:$DEST_PATH%

# inotifywait -mre close_write . | \      # m = monitor # r = recurse subdirs # e = these events
# sed -ue 's/ CLOSE_WRITE,CLOSE //' | \         # removing ' CLOSE_WRITE,CLOSE ' leaves us with exactly the file we need to save
# xargs -d$'\n' -I% \                # converts the stream into something scp can use
# scp -P 22 -i /home/thunderrabbit/.ssh/ABs_AB_webserver_2018.pem % ubuntu@52.195.7.199:/var/www/t.andbeyond.co.jp/current/
