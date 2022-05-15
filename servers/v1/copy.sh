#!/bin/bash

readonly install_server="$([[ "$PROFILE" == "multi_server" || "$PROFILE" == "single" ]] && echo "1" || echo "0")";
readonly install_client="$([[ "$PROFILE" == "multi_client" || "$PROFILE" == "single" ]] && echo "1" || echo "0")";

cp -r data/common/* "$DIR"
if [[ "$install_client" == "1" ]]; then
  if [[ $(has_child "data/client") == 1 ]]; then
    cp -r data/client/* "$DIR"
  fi
  if [[ $(has_child "local/client") == 1 ]]; then
    cp -r local/client/* "$DIR"
  fi
elif [[ "$install_server" == "1" ]]; then
  if [[ $(has_child "data/server") == 1 ]]; then
    cp -r data/server/* "$DIR"
  fi
fi
