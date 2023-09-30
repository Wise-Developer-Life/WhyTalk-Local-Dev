#!/usr/bin/env bash
mode="clean"
repo_home=""
# Parse named arguments
while [[ $# -gt 0 ]]; do
  case "$1" in
    --mode=*)
      mode="${mode#*=}"
      shift
      ;;
    *)
      repo_home="$1"
      shift
      ;;
  esac
done

if [ "$mode" != "clean" ] && [ "$mode" != "create" ]; then
  echo "Unknown mode: $mode"
  exit 1
fi

if [ ! -d "$repo_home" ]; then
  echo "directory not found: $repo_home"
  exit 1
fi

# setup repo location
export WHYTALK_MESSAGE_REPO="$WHYTALK_HOME/WhyTalk-Message"
export WHYTALK_MATCHING_REPO="$WHYTALK_HOME/WhyTalk-Matching"
export WHYTALK_USER_REPO="$WHYTALK_HOME/WhyTalk-User"
export WHYTALK_AUTH_REPO="$WHYTALK_HOME/WhyTalk-Auth"
export WHYTALK_SOCKET_REPO="$WHYTALK_HOME/WhyTalk-Socket"
export WHYTALK_UI_REPO="$WHYTALK_HOME/WhyTalk-UI"

# development environment
export DEPLOY_ENVIRONMENT="dev"
export JDK_BASE_IMAGE="wisedevlife/jdk-dev:latest"
export NESTJS_BASE_IMAGE="wisedevlife/nestjs-dev:latest"
export REACT_BASE_IMAGE="node:16-alpine"

# setup starting port
export WHYTALK_MESSAGE_PORT=3001
export WHYTALK_MATCHING_PORT=3002
export WHYTALK_USER_PORT=3003
export WHYTALK_AUTH_PORT=3004
export WHYTALK_SOCKET_PORT=3005
export WHYTALK_UI_PORT=3006

# login docker
echo "Login docker..."
docker login -u wisedevlife -p wisedevlife

if [ "$mode" == "clean" ]; then
  echo "Clean docker images..."
  docker-compose down
else
  echo "Create docker images..."
  docker-compose up -d
fi

exit 0



