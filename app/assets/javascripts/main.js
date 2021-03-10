jQuery(document).ready(function($){
    'use strict';
    jQuery('body').backstretch([
        "https://res.cloudinary.com/hzmasyelt/image/upload/v1615319920/earth.jpg",
        "https://res.cloudinary.com/hzmasyelt/image/upload/v1615319936/moon.jpg",
        "https://res.cloudinary.com/hzmasyelt/image/upload/v1615319940/moon_and_astronaut.jpg",
        "https://res.cloudinary.com/hzmasyelt/image/upload/v1615319928/astronaut_2.jpg",
        "https://res.cloudinary.com/hzmasyelt/image/upload/v1615319932/astronaut.jpg"
    ], {duration: 5000, fade: 500, centeredY: true });


    $('.selectBoxSingle').selectator({
        labels: {
            search: 'Search here...'
        },
        selectFirstOptionOnSearch: false,
        useDimmer: true,
        searchFields: 'value text subtitle right'
    });
});
