<?php
class Glutton
{
	static protected $_version;
	static public function version() {
		if ( ! static::$_version ) {
			$composer_json_file = trailingslashit( get_stylesheet_directory_uri() ) . 'composer.json';
			$composer_json_data = file_get_contents( $composer_json_file );
			$composer_data = json_decode( $composer_json_data );
			static::$_version = $composer_data->version;
		}
		return static::$_version;
	}

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

	/**
	 * @param string $filepath
	 */
	static public function theme( $filepath ) {
		return get_stylesheet_directory() . $filepath;
	}

	/**
	 * scripts
	 *
	 * Hook this function to add scripts
	 */
	static public function scripts() {
		wp_enqueue_script('glutton-lib',
			get_stylesheet_directory_uri() . '/static/app/lib.js',
			array(),
			null,
			true
		);
		wp_enqueue_script('glutton-main',
			get_stylesheet_directory_uri() . '/static/app/app.js',
			array( 'glutton-lib' ),
			null,
			true
		);
	}

	/**
	* glutton_bugsnag
	*
	* Echo out the bugsnag snippet for JS error tracking
	*/
	static public function bugsnag() {
		$glutton_bugsnag_api_key = GLUTTON_BUGSNAG_API_KEY;
		$glutton_app_version = Glutton::version();
		echo <<<SNIPPET
		<script src="//d2wy8f7a9ursnm.cloudfront.net/bugsnag-2.min.js"
			data-apikey="{$glutton_bugsnag_api_key}"
			data-appversion="{$glutton_app_version}"></script>
SNIPPET;
	}

	/**
 	* glutton_rollbar
 	*
 	* Echo out the rollbar snippet for JS error tracking
 	*/
	static public function rollbar() {
		$glutton_rollbar_access_token = GLUTTON_ROLLBAR_CLIENTSIDE_TOKEN;
		$glutton_env = WP_ENV;
		echo <<<SNIPPET
		<script>
		var _rollbarConfig = {
			accessToken: "{$glutton_rollbar_access_token}",
			captureUncaught: true,
			payload: {
				environment: "{$glutton_env}"
			}
		};
		!function(a,b){function c(b){this.shimId=++h,this.notifier=null,this.parentShim=b,this.logger=function(){},a.console&&void 0===a.console.shimId&&(this.logger=a.console.log)}function d(b,c,d){!d[4]&&a._rollbarWrappedError&&(d[4]=a._rollbarWrappedError,a._rollbarWrappedError=null),b.uncaughtError.apply(b,d),c&&c.apply(a,d)}function e(b){var d=c;return g(function(){if(this.notifier)return this.notifier[b].apply(this.notifier,arguments);var c=this,e="scope"===b;e&&(c=new d(this));var f=Array.prototype.slice.call(arguments,0),g={shim:c,method:b,args:f,ts:new Date};return a._rollbarShimQueue.push(g),e?c:void 0})}function f(a,b){if(b.hasOwnProperty&&b.hasOwnProperty("addEventListener")){var c=b.addEventListener;b.addEventListener=function(b,d,e){c.call(this,b,a.wrap(d),e)};var d=b.removeEventListener;b.removeEventListener=function(a,b,c){d.call(this,a,b&&b._wrapped?b._wrapped:b,c)}}}function g(a,b){return b=b||this.logger,function(){try{return a.apply(this,arguments)}catch(c){b("Rollbar internal error:",c)}}}var h=0;c.init=function(a,b){var e=b.globalAlias||"Rollbar";if("object"==typeof a[e])return a[e];a._rollbarShimQueue=[],a._rollbarWrappedError=null,b=b||{};var h=new c;return g(function(){if(h.configure(b),b.captureUncaught){var c=a.onerror;a.onerror=function(){var a=Array.prototype.slice.call(arguments,0);d(h,c,a)};var g,i,j="EventTarget,Window,Node,ApplicationCache,AudioTrackList,ChannelMergerNode,CryptoOperation,EventSource,FileReader,HTMLUnknownElement,IDBDatabase,IDBRequest,IDBTransaction,KeyOperation,MediaController,MessagePort,ModalWindow,Notification,SVGElementInstance,Screen,TextTrack,TextTrackCue,TextTrackList,WebSocket,WebSocketWorker,Worker,XMLHttpRequest,XMLHttpRequestEventTarget,XMLHttpRequestUpload".split(",");for(g=0;g<j.length;++g)i=j[g],a[i]&&a[i].prototype&&f(h,a[i].prototype)}return a[e]=h,h},h.logger)()},c.prototype.loadFull=function(a,b,c,d){var e=g(function(){var a=b.createElement("script"),e=b.getElementsByTagName("script")[0];a.src=d.rollbarJsUrl,a.async=!c,a.onload=f,e.parentNode.insertBefore(a,e)},this.logger),f=g(function(){if(void 0===a._rollbarPayloadQueue)for(var b,c,d,e,f=new Error("rollbar.js did not load");b=a._rollbarShimQueue.shift();)for(d=b.args,e=0;e<d.length;++e)if(c=d[e],"function"==typeof c){c(f);break}},this.logger);g(function(){c?e():a.addEventListener?a.addEventListener("load",e,!1):a.attachEvent("onload",e)},this.logger)()},c.prototype.wrap=function(b){try{if("function"!=typeof b)return b;if(b._isWrap)return b;if(!b._wrapped){b._wrapped=function(){try{return b.apply(this,arguments)}catch(c){throw a._rollbarWrappedError=c,c}},b._wrapped._isWrap=!0;for(var c in b)b.hasOwnProperty(c)&&(b._wrapped[c]=b[c])}return b._wrapped}catch(d){return b}};for(var i="log,debug,info,warn,warning,error,critical,global,configure,scope,uncaughtError".split(","),j=0;j<i.length;++j)c.prototype[i[j]]=e(i[j]);var k="//d37gvrvc0wt4s1.cloudfront.net/js/v1.1/rollbar.min.js";_rollbarConfig.rollbarJsUrl=_rollbarConfig.rollbarJsUrl||k;var l=c.init(a,_rollbarConfig);l.loadFull(a,b,!1,_rollbarConfig)}(window,document);
		</script>
SNIPPET;
	}

	/**
 	* jsmonitor
 	*
 	* Echo out the JSMonitor.io snippet for JS error tracking
 	*/
	static public function jsmonitor() {
		echo <<<SNIPPET
		<script type="text/javascript">
		var ue_params = ue_params || [];ue_params.push("UE-206861348");
		(function() {var ue = document.createElement('script'); ue.type = 'text/javascript'; ue.async = true;
		ue.src = (("https:" == document.location.protocol) ? "https://" : "http://") + 'app.jsmonitor.io/js/jsmonitor.js';
		var script = document.getElementsByTagName('script')[0]; script.parentNode.insertBefore(ue, script);})();
		errors = []; window.onerror = function(){ errors.push(arguments); UEInfo.run(); }
		</script>
SNIPPET;
	}
}

