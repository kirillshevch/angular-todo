window.fbAsyncInit = ->
  FB.init
    appId: "490725597752057"
    xfbml: true
    version: "v2.3"


((d, s, id) ->
  js = undefined
  fjs = d.getElementsByTagName(s)[0]
  return  if d.getElementById(id)
  js = d.createElement(s)
  js.id = id
  js.src = "//connect.facebook.net/en_US/sdk.js"
  fjs.parentNode.insertBefore js, fjs
) document, "script", "facebook-jssdk"