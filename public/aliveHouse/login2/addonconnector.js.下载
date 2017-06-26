var AddonConnector = new function(){

	var self = this;

	var isConnectionEstablished = false;

	var lastMessageId = 0;

	// messageId - callback data associations
	var messagesCallbacks = {};



	this.sendMessage = function( data, callback ){

		if( !isConnectionEstablished ){
			if( callback ){
				callback( null );
			}
			return;
		}

		sendMessage( data, callback );

	};

	this.isConnected = function(){
		return isConnectionEstablished;
	};

	function sendMessage( data, callback ){
		var messageId = ++lastMessageId;
		var msg = {
			id: messageId,
			type: "EverHelperExtMessage",
			data: data
		};

		if( callback ){
			messagesCallbacks[ messageId ] = {
				time: new Date().getTime(),
				callback: callback
			};
		}
		window.postMessage(msg, "*");
	}

	function connect(){

	 	if( isConnectionEstablished ){
			return;
		}

		sendMessage( {
			action: "connect"
		}, function(){

			isConnectionEstablished = true;

		} );

	}

	window.addEventListener("message", function(event){


	    if (event.source && event.source != window){
			return;
		}

	    if (event.data.data && event.data.type && (event.data.type == "EverHelperExtMessage")) {

			var data = event.data.data;

			if( !data.action ){
				return;
			}

			switch( data.action ){

				case "_response":

					if( messagesCallbacks[ event.data.responseToId ] ){
						messagesCallbacks[ event.data.responseToId ].callback( data );
						delete messagesCallbacks[ event.data.responseToId ];
					}

				break;

			}

		}

	});

	// starting cleanup callbacks interval
	setInterval( function(){
		var maxTTL = 60 * 1000;
		if(window.Config) {
			maxTTL = Config.maxLifeTimeAddonConnectorCallback;
		}
		var now = new Date().getTime();

		for( var messageId in messagesCallbacks ){
			var data = messagesCallbacks[ messageId ];

			if( now - data.time >= maxTTL ){
				delete messagesCallbacks[ messageId ];
			}
		}

	}, 60 * 1000 );

	$(function(){
		connect();
	});

};
