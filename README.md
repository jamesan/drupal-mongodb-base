Drupal MongoDB Implementation
===================

Backend changes needed to implement MongoDB module for Drupal 7 to achieve a SQL/MongoDB hybrid database backend.

Modify the four global constants listed in drush.sh and run that script as the user who owns the drupal installation.

    sudo -u aegir ./drush.sh
    sudo -u nginx ./drush.sh
    sudo -u apache ./drush.sh

This assumes you have already successfully installed and configured:

  - LAMP stack with a Drupal installation
  - Drush >= 6.0
  - MongoDB
  - PHP MongoDB Driver (http://docs.mongodb.org/ecosystem/drivers/php/)
