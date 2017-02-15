# ************************************************************
#
# those are default envs that you can use them at any step.
#
# ************************************************************

echo '===============DEFAULT ENVS======================='

echo "\$FLOW_PROJECT_NAME = $FLOW_PROJECT_NAME"
echo "\$FLOW_USER_ID = $FLOW_USER_ID"
echo "\$FLOW_PROJECT_ID = $FLOW_PROJECT_ID"
echo "\$FLOW_PROJECT_GIT_URL = $FLOW_PROJECT_GIT_URL"
echo "\$FLOW_PROJECT_LANGUAGE = $FLOW_PROJECT_LANGUAGE"
echo "\$FLOW_GIT_HOST = $FLOW_GIT_HOST"
echo "\$FLOW_JOB_ID = $FLOW_JOB_ID"
echo "\$FLOW_EVENT_ID = $FLOW_EVENT_ID"
echo "\$FLOW_EVENT_NUMBER = $FLOW_EVENT_NUMBER"
echo "\$FLOW_PHP_OLD_VERSION = $FLOW_PHP_OLD_VERSION"

echo '=================================================='
# ************************************************************
#
# This step will init your project
#
#   Variables used:
#     $FLOW_VERSION
#
#   Outputs:
#
# ************************************************************

source $HOME/.nvm/nvm.sh
source $HOME/.rvm/scripts/rvm
[[ -e ~/.phpbrew/bashrc ]] && source ~/.phpbrew/bashrc
flow_cmd "phpbrew use $FLOW_VERSION" --echo
flow_cmd "php --version" --echo
flow_cmd "composer --version" --echo

if `echo $FLOW_PHP_OLD_VERSION | grep $FLOW_VERSION >/dev/null`; then
  sudo ln -s /usr/local/bin/phpunit-old.phar /usr/local/bin/phpunit
else
  sudo ln -s /usr/local/bin/phpunit.phar /usr/local/bin/phpunit
fi

flow_cmd "phpunit --version" --echo

