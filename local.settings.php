<?php
$conf['mongodb_connections'] = array(
    'default' => array(
        'host' => 'HOST_STR', // Connection name/alias
        'db' => 'DB_NAME', // Database name. Make something up, mongodb will automatically create the database.
    ),
);

include_once('includes/cache.inc');

# Configure Cache
$conf['cache_backends'][] = 'sites/all/modules/mongodb/mongodb_cache/mongodb_cache.inc';
$conf['cache_class_cache'] = 'DrupalMongoDBCache';
$conf['cache_class_cache_bootstrap'] = 'DrupalMongoDBCache';
$conf['cache_default_class'] = 'DrupalMongoDBCache';

# Don't touch SQL if in Cache
$conf['page_cache_without_database'] = TRUE;
$conf['page_cache_invoke_hooks'] = FALSE;

# Session Caching
$conf['session_inc'] = 'sites/all/modules/mongodb/mongodb_session/mongodb_session.inc';
$conf['cache_session'] = 'DrupalMongoDBCache';

# Field Storage
$conf['field_storage_default'] = 'mongodb_field_storage';

# Message Queue
$conf['queue_default_class'] = 'MongoDBQueue';
