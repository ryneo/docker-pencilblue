#!/bin/bash
set -e

# PencilBlue configuration
if [ ! -e /home/pb/config.json ]; then

cat > /root/pb/config.json <<EOF
{
  "siteName": "$PB_SITE_NAME",
  "siteRoot": "$PB_SITE_ROOT",
  "sitePort": $PB_SITE_PORT,
  "siteIP": "localhost",
  "log_level": "$PB_LOG_LEVEL",
  "db": {
      "type":"$PB_DB_TYPE",
      "servers": ["mongodb://db:27017/"],
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
  }
}

EOF
fi

exec "$@"
