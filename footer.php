<?php
/**
 * footer.php
 */

class FooterView implements GluttonView
{
	public function render() {
		Glutton::template( 'footer.php', array() );
	}
}
