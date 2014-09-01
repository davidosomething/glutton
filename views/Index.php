<?php
class IndexView extends GluttonView
{

	public function __construct() {
		parent::__construct( __CLASS__ );
		$args = array();
		$this->query = new WP_Query( $args );
	}

	public function render() {
		get_header();

		$data = array(
			'items' => array(
				array(
					'id' => 1,
					'type' => 'post',
				),
				array(
					'id' => 2,
					'type' => 'post',
				),
			),
		);

		$this->template( 'body.php', $data );
		get_footer();
	}

}

