$(document).ready(function() {
  $('div').mousemove(function( event ){
    if (!$('html').hasClass('shiny-busy')) {
    $( "div" ).removeClass( "ggiraph-toolbar" );
    $( "div" ).removeClass( "ggiraph-toolbar-block shinyonly" );
    $( "div" ).removeClass( "ggiraph-toolbar-icon" );
    $( "a" ).removeClass( "drop" );
    $( "a" ).removeClass( "neutral" );
    //else {}
  }
  $('[class^="tooltip"]').css('font-size','16px');
})
//  setTimeout(function() {
//  }, 15000);
})
