$(document).ready(function() {
  var map;
  var geocoder;
  var addLocationEventListener;
  
  function placeMarker(location) {
    var clickedLocation = new google.maps.LatLng(location);
    var marker = new google.maps.Marker({
      position: location, 
      map: map
    });

    map.setCenter(location);
    return marker;
  }
  
  function initBasicGoogleMaps(map_id) {
    var myOptions = {
      zoom: 11,
      mapTypeControlOptions: {style: google.maps.MapTypeControlStyle.DROPDOWN_MENU},
      mapTypeId: google.maps.MapTypeId.ROADMAP
    }
    map = new google.maps.Map(document.getElementById(map_id), myOptions);
    geocoder = new google.maps.Geocoder();
    
    if (google.loader.ClientLocation) {
      map.setZoom(12);
      map.setCenter(new google.maps.LatLng(google.loader.ClientLocation.latitude, google.loader.ClientLocation.longitude));
    } else {
      // If not found, default to center of states and canada.
      map.setCenter(new google.maps.LatLng(39.300299,-90.263672));
      map.setZoom(3);
    }

  }
  
  function initAddLocationGoogleMaps() {
    initBasicGoogleMaps("map_canvas");
    
    $("#add_location").click(function() {
      if (addLocationEventListener == undefined) {
        addLocationEventListener = google.maps.event.addListener(map, 'click', function(event) {
          var marker = placeMarker(event.latLng);
          
          displayPopupForm(marker, event.latLng.b, event.latLng.c);
          
        });
      }
      
    });
  }
  
  function displayPopupForm(marker, latitude, longitude) {
    var contentString = '<div id="content">'+
                        '<h4>Enter the location description</h4>'+
                        '<div>'+
                        'Name: <input type="text" id="location_name" name="location_name" value="" /><br/>'+
                        'Description: <input type="text" id="location_description" name="location_description" value="" /><br/>'+
                        '<button id="save_location" type="button">Save</button>'+
                        '</div>'+
                        '</div>';
    var infowindow = new google.maps.InfoWindow({ content: contentString })
    infowindow.open(map, marker);
    
    $("#save_location").live('click', function() {
      console.log("Make ajax request to save information.");
      
      $.ajax({
        url: "/locations/insert",
        async: false,
        data: {
          "name": $("#location_name").val(),
          "description": $("#location_description").val(),
          "latitude": latitude,
          "longitude": longitude
        },
        success: function(data) {
          console.log(data);
          console.log(data.result);
          
          if (data.result) {
            $(".container").prepend("<div class='flash_message'>"+data.message+"</div>")
            msgFadeOut(".flash_message");
            
            // Remove infowindow and marker when location was successfully saved.
            infowindow.close(map, marker);
            marker.setMap(null);
            
          } else {
            $(".container").prepend("<div class='flash_error'>"+data.message+"</div>")
            msgFadeOut(".flash_error");
          }
        },
        error: function(XMLHttpRequest, textStatus, errorThrown) {
          console.log("Error.");
          console.log(XMLHttpRequest);
          console.log(textStatus);
          console.log(errorThrown);
          
          $(".container").prepend("<div class='flash_error'>"+data.message+"</div>")
          msgFadeOut(".flash_error");
        },
        dataType: 'json'
      });

    });
    
    console.log("Removing event listeners");
    google.maps.event.removeListener(addLocationEventListener);
    addLocationEventListener = undefined;
    return true;
  }
  
  function initDisplayLocationGoogleMaps() {
    initBasicGoogleMaps("map_canvas");
    
    var marker = new google.maps.Marker({
      position: myLatlng,
      map: map,
      title: "Boys and girls club, Dieppe"
    });
    
    // Information windows that displays the description of the location when
    // you click on a marker
    var contentString = '<div id="content">'+
                        '<h4>Boys and girls club, Dieppe</h4>'+
                        '<div>'+
                        '<p>At the Boys and girls club, Dieppe, we can play 4 on 4. '+
                        'We try to be 18 guys out there.</p>'+
                        '</div>'+
                        '</div>';
    var infowindow = new google.maps.InfoWindow({ content: contentString });
    google.maps.event.addListener(marker, 'click', function() { infowindow.open(map, marker); });
  }
  
  
  if ($("#map_canvas").length != 0) {
    google.load("maps", "3",  {callback: initAddLocationGoogleMaps, other_params:"sensor=false"});
  }

});
