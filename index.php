<?php
/**
 * index.php
 * View-Controller for index
 */

class IndexView implements GluttonView
{

	public function __construct() {
	}

	public function render() {
		get_header();
		get_footer();

		$globalHeader = new HeaderView();
		$globalHeader->render();

		Glutton::template( 'body.php' );

		$globalFooter = new FooterView();
		$globalFooter->render();
	}

}

$v = new IndexView();
$v->render();
