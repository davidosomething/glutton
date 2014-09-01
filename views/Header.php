<?php

class HeaderView extends GluttonView
{
	public function render() {
		$this->template( 'head.php', array() );
	}
}

