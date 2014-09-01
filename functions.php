<?php
require_once __DIR__ . '/vendor/autoload.php';

require_once __DIR__ . '/lib/Glutton.php';
require_once __DIR__ . '/lib/GluttonView.php';

wp_enqueue_script('glutton-main',
	get_stylesheet_directory_uri() . '/static/app/app.js'
);
