#!/bin/bash
set -e

# PencilBlue configuration
if [ ! -e /home/pb/config.js ]; then

cat > /root/pb/config.js <<EOF
/**
* This is a sample configuration meant to get users and up running on a local
* machine.  The configuration will not support multi-process on a single
* server or multi-server/elastic environments.  For more detailed information
* on the options provided please refer to the /include/config.js file.
*
* The file can be renamed to "config.js" in the same directory as this file
* and it will be used as the configuration when PencilBlue is started.  If
* this file is used then there is no need to create a "config.json"
*/

module.exports = {
  "siteName": "$PB_SITE_NAME",
  "siteRoot": "$PB_SITE_ROOT",
  "sitePort": $PB_SITE_PORT,
  "log_level": "$PB_LOG_LEVEL",
  "db": {
      "type":"$PB_DB_TYPE",
      "servers": $PB_DB_SERVERS,
      "name": "$PB_DB_NAME",
      "writeConcern": 1
  },
  "cache": {
      "fake": true,
      "host": "localhost",
      "port": 6379
  },
  "settings": {
      "use_memory": false,
      "use_cache": false
  },
  "templates": {
      "use_memory": true,
      "use_cache": false
  },
  "plugins": {
      "caching": {
          "use_memory": false,
          "use_cache": false
      }
  },
  "registry": {
      "type": "$PB_REGISTRY_TYPE"
  },
  "session": {
      "storage": "$PB_SESSION_STORAGE"
  }
};
EOF
fi

exec "$@"
