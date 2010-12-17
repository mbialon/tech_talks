// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults


$(document).ready(function(){
    
//$("div.contentToChange p.firstparagraph:hidden").slideDown("slow");
//$("div.contentToChange p.firstparagraph:visible").slideUp("slow");

//$("input.buttonAsize").click(function(){$("div.attachment").slideUp("slow")});
$("div.kliker").click(function(){$("div.attachment").toggle("slow")});


$("p#attachments").click(function(){$("div.attachments").toggle("slow")});

$("p#attendants").click(function(){$("div.attendants").toggle("slow")});

$("p#comments").click(function(){$("div.comments").toggle("slow")});



$("div.attachment").hide();


$("div.attendants").hide();

$("div.attachments").hide();

$("div.comments").hide();

});
