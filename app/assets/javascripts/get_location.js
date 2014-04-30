// <script type="text/javascript">
	function showLocation(position) {
	  var latitude = position.coords.latitude;
	  var longitude = position.coords.longitude;
	}

	function errorHandler(err) {
	  if(err.code == 1) {
	    alert("Error: Access is denied!");
	  }else if( err.code == 2) {
	    alert("Error: Position is unavailable!");
	  }
	}
	function getLocation(){

	   if(navigator.geolocation){
	      // timeout at 60000 milliseconds (60 seconds)
	      var options = {timeout:60000};
	      navigator.geolocation.getCurrentPosition(showLocation, 
	                                               errorHandler,
	                                               options);
	   }else{
	      alert("Sorry, browser does not support geolocation!");
	   }
	}
// </script>