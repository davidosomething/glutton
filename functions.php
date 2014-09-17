<?php
defined( 'WP_ENV' ) or define( 'WP_ENV', 'local' );

// client side api keys only! no private stuff
define( 'GLUTTON_BUGSNAG_API_KEY', '9fd6c80ccab8cc199fc428d5ecfb83b1' );
define( 'GLUTTON_ROLLBAR_CLIENTSIDE_TOKEN', '32244710a5d547649d575a5dbd212fba' );

require_once __DIR__ . '/vendor/autoload.php';

require_once __DIR__ . '/lib/Glutton.php';
require_once __DIR__ . '/lib/GluttonView.php';

add_action( 'wp_enqueue_scripts', array( 'Glutton', 'scripts' ) );

// 3rd party loggers
add_action( 'wp_print_scripts', array( 'Glutton', 'bugsnag' ) );
add_action( 'wp_print_footer_scripts', array( 'Glutton', 'jsmonitor' ) );
add_action( 'wp_print_scripts', array( 'Glutton', 'rollbar' ) );
