
(function () {
    'use strict';

    var bindFacebookEvents, bindTwitterEventHandlers, fb_events_bound,
        fb_root, initializeFacebookSDK, loadFacebookSDK, renderTweetButtons,
        restoreFacebookRoot, saveFacebookRoot, twttr_events_bound;

    // Load FB like button when page loads via Turbolinks
    // http://reed.github.io/turbolinks-compatibility/facebook.html

    fb_root = null;

    fb_events_bound = false;

    $(function () {
        loadFacebookSDK();
        if (!fb_events_bound) {
            return bindFacebookEvents();
        }
    });

    bindFacebookEvents = function () {
        $(document).on('page:fetch', saveFacebookRoot).on('page:change', restoreFacebookRoot).on('page:load', function () {
            return typeof FB !== "undefined" && FB !== null ? FB.XFBML.parse() : void 0;
        });
        return fb_events_bound = true;
    };

    saveFacebookRoot = function () {
        return fb_root = $('#fb-root').detach();
    };

    restoreFacebookRoot = function () {
        if ($('#fb-root').length > 0) {
            return $('#fb-root').replaceWith(fb_root);
        } else {
            return $('body').append(fb_root);
        }
    };

    loadFacebookSDK = function () {
        window.fbAsyncInit = initializeFacebookSDK;
        return $.getScript("//connect.facebook.net/en_US/all.js#xfbml=1");
    };

    initializeFacebookSDK = function () {
        return FB.init({
            appId: '123399507681914',
            channelUrl: '//www.desiringgod.org/channel.html',
            status: true,
            cookie: true,
            xfbml: true
        });
    };

    // Load Twitter button when page loads via Turbolinks
    // http://reed.github.io/turbolinks-compatibility/twitter.html

    twttr_events_bound = false;

    $(function () {
        if (!twttr_events_bound) {
            return bindTwitterEventHandlers();
        }
    });

    bindTwitterEventHandlers = function () {
        $(document).on('page:load', renderTweetButtons);
        return twttr_events_bound = true;
    };

    renderTweetButtons = function () {
        $('.twitter-share-button').each(function () {
            var button;
            button = $(this);
            if (button.data('url') == null) {
                button.attr('data-url', document.location.href);
            }
            if (button.data('text') == null) {
                return button.attr('data-text', document.title);
            }
        });
        return twttr.widgets.load();
    };

}).call(this);