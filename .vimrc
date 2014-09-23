let g:syntastic_php_phpcs_args="--report=csv --standard=WordPress"

" so syntastic knows where to look for the sassy-maps import
let g:syntastic_scss_sass_args = "-r sass-json-vars -r sassy-maps"
