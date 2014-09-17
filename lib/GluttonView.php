<?php
/**
 * @TODO dependency inject the template renderer
 */
abstract class GluttonView
{
	static protected $m;

	private $_themePath;
	private $_child;
	public $query;

	/**
	 * __construct
	 *
	 * call parent::__construct if you need to use mustache templates
	 *
	 * @param string $child __CLASS__ of child
	 */
	public function __construct( $child = null ) {
		$this->_themePath  = dirname( __DIR__ );
		$this->_child = $child;

		static::$m = new Mustache_Engine(array(
			'loader' => new Mustache_Loader_FilesystemLoader( $this->_themePath . '/templates' ),
			'partials_loader' => new Mustache_Loader_FilesystemLoader( $this->_themePath . '/templates/partials' ),
		));
	}

	public function mustache( $filepath, $data = array() ) {
		if ( empty( $filepath ) ) {
			throw new Exception( 'mustache needs a filepath' );
		}
		$template = static::$m->loadTemplate( $filepath );
		return $template->render( $data );
	}

	public function template( $_filename, $data = array() ) {
		extract( $data );

		if ( empty( $_filename ) ) {
			throw new Exception( 'template needs a filename' );
		}

		$path = Glutton::theme( '/templates/' . $_filename );
		include $path;
	}
}

