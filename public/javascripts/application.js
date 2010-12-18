// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults


function formatLinkForPaginationURL(location) {
  //$("div.pagination").find("a").each(function(){
    $(location).find("div.pagination a").each(function(){
      var linkElement = $(this);
      var paginationURL = linkElement.attr("href");
      linkElement.attr({
          "url": paginationURL,
          "href": "#"
      });
      
      linkElement.click(function() {
          $(location).load(
            $(this).attr('url')
          );
          return false;
      });
     
      //$(this).css('background-color','red');
  });
  
  //${'div#users_display_section div.pagination').find("a").each(function(){
  //${"div.pagination").find("a").each(function(){
  
    //alert($(this));
    
     
}



/*
$(document).ready(function(){

var zapisaniHidden = "Pokaż kursantów";
var zapisaniShown = "Ukryj kursantów";

var zalacznikiHidden = "Pokaż załączniki";
var zalacznikiShown = "Ukryj załączniki";


var komentarzeHidden = "Pokaż komentarze";
var komentarzeShown = "Ukryj komentarze";
    
//$("div.contentToChange p.firstparagraph:hidden").slideDown("slow");
//$("div.contentToChange p.firstparagraph:visible").slideUp("slow");

//$("input.buttonAsize").click(function(){$("div.attachment").slideUp("slow")});
$("button#wgrajplik").click(function(){$("div.attachment").toggle("slow")});


$("button#attendants").click(
  function(){
    if($("div.attendants").is(":hidden"))
    {
      $("button#attendants").text(zapisaniShown);
    }
    else
    {
      $("button#attendants").text(zapisaniHidden);
    }
    $("div.attendants").toggle("slow");
    //$("button#attendants").text(zapisaniHidden);
    
  }
);

$("button#attachments").click(
  function(){
    if($("div.attachments").is(":hidden"))
    {
      $("button#attachments").text(zalacznikiShown);
    }
    else
    {
      $("button#attachments").text(zalacznikiHidden);
    }
  $("div.attachments").toggle("slow")
  }
);

$("button#comments").click(
  function(){
    if($("div.comments").is(":hidden"))
    {
      $("button#comments").text(komentarzeShown);
    }
    else
    {
      $("button#comments").text(komentarzeHidden);
    }
  $("div.comments").toggle("slow")
  }
);



$("div.attachment").hide();


$("div.attendants").hide();

$("div.attachments").hide();

$("div.comments").hide();

});*/
