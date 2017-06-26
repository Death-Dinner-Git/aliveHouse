function _getCommonFrmMessage(frm, messageKey, defaultMessage) {
  if(
    gSetup.validate && gSetup.validate[frm] &&
    gSetup.validate[frm].messages && gSetup.validate[frm].messages.common &&
    gSetup.validate[frm].messages.common[messageKey]
  ) {
    return gSetup.validate[frm].messages.common[messageKey];
  }
  else {
    return defaultMessage;
  }
}

function checkIfChallenge(body, options) {
  options = options || {}
  if(body && body.challenge) {
    var challenge = body.challenge
    if(challenge.type === 'otp') {
      Forms.show('otp', challenge)
      return true
    }
    else if(challenge.type === 'captcha') {
      if(options.afterCaptcha) {
        afterCaptchaChallengeSuccess = options.afterCaptcha
      }
      if(Forms.getActiveName() === 'captcha') {
        Forms.getActiveObj().init(challenge)
      }
      else {
        Forms.show('captcha', challenge)
      }
      return true
    }
  }
}

function apiSend(url, data, cb) {
  var prefix = gSetup.apiPrefix || ''
  if(typeof data !== 'string') {
    data = JSON.stringify(data)
  }
  $.post(prefix + url, data, cb)
}

var afterCaptchaChallengeSuccess

var _frms = {
  "login": {
    validatorSetuped: false,
    init: function() {
      var $frm = $("#form_login form");
      if (gSetup.token) {
        $('#form_login input[name="token"]').val( gSetup.token );
      }
      if (gSetup.email) {
        $('#form_login input[name="login"]').val( gSetup.email );
      }
      if(!this.validatorSetuped) {
        this.validatorSetuped = true;
        $frm.validate($.extend(true, {
          submitHandler: function() {
            if($frm.hasClass("loading")) {
              return;
            }
            $frm
              .removeClass("form_error")
              .addClass("loading");
            var submitData = {
              login: $frm.find('[name="login"]').val(),
              password: $frm.find('[name="password"]').val()
            }
            apiSend("api/auth", submitData, function(resp) {
              $frm.removeClass("loading");
              if(checkIfChallenge(resp.body, {afterCaptcha: {form: 'login'}})) {
                return
              }
              if(resp.errorCode) {
                $frm.find(".form_error_text").text(
                  _getCommonFrmMessage("login", "wrongLoginOrPassword", "Wrong Login or Password")
                );
                $frm.addClass("form_error");
              }
              else {
                redirectToSuccess();
              }
            });
          },
          errorClass: "wrong",
          rules: {
            login: {
              required: true
            },
            password: {
              required: true
            }
          },
          messages: {
            login:{
              required: "Login is required",
              emailTrimmed: "Please enter valid email"
            },
            password: "Password is required"
          }
        }, gSetup.validate.login));
      }
    },
    destroy: function() {

    }
  },
  "otp": {
    validatorSetuped: false,
    beforeInit: function(challenge) {
      if(!challenge || !challenge.state) {
        Forms.show('login')
        return false
      }
    },
    init: function(challenge) {
      if(!challenge || !challenge.state) {
        return Forms.show('login')
      }
      var $frm = $("#form_otp form");
      if(!this.validatorSetuped) {
        this.validatorSetuped = true;
        $frm.validate($.extend(true, {
          submitHandler: function() {
            if($frm.hasClass("loading")) {
              return;
            }
            $frm
              .removeClass("form_error")
              .addClass("loading");
            var submitData = {
              state: challenge.state,
              answer: $('#form_otp input[name="code"]').val()
            }
            apiSend("api/challenge", submitData, function(resp) {
              $frm.removeClass("loading");
              if(resp.errorCode) {
                $frm.find(".form_error_text").text(
                  _getCommonFrmMessage("otp", "wrongCode", "Wrong code")
                );
                $frm.addClass("form_error");
              }
              else {
                redirectToSuccess();
              }
            });
          },
          errorClass: "wrong",
          rules: {
            code: {
              required: true,
              number: true,
              minlength: 6
            }
          },
          messages: {
            code: {
              required: "Code is required",
              number: "Code must contain only numbers",
              minlength: 'Code must be exactly 6 numbers'
            }
          }
        }, gSetup.validate.otp));
      }
    },
    destroy: function() {

    }
  },
  "captcha": {
    validator: null,
    beforeInit: function(challenge) {
      if(!challenge || !challenge.state || !challenge.image) {
        Forms.show('login')
        return false
      }
    },
    init: function(challenge) {
      if(!challenge || !challenge.state || !challenge.image) {
        return Forms.show('login')
      }
      var $frm = $("#form_captcha form");
      $frm.find('.form_captcha_image_container').empty()
      $frm.find('.form_captcha_image_container').append(
        $('<img>').attr('src', 'data:image/png;base64,' + challenge.image)
      )
      if(this.validator) {
        this.validator.destroy()
      }
      this.validator = $frm.validate($.extend(true, {
        submitHandler: function() {
          if($frm.hasClass("loading")) {
            return;
          }
          $frm
            .removeClass("form_error")
            .addClass("loading");
          var submitData = {
            state: challenge.state,
            answer: $frm.find('input[name="code"]').val()
          }
          function _err() {
            $frm.find(".form_error_text").text(
              _getCommonFrmMessage("captcha", "wrongCode", "Wrong text")
            )
            $frm.find('input[name="code"]').val('')
            $frm.addClass("form_error")
          }
          apiSend("api/challenge", submitData, function(resp) {
            $frm.removeClass("loading");
            if(checkIfChallenge(resp.body)) {
              _err()
              return
            }
            if(resp.errorCode) {
              _err()
            }
            else {
              Forms.show(afterCaptchaChallengeSuccess.form)
              afterCaptchaChallengeSuccess.cb && afterCaptchaChallengeSuccess.cb()
            }
          });
        },
        errorClass: "wrong",
        rules: {
          code: {
            required: true
          }
        },
        messages: {
          code: {
            required: "Code is required"
          }
        }
      }, gSetup.validate.otp));
    },
    destroy: function() {

    }
  },
  "register": {
    validatorSetuped: false,
    init: function() {
      var $frm = $("#form_register form");
      if (gSetup.token) {
        $('#form_register input[name="token"]').val( gSetup.token );
      }
      if (gSetup.email) {
        $('#form_register input[name="login"]').val( gSetup.email );
      }
      if(!this.validatorSetuped) {
        this.validatorSetuped = true;
        $frm.validate($.extend(true, {
          submitHandler: function() {
            if($frm.hasClass("loading")) {
              return;
            }
            $frm
              .removeClass("form_error")
              .addClass("loading");
            var submitData = {
              login: $frm.find('[name="login"]').val(),
              password: $frm.find('[name="password"]').val(),
              service: gSetup.service,
              subscribe: $frm.find('[name="subscribe"]').prop('checked')
            }
            var trySubmit = function() {
              apiSend('api/register', submitData, function(resp) {
                if(checkIfChallenge(resp.body, {afterCaptcha: {form: 'register', cb: trySubmit}})) {
                  return
                }
                $frm.removeClass("loading");
                if(typeof resp !== 'object' || resp.errorCode) {
                  var text = "Registration failed";
                  switch(resp.errorCode) {
                    case -4:
                      text = _getCommonFrmMessage("register", "emailTaken", "E-Mail already taken");
                    break;
                    case -24:
                      text = _getCommonFrmMessage("register", "usernameTaken", "Username already taken");
                    break;
                  }
                  $frm.find(".form_error_text").text(text);
                  $frm.addClass("form_error");
                }
                else {
                  AddonConnector.sendMessage({
                    action: "event:register"
                  });
                  redirectToSuccess();
                }
              });
            }
            trySubmit()
          },
          errorClass: "wrong",
          //errorContainer: $frm.find(".form_error_text"),
          rules: {
            login: {
              required: true,
              emailTrimmed: true
            },
            password: {
              required: true
            },
            repassword: {
              equalTo: "#register-password"
            }
          },
          messages: {
            login:{
              required: "Login is required",
              email: "Please enter valid email"
            },
            username: {
              required: "Username is required"
            },
            password: {
              required: "Password is required",
              minlength: "Password too short, min " + gSetup.passMinLength + " symbols"
            }
          }
        }, gSetup.validate.register));
      }
    },
    destroy: function() {

    }
  },
  "remind": {
    validatorSetuped: false,
    init: function() {
      var $frm = $("#form_remind form");
      if(!this.validatorSetuped) {
        this.validatorSetuped = true;
        $frm.validate($.extend(true, {
          submitHandler: function() {
            if($frm.hasClass("loading")) {
              return;
            }
            $frm
              .removeClass("form_error")
              .removeClass("form_success")
              .addClass("loading");
            var submitData = {
              login: $frm.find('[name="login"]').val()
            }
            apiSend("api/remind", submitData, function(resp) {
              $frm.removeClass("loading");
              if(resp.errorCode) {
                var text = _getCommonFrmMessage("remind", "failed", "Restore password failed");
                $frm.find(".form_error_text").text(text);
                $frm.addClass("form_error");
              }
              else {
                $frm.addClass("form_success");
              }
            });
          },
          errorClass: "wrong",
          messages: {
            login:{
              required: "Login is required",
              email: "Please enter valid email"
            }
          }
        }, gSetup.validate.remind));
      }
    },
    destroy: function() {

    }
  },
  "resetpass": {
    validatorSetuped: false,
    init: function() {
      var $frm = $("#form_resetpass form");
      if(!this.validatorSetuped) {
        this.validatorSetuped = true;
        $frm.validate($.extend(true, {
          submitHandler: function() {
            if($frm.hasClass("loading")) {
              return;
            }
            $frm
              .removeClass("form_error")
              .removeClass("form_success")
              .addClass("loading");
            var formData = $frm.serialize();
            $.post("process.php?a=resetpass", formData, function(resp) {
              $frm.removeClass("loading");
              if(resp.errorCode) {
                var text = _getCommonFrmMessage("resetpass", "failed", "Password reset failed");
                $frm.find(".form_error_text").text(text);
                $frm.addClass("form_error");
              }
              else {
                $frm.addClass("form_success");
                $frm.find("input, button, .form_restore_text").hide();
              }
            });
          },
          errorClass: "wrong",
          rules: {
            password: {
              required: true,
              minlength: 8
            },
            repassword: {
              equalTo: "#reset-password"
            }
          },
          messages: {
            password: {
              required: "Password is required",
              minlength: "Password too short, min " + gSetup.passMinLength + " symbols"
            },
            repassword: {
              equalTo: "Password should be equal"
            }
          }
        }, gSetup.validate.resetpass));
      }
    },
    destroy: function() {
    }
  },
  "invite": {
		init: function() {
			var $frm = $("#form_invite form");

			$("#form_invite input").val( gSetup.token );
			if (gSetup.message) $(".form_invite_message").text( gSetup.message );

			if (gSetup.status == 0	) {
			}
			else if (gSetup.status == 1)  {  // accepted
				$("#form_invite button").hide( );
				$("#form_invite .form_message_status").show( ).html( '<span>Accepted</span>' );
			}
			else if (gSetup.status == 99)  {  // remove
				$("#form_invite button").hide( );
				$("#form_invite .form_message_status").show( ).html( '<span>View Nimbus Threads</span>' ).click(function() {
									if ( !gSetup.successRedirect )   gSetup.successRedirect = "/";
									redirectToSuccess();
								});
			}
			else  {  // refused
				$("#form_invite button").hide( );
				$("#form_invite .form_message_status").show( ).html( '<span>Declined</span>' );
			}

			if (gSetup.user_name != '') {
				$("#form_invite .form_user_name").show( )
					.html( '<span class="label">'+gSetup.user_name+'</span><a class="button" href="/auth/?f=logout&success=%2F" title="Logout"></a>' );
			}

			//---- refused
			$("#form_invite .button-refused").click(function() {

				$frm.removeClass("form_error").addClass("loading");

				var fromData = $frm.serialize();

				$.post("process.php?a=refused", fromData, function(resp) {

					$frm.removeClass("loading");

					redirectToSuccess();
				});

			});

			//---- accepted
			$frm.validate({
				submitHandler: function(){

					$frm.removeClass("form_error").addClass("loading");

					var fromData = $frm.serialize();

					$.post("process.php?a=accepted", fromData, function(resp) {

						$frm.removeClass("loading");

						if(resp.errorCode == 1) {
							document.location = "login?f=login&service="+gSetup.service+"&success=%2F&token="+gSetup.token;
						}
						else if(resp.errorCode == 2) {
							document.location = "login?f=register&service="+gSetup.service+"&success=%2F&token="+gSetup.token;
						}
						else {
							redirectToSuccess();
						}
					});
				},
				errorClass: "wrong",
				messages: {
				  login:{
					required: "Login is required",
					email: "Please enter valid email"
				  },
				  password: "Password is required"
				}
			});

		},
    destroy: function() {
      var $frm = $("#form_invite form");
      $frm.data('validator', null);
      $frm.unbind('validate');
    }
  },
};

var _Forms = function() {
  var
    _active = null,
    _animduration = 0.3,
    self = this;

  function _frmId(name) {
    name = name || _active;
    return "form_"+name;
  }
  function _frm(name) {
    return $("#"+_frmId(name));
  }

  this.getActiveName = function() {
    return _active
  }

  this.getActiveObj = function() {
    return _frms[_active]
  }

  this.show = function(name, params, force) {
    if(_frm(name).length === 0) {
      return;
    }
    if(name == _active) {
      return;
    }
    if(_frms[name].beforeInit) {
      var beforeInitResponse = _frms[name].beforeInit(params)
      if(beforeInitResponse === false) {
        return
      }
    }
    try {
      var stateObj = {};
      var qVars = getQueryVariables();
      qVars.f = name;
      var q = "?" + buildQueryString(qVars);
      history.pushState(stateObj, "Form: " + name, q);
    }
    catch(ex) {
    }
    try {
      parent.postMessage({
        form: name,
        search: document.location.search
      }, '*')
    }
    catch(ex) {
    }
    async.series([
      function(next) {
        if(_active) {
          var old = _frm();
          if(_frms[_active] && _frms[_active].destroy) {
            _frms[_active].destroy();
          }
          old.fadeTo(300, 0, function() {
            old.hide();
            next();
          });
        }
        else {
          next();
        }
      },
      function() {
        _active = name;
        _frm(name).fadeTo(300, 1, function() {
          if(_frms[_active] && _frms[_active].init) {
            _frms[_active].init(params);
          }
        });
      }
    ]);
  };
  this.init = function(def) {
    var activeForm = def;
        f = getQueryVariable("f");
    if(f) {
      activeForm = f;
    }
    this.show(activeForm);
  };

  $(window).on("popstate", function(e) {
    e = e.originalEvent;
    self.init();
  });
};

var Forms = new _Forms();

function redirectToSuccess() {
  AddonConnector.sendMessage({
    action: "event:login"
  });
  document.location = gSetup.successRedirect;
}

function buildQueryString(vars) {
  var res = [];
  for(var k in vars) {
    res.push(k + "=" + encodeURIComponent(vars[k]));
  }
  return res.join("&");
}

function getQueryVariable(variable) {
  var query = window.location.search.substring(1);
  var vars = query.split('&');
  for (var i = 0; i < vars.length; i++) {
    var pair = vars[i].split('=');
    if (decodeURIComponent(pair[0]) == variable) {
      return decodeURIComponent(pair[1]);
    }
  }
  return null;
}

function getQueryVariables() {
  var query = window.location.search.substring(1);
  var vars = query.split('&');
  var d = {};
  for (var i = 0; i < vars.length; i++) {
    var pair = vars[i].split('=');
    if(!pair[0]) {
      continue;
    }
    d[pair[0]] = decodeURIComponent(pair[1]);
  }
  return d;
}

$.ajaxSetup({
  headers: {
    'x-client-software': 'auth_form'
  }
})

$(function() {
  gSetup.validate = gSetup.validate || {};
  $.validator.addMethod("emailTrimmed", function(value, element) {
    value = $.trim(value);
    var res = $.validator.methods.email.call(this, value, element);
    return res;
  }, "Please enter valid email");

  $.validator.addMethod("username", function(value, element) {
    if(/-{2,}/.test(value)) {
      return false;
    }
    if(/^-/.test(value) || /-$/.test(value)) {
      return false;
    }
    return /^[a-z0-9-]+$/i.test(value);
  }, "May only contain alphanumeric characters or single hyphens, and cannot begin or end with a hyphen");

  $("[data-frm]").click(function() {
    Forms.show($(this).attr("data-frm"));
    return false;
  });

  Forms.init("login");

  $("#form_login .social_auth_icon_google").click(function() {
    OpenID.show("google", gSetup.token);
  });
  $("#form_login .social_auth_icon_facebook").click(function() {
    OpenID.show("facebook", gSetup.token);
  });

  OpenID.on("authcomplete", function(event) {
    if(event.registered) {
      AddonConnector.sendMessage({
        action: "event:register"
      });
    }
    redirectToSuccess();
  });

  $(window).on("message", function(e) {
    e = e.originalEvent;
    if(e.data) {
      if(e.data.a == "select-form") {
        if(_frms.hasOwnProperty(e.data.form)) {
          Forms.show(e.data.form);
        }
      }
    }
  });

  $('.go-away-link').click(function() {
    var href = $(this).attr('href')
    try {
      parent.postMessage({
        url: href
      }, '*')
    }
    catch(ex) {
    }
  })

  try {
    parent.postMessage({
      loaded: true
    }, '*')
  }
  catch(ex) {
  }
});
