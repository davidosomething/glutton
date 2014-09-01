<?php
class Glutton
{
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

	static public function theme( $filepath ) {
		return get_stylesheet_directory() . $filepath;
	}

	/**
	 * scripts
	 *
	 * Hook this function to add scripts
	 */
	static public function scripts() {
		wp_enqueue_script('glutton-lib',
			get_stylesheet_directory_uri() . '/static/app/lib.js',
			array(),
			null,
			true
		);
		wp_enqueue_script('glutton-main',
			get_stylesheet_directory_uri() . '/static/app/app.js',
			array( 'glutton-lib' ),
			null,
			true
		);
	}

}

