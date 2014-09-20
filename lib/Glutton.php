<?php
class Glutton
{
	static protected $_version_data;

	static public function getVersionData() {
		if ( ! static::$_version_data ) {
			$version_json_file = trailingslashit( get_stylesheet_directory_uri() ) . 'version.json';
			$version_json_data = file_get_contents( $version_json_file );
			static::$_version_data = json_decode( utf8_encode( $version_json_data ) );
		}
		return static::$_version_data;
	}

	static public function version() {
		return static::getVersionData()->version;
	}

	static public function revision() {
		return static::getVersionData()->revision;
	}

	static public function asset() {
		return trailingslashit( get_stylesheet_directory_uri() ) . 'static/assets/';
	}

	static public function css( $filename, $echo = true ) {
		if ( empty( $filename ) ) {
			throw new Exception( 'Glutton:css needs a filename' );
		}
		$path = static::asset() . "css/{$filename}";
		if ( $echo ) {
			echo esc_url( $path );
		}
	}

	/**
	 * @param string $filepath
	 */
	static public function theme( $filepath ) {
		return get_stylesheet_directory() . $filepath;
	}

	/**
	 * scripts
	 *
	 * Hook this function to add scripts
	 */
	static public function scripts() {
		wp_enqueue_script( 'glutton-lib',
			get_stylesheet_directory_uri() . '/static/app/lib.js',
			array(),
			null,
			true
		);
		wp_enqueue_script( 'glutton-main',
			get_stylesheet_directory_uri() . '/static/app/app.js',
			array( 'glutton-lib' ),
			null,
			true
		);

		$glutton_data = array(
			'revision' => static::revision(),
			'env'      => WP_ENV,
		);
		wp_localize_script( 'glutton-main', 'Glutton', $glutton_data );
	}

	/**
	* glutton_bugsnag
	*
	* Echo out the bugsnag snippet for JS error tracking
	*/
	static public function bugsnag() {
		$glutton_bugsnag_api_key = GLUTTON_BUGSNAG_API_KEY;
		$glutton_app_version = static::version();
		echo <<<SNIPPET
		<script src="//d2wy8f7a9ursnm.cloudfront.net/bugsnag-2.min.js"
			data-apikey="{$glutton_bugsnag_api_key}"
			data-appversion="{$glutton_app_version}"></script>
SNIPPET;
	}

	/**
 	* jsmonitor
 	*
 	* Echo out the JSMonitor.io snippet for JS error tracking
 	*/
	static public function jsmonitor() {
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
}

