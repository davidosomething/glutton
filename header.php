<?php
/**
 * header.php
 */

class HeaderView implements GluttonView
{
	public function render() {
		Glutton::template( 'head.php', array() );
	}
}
