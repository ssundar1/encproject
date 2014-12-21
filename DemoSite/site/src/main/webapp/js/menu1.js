//  $(function(){
//  /*  if (self.location.href == top.location.href){
//      $("body").css({font:"normal 13px/16px 'trebuchet MS', verdana, sans-serif"});
//      var logo=$("<a href='http://pupunzi.com'><img id='logo' border='0' src='http://pupunzi.com/images/logo.png' alt='mb.ideas.repository' style='display:none;'/></a>");
//      $("body").prepend(logo);
//      $("#logo").fadeIn();
//    }*/
//  });

$(function(){
    $(".myMenu").buildMenu(
    {
      template:"menuVoices.html",
      additionalData:"pippo=1",
      menuWidth:200,
      openOnRight:false,
      menuSelector: ".menuContainer",
      iconPath:"ico/",
      hasImages:true,
      fadeInTime:100,
      fadeOutTime:300,
      adjustLeft:2,
      minZindex:"auto",
      adjustTop:10,
      opacity:.95,
      shadow:false,
      shadowColor:"#ccc",
      hoverIntent:0,
      openOnClick:true,
      closeOnMouseOut:false,
      closeAfter:1000,
      submenuHoverIntent:200
    });

    $(".vertMenu").buildMenu(
    {
      template:"menuVoices.html",
      menuWidth:170,
      openOnRight:true,
      menuSelector: ".menuContainer",
      iconPath:"ico/",
      hasImages:true,
      fadeInTime:200,
      fadeOutTime:200,
      adjustLeft:0,
      adjustTop:0,
      opacity:.95,
      openOnClick:false,
      minZindex:200,
      shadow:false,
      hoverIntent:300,
      submenuHoverIntent:300,
      closeOnMouseOut:true
    });

    $(document).buildContextualMenu(
    {
      template:"menuVoices.html",
      menuWidth:200,
      overflow:2,
      menuSelector: ".menuContainer",
      iconPath:"ico/",
      hasImages:false,
      fadeInTime:100,
      fadeOutTime:100,
      adjustLeft:0,
      adjustTop:0,
      opacity:.99,
      closeOnMouseOut:false,
      onContextualMenu:function(o,e){}, //params: o = the contextual menu,e = the event
      shadow:false
    });
  });

  //this function get the id of the element that fires the context menu.
  function testForContextMenu(el){
    if (!el) el= $.mbMenu.lastContextMenuEl;
    alert("the ID of the element is:   "+$(el).attr("id"));
  }

  function recallcMenu(el){
    if (!el) el= $.mbMenu.lastContextMenuEl;
    var cmenu=+$(el).attr("cmenu");
    $(cmenu).remove();
  }

  function loadFlash(){
    $.ajax({
      url:"testFlash/test.html",
      success:function(html){
        $("#flashTest").html(html);
      }
    });
  }

  function showMessage(msg){
    var msgBox=$("<div>").addClass("msgBox");
    $("body").append(msgBox);
    msgBox.append("You click on: <br>"+msg);
    setTimeout(function(){msgBox.fadeOut(500,function(){msgBox.remove();})},3000)
  }