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
}

