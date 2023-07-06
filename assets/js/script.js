
const lists_datalink = document.querySelectorAll(".datalink");

for(var i=0; i< lists_datalink.length; i++) {
  let data = lists_datalink[i].id;
  var element2 = document.getElementById(data).id;

    var ele = element2.split("-");

   jQuery('#'+element2).qrcode(
    {
		text	: "https://gs1kenya.org/01/"+ele[1]+"?3103="+ele[2],
    		width	: 200,
     		height: 200,
      		id : "datalink"+ ele[1]
	});

}