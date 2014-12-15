#!/bin/sh

# drush.sh
# Drush commands to be run after an Drupal's install.php script is run to enable MongoDB

# Copyright 2014 James An

# THIS PROGRAM is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

# Global constants
declare -r SITE_ALIAS='example.com'     # Drush site alias
declare -r SITES_PATH='example.com'     # Drupal sites folder name
declare -r HOST_STR='localhost'         # MongoDB host string
declare -r DB_NAME='example'            # MongoDB database name

# Derived constants
declare -r SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
declare -r DRUPAL_DIR="$(drush @${SITE_ALIAS} drupal-directory)"

main() {
    sed "s/HOST_STR/${HOST_STR}/;s/DB_NAME/${DB_NAME}/" "${SCRIPT_DIR}/local.settings.php" > "${DRUPAL_DIR}/sites/${SITES_PATH}/local.settings.php"
    drush @${SITE_ALIAS} dis --yes block dashboard
    drush @${SITE_ALIAS} pmu --yes block dashboard
    drush @${SITE_ALIAS} en --yes mongodb{,_{block{,_ui},cache,migrate,queue,session,field_storage,watchdog}}
}

# invoke main function if this script is executed as a command
if [ "$CMD" = ${BASH_SOURCE##*/} ]; then
    main "$@"
# otherwise remove main function
else
    unset main
fi
