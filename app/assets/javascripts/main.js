jQuery(document).ready(function($){
    'use strict';
    jQuery('body').backstretch([
        "images/bg/bg1.jpg",
        "images/bg/bg2.jpg",
        "images/bg/bg3.jpg"
    ], {duration: 5000, fade: 500, centeredY: true });

    $("#mapwrapper").gMap({ controls: false,
        scrollwheel: false,
        markers: [{
            latitude:40.7566,
            longitude: -73.9863,
            icon: { image: "images/marker.png",
                iconsize: [44,44],
                iconanchor: [12,46],
                infowindowanchor: [12, 0] } }],
        icon: {
            image: "images/marker.png",
            iconsize: [26, 46],
            iconanchor: [12, 46],
            infowindowanchor: [12, 0] },
        latitude:40.7566,
        longitude: -73.9863,
        zoom: 14 });
});