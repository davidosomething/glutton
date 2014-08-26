<?php
require_once __DIR__ . '/vendor/autoload.php';

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

	static public function template( $filename, $data = array() ) {
		if ( empty( $filename ) ) {
			throw new Exception( 'Glutton:template needs a filename' );
		}
		$path = 'templates/' . $filename;
		include $path;
	}
}

interface GluttonView
{
	public function render();
}

interface GluttonModel
{
}
