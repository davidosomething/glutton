<?php
/**
 * Class: HeaderView
 *
 * @see GluttonView
 */
class HeaderView extends GluttonView
{
	/**
	 * render
	 *
	 */
	public function render() {
		$this->template( 'head.php', array() );
	}
}

