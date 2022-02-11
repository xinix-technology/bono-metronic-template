$(function() {
	// HIGHLIGHT MENU LAYOUT 1, 2 & 4
    $(".menu-item:not(.menu-item-submenu) > a").each(function() {
        var href = window.location.href.replace(/\?.*/g, "");
        if ($(this).attr('href') == href || href.indexOf($(this).attr('href') + '/') > -1) {
            $(this).parent().addClass('menu-item-active');
            $(this).parent().parents('.menu-item-submenu').addClass(' menu-item-open');
        }
    })

    // $('.nav-item .sub-menu').each(function() {
    // 	// console.log($(this).find('li').length);
	//     if ($(this).find('li').length == 0) {
	// 	   $(this).parents('li.nav-item').find('.arrow').hide();
	// 	   $(this).siblings('a').removeClass('nav-toggle');
	// 	   $(this).hide();
	// 	   // console.log($(this).parents('li.nav-item.open.active').find('.arrow'));
	// 	}
    // });

    // // HIGHLIGHT MENU LAYOUT 3
    // $('.navbar-nav .menu-dropdown > a').each(function(){
    // 	var href = window.location.href.replace(/\?.*/g, "");
    // 	// console.log(href);
    // 	if ($(this).attr('href') == href || ((href.indexOf($(this).attr('href') + '/') > -1) && !$(this).parent().hasClass('start'))) {
    // 		$('.menu-dropdown').removeClass('active');
    // 		$(this).parent().addClass('active');
    // 	}
    // });

    // // HIGHLIGHT MENU LAYOUT 5
    // $('.dropdown-fw > a').each(function() {
    // 	// console.log($('.navbar-nav .dropdown > a'));
    // 	var href = window.location.href.replace(/\?.*/g, "");
    // 	if ($(this).attr('href') == href || ((href.indexOf($(this).attr('href') + '/') > -1) && !$(this).parent().hasClass('start'))) {
    // 		$('.dropdown-fw').removeClass('active');
    // 		$('.dropdown-fw').removeClass('open');
    // 		$('.dropdown-fw').removeClass('selected');
    // 		$(this).parent().addClass('active open selected');
    // 	}
    // });
});