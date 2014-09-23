<?php
defined( 'WP_ENV' ) or define( 'WP_ENV', 'local' );

// client side api keys only! no private stuff
define( 'GLUTTON_JSMONITOR_ID', 'UE-206861348' );

require_once __DIR__ . '/vendor/autoload.php';

require_once __DIR__ . '/lib/Glutton.php';
require_once __DIR__ . '/lib/GluttonView.php';

add_action( 'wp_enqueue_scripts', array( 'Glutton', 'scripts' ) );

// 3rd party loggers
// footer
add_action( 'wp_print_footer_scripts', array( 'Glutton', 'jsmonitor' ) );
