var _OpenID = function() {
  var self = this;

  var providers = {
    "google": {
      size: {
        width: 500,
        height: 500
      }
    },
    "facebook": {
      size: {
        width: 500,
        height: 500
      }
    }
  };

  this.show = function(provider, token) {
    if(!providers[provider]) {
      return;
    }
    var left = (screen.width/2)-(providers[provider].size.width/2);
    var top = (screen.height/2)-(providers[provider].size.height/2);
    var url = "openidconnect.php?provider="+provider;
    if (token) url += '&token='+token;
    window.open(url, "openid_"+provider, "left="+left+",top="+top+",width="+providers[provider].size.width+",height="+providers[provider].size.height);
  };

  $(window).on("message", function(e) {
    e = e.originalEvent;
    if(e.data && e.data.a == "openid-auth-completed") {
      self.emit("authcomplete", {
        registered: e.data.registered
      });
    }
  });
};
_OpenID.prototype = new EventEmitter();
var OpenID = new _OpenID();
