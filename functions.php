<?php
require_once __DIR__ . '/vendor/autoload.php';

require_once __DIR__ . '/lib/Glutton.php';
require_once __DIR__ . '/lib/GluttonView.php';

wp_enqueue_script('glutton-main',
	get_stylesheet_directory_uri() . '/static/app/app.js'
);


/**
 * glutton_bugsnag
 *
 * Echo out the bugsnag snippet for JS error tracking
 */
function glutton_bugsnag() {
	echo <<<SNIPPET
	<script
		src="//d2wy8f7a9ursnm.cloudfront.net/bugsnag-2.min.js"
		data-apikey="9fd6c80ccab8cc199fc428d5ecfb83b1">
	</script>
SNIPPET;
}
add_action( 'wp_print_head_scripts', 'glutton_bugsnag' );

/**
 * glutton_jsmonitor
 *
 * Echo out the JSMonitor.io snippet for JS error tracking
 */
function glutton_jsmonitor() {
	echo <<<SNIPPET
	<script type="text/javascript">
	var ue_params = ue_params || [];ue_params.push("UE-206861348");
	(function() {var ue = document.createElement('script'); ue.type = 'text/javascript'; ue.async = true;
	ue.src = (("https:" == document.location.protocol) ? "https://" : "http://") + 'app.jsmonitor.io/js/jsmonitor.js';
	var script = document.getElementsByTagName('script')[0]; script.parentNode.insertBefore(ue, script);})();
	errors = []; window.onerror = function(){ errors.push(arguments); UEInfo.run(); }
	</script>
SNIPPET;
}
add_action( 'wp_print_footer_scripts', 'glutton_jsmonitor' );

