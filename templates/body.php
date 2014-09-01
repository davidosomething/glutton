<body <?php body_class(); ?>>

<div class="pane pane--left">
	<?php echo $this->mustache( 'articlelisting/tiny.mustache', $data ); ?>
</div>

<div class="pane pane--main">
	<?php echo $this->mustache( 'articlelisting/default.mustache', $data ); ?>
<div>

</body>
