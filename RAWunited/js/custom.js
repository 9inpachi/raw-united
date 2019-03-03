$(document).ready(function () {
    $('#nav-search').click(function (e) {
        $('#headerSearchForm').toggleClass('active');
        if ($(this).children('.fa').hasClass('fa-search')) {
            $(this).children('.fa').removeClass('fa-search');
            $(this).children('.fa').addClass('fa-times');
        } else {
            $(this).children('.fa').removeClass('fa-times');
            $(this).children('.fa').addClass('fa-search');
        }
    })


    var options = {
        nextButton: true,
        prevButton: true,
        animateStartingFrameIn: true,
        autoPlayDelay: 3000,
        preloader: true,
        pauseOnHover: false,
        preloadTheseFrames: [1]
    };

    var sequence = $("#sequence").sequence(options).data("sequence");

    sequence.afterLoaded = function () {
        $("#sequence-theme .nav").fadeIn(100);
        $("#sequence-theme .nav li:nth-child(" + (sequence.settings.startingFrameID) + ") img").addClass("active");
    }

    sequence.beforeNextFrameAnimatesIn = function () {
        $("#sequence-theme .nav li:not(:nth-child(" + (sequence.nextFrameID) + ")) img").removeClass("active");
        $("#sequence-theme .nav li:nth-child(" + (sequence.nextFrameID) + ") img").addClass("active");
    }

    $("#sequence-theme").on("click", ".nav li", function () {
        $(this).children("img").removeClass("active").children("img").addClass("active");
        sequence.nextFrameID = $(this).index() + 1;
        sequence.goTo(sequence.nextFrameID);
    });
    $('.model').click(function () {
        var img = $(this).attr('src');
        window.open(document.location.origin + "/" + img);
    })


})
//Get rating
function setDefaultRating(ratingClass) {
    $(ratingClass + ' .rating').each(function () {
        var rating = parseInt($(this).html());
        var $parent = $(this).parent(ratingClass);
        $parent.children('.fa-star').remove();
        for (var i = 1; i <= 5; i++) {
            if (i <= rating) {
                $parent.append('<i data-rating-val=' + i + ' class="fas fa-star"></i>');
            } else {
                $parent.append('<i data-rating-val=' + i + ' class="far fa-star"></i>');
            }
        }
    });
}