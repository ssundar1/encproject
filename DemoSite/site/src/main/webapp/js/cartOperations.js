function breadcumbClickEvent(current) {
	 var href = $(current).attr("href");
	 window.location.replace(href);
}

function yesClickMethod(current) {
	var cat = $('#ch_material').attr('name');
	if (cat.contains('blouse')) {
		// similar behavior as an HTTP redirect
		window.location.replace("/bls-material");
	} else {
		// similar behavior as an HTTP redirect
		window.location.replace("/chud-material");
	}
}

//for drag and drop event in home screen
	function allowDrop(ev) {
	    ev.preventDefault();
	}

	function drag(ev) {
	    ev.dataTransfer.setData("text", ev.target.href);
	    console.log(ev.target.href);
	}

	function drop(ev) {
	    ev.preventDefault();
	    var data = ev.dataTransfer.getData("text");
	    //ev.target.appendChild(document.getElementById(data));
	    window.location.href = data;
	}
$(function() {
	// Set up basic options for the cart fancybox
	var fancyCartOptions = {
		maxWidth : 940,
		maxHeight : 570,
		fitToView : false,
		width : '100%',
		height : '100%',
		autoSize : true,
		closeClick : false,
		topRatio : 0,
		openEffect : 'none',
		closeEffect : 'none',
		type : 'ajax',
		padding : 5
	};

	var fancyProductOptionsOptions = {
		maxWidth : 180,
		fitToView : false,
		width : '100%',
		height : '100%',
		autoSize : true,
		closeClick : false,
		openEffect : 'none',
		closeEffect : 'none'
	};

	// This will change the header "X item(s)" text to the new count and
	// pluralization of "item"
	function updateHeaderCartItemsCount(newCount) {

		// Pull the word that was set in the html from the internationalized
		// version from the locale
		var singularItem = $('span#headerCartItemWordSingluar_i18n').text();
		var plurarlItem = $('span#headerCartItemWordPlural_i18n').text();

		$('.headerCartItemsCount').html(newCount);
		$('.headerCartItemsCountWord').html(
				(newCount == 1) ? singularItem : plurarlItem);
	}

	function updateWithPromo(promo) {
		$('.headerCartItemCount').html();
	}

	// Hides the add to cart/add to wishlist button and shows the in cart/in
	// wishlist button
	// orderType can either be 'cart' or 'wishlist'
	function showInCartButton(productId, orderType) {
		$('.productActions' + productId).children('.in_' + orderType)
				.removeClass('hidden');
		$('.productActions' + productId).children('.add_to_' + orderType)
				.addClass('hidden');
	}
	
	function showCheckMark(productId, orderType){
		$('.progress').find('.active').next().next().addClass('blink');
		$('.progress').find('.active').next().next().children('.title').addClass('tblink');
		$('.progress').find('.active').next().next().removeClass('dis');
		//var pos = $('.progress').find('.active').next().next().children('.label').text();
		//if(pos == 3){
			$('#dialog-box').css({'display':'block'});
		//}
		$('.check').css('display','none');
		$('.productActions' + productId).prev().children().children('.check').css('display','block');
		$('.add_to_cart').removeClass('hidden');
		$('.productActions' + productId).children('.add_to_' + orderType).addClass('hidden');
	}
		
	// Hides the in cart/in wishlist button and shows the add to cart/add to
	// wishlist button
	// orderType can either be 'cart' or 'wishlist'
	function showAddToCartButton(productId, orderType) {
		$('.productActions' + productId).children('.add_to_' + orderType)
				.removeClass('hidden');
		$('.productActions' + productId).children('.in_' + orderType).addClass(
				'hidden');
	}

	$("#tabs").tabs();

	// Show the cart in a modal when any link with the class "fancycart" is
	// clicked
	$('body').on('click', 'a.fancycart', function() {
		var extendedOptions = $.extend({
			href : $(this).attr('href')
		}, fancyCartOptions);

		if ($(this).hasClass('refreshonclose')) {
			extendedOptions = $.extend({
				afterClose : function() {
					window.location.reload();
				}
			}, extendedOptions);
		}

		$.fancybox.open(extendedOptions);
		return false;
	});

	$('body').on('click', 'input.small', function() {
		var inputVal= $(".pp").val();
		if(inputVal.length == 0){
			$(".phnoevalerror").text("Please enter Phone number");
			/*$(".pp").addClass("fieldError");*/
		}else {
			$(".phnoevalerror").text("");
			/*$(".pp").removeClass("fieldError");*/
		}
	});
	
	// Intercept add to cart operations and perform them via AJAX instead
	// This will trigger on any input with class "addToCart" or "addToWishlist"
	$('body')
			.on(
					'click',
					'input.addToCart,input.addToWishlist',
					function() {
						var $button = $(this), $container = $button
								.closest('.product_container'), $form = $button
								.closest('form'), $options = $container
								.find('span.option-value'), $errorSpan = $container
								.find('span.error');
						$productOptionsSpan = $container
								.find('span.productOptionsSpan');
						
						var res = $('#preferredMeasurement').is(":checked");
						$("#cv").val(res);
						
						if ($container.length == 0) {
							var myId = $button.parent().attr('id').substring(
									'productOptions'.length);
							$container = $('.productActions' + myId).closest(
									'.product_container');
							$form = $container.find('form');
							$options = $button.parent().find(
									'span.option-value');
							$errorSpan = $button.parent().find('span.error');
							$productOptionsSpan = $container
									.find('span.productOptionsSpan');
						}

						var itemRequest = BLC.serializeObject($form), modalClick = $button
								.parents('.fancybox-inner').length > 0, wishlistAdd = $button
								.hasClass('addToWishlist');

						if (itemRequest.hasProductOptions == "true"
								&& !modalClick) {
							$.fancybox.open($.extend({
								href : '#productOptions'
										+ itemRequest.productId
							}, fancyProductOptionsOptions));
						} else {
							$options.each(function(index, element) {
								var optionType = $(element).data('optiontype');
								var value;

								if ("TEXT" == optionType) {
									value = $(element).next().find('input')
											.val();
								} else {
									value = $(element).text();
								}// need to add other types(date,long, etc)
								// as needed

								itemRequest['itemAttributes['
										+ $(element).attr('id') + ']'] = value;
							});

							BLC
									.ajax(
											{
												url : $form.attr('action'),
												type : "POST",
												dataType : "json",
												data : itemRequest
											},
											function(data, extraData) {
												if (data.error) {
													if (data.error == 'allOptionsRequired') {
														$errorSpan.css(
																'display',
																'block');
														$errorSpan.effect(
																'highlight',
																{}, 1000);
													} else if (data.error == 'productOptionValidationError') {
														// find the product
														// option that failed
														// validation with
														// jquery
														// put a message next to
														// that text box with
														// value = data.message
														$productOptionsSpan
																.text('Product Validation Failed: '
																		+ data.errorCode
																		+ ' '
																		+ data.errorMessage);
														$productOptionsSpan
																.css('display',
																		'block');
														$productOptionsSpan
																.effect(
																		'highlight',
																		{},
																		1000);

													} else {
														HC
																.showNotification("Error adding to cart");
													}
												} else {
													$errorSpan.css('display',
															'none');
													$productOptionsSpan.css(
															'display', 'none');
													updateHeaderCartItemsCount(data.cartItemCount);

													if (modalClick) {
														$.fancybox.close();
													} else if (wishlistAdd) {
														showInCartButton(
																data.productId,
																'wishlist');
													} else {
														
														  //showInCartButton(data.productId,'cart');
														  showCheckMark(data.productId,'cart');
														
														}

													if (wishlistAdd) {
														HC
																.showNotification(data.productName
																		+ "  has been added to your wishlist!");
													} else {
														HC
																.showNotification(
																		data.productName
																				+ "  has been added to the cart!",
																		2000);

														if (data.back == "true")
															history.back(1);
													}
												}
											});
						}
						return false;
					});

	// Intercept update quantity operations and perform them via AJAX instead
	// This will trigger on any input with class "updateQuantity"
	$('body').on('click', 'input.updateQuantity', function() {
		var $form = $(this).closest('form');

		BLC.ajax({
			url : $form.attr('action'),
			type : "POST",
			data : $form.serialize()
		}, function(data, extraData) {
			if (extraData) {
				updateHeaderCartItemsCount(extraData.cartItemCount);
				if ($form.children('input.quantityInput').val() == 0) {
					showAddToCartButton(extraData.productId, 'cart');
				}
			}

			$('.fancybox-inner').html(data);
		});
		return false;
	});

	// Intercept remove from cart operations and perform them via AJAX instead
	// This will trigger on any link with class "remove_from_cart"
	$('body').on('click', 'a.remove_from_cart', function() {
		var link = this;

		BLC.ajax({
			url : $(link).attr('href'),
			type : "GET"
		}, function(data, extraData) {
			updateHeaderCartItemsCount(extraData.cartItemCount);
			showAddToCartButton(extraData.productId, 'cart');

			$('.fancybox-inner').html(data);
		});
		return false;
	});

	// Intercept remove from cart operations and perform them via AJAX instead
	// This will trigger on any link with class "remove_from_cart"
	$('body').on('click', 'a.remove_promo', function() {
		var link = this;

		BLC.ajax({
			url : $(link).attr('href'),
			type : "GET"
		}, function(data) {
			$('.fancybox-inner').html(data);
		});
		return false;
	});

	$('body').on(
			'click',
			'input#addPromo',
			function() {
				var $form = $(this).closest('form');

				BLC.ajax({
					url : $form.attr('action'),
					type : "POST",
					data : $form.serialize()
				}, function(data, extraData) {
					if (!extraData.promoAdded) {
						$("#cart_promo_error").html(
								"Promo could not be applied: "
										+ extraData.exception).css("display",
								"");
					} else {
						$('.fancybox-inner').html(data);
					}
				});
				return false;
			});
	
	// Check the initial Poistion of the Breadcrumb
    /*var breadCrumbTop = $('.progress').offset().top;
      if( $(window).scrollTop() > breadCrumbTop ) {*/

    $(window).scroll(function(){
            if( $(window).scrollTop() > 50 ) {
                    $('.progress').css({position: 'fixed', top: '0px'});
                    $('.progress').css('z-index' , '9999');
                    $('.progress').css('width' , '100%');
                    $('.progress').css('background-color' , '#FFFFFF');
                    $('.progress').css('left' , '0px');
            } else {
                    $('.progress').css({position: 'static', top: '0px'});
                    $('.progress').css('background-color' , '#FFFFFF');
            }
    });
	
	$(document)
			.ready(
					function() {
						
						$('.menuitem span').animate({width: 151}, 0);
						var def;
						$('.menuitem').mouseover(function(){
								gridimage = $(this).find('span');
								gridimage.css('line-height','201px');
								def = gridimage.text();
								gridimage.text('sorry');
								$('.dd').css('display','block');
								gridimage.stop().animate({width: 200, height: 200}, 150);
							}).mouseout(function(){
								gridimage.css('line-height','151px');
								gridimage.text(def);
								$('.dd').css('display','none');
								gridimage.stop().animate({width: 151, height: 151}, 150);
						});
						
						if($('.check').is(":visible")){
							$('.progress').find('.active').addClass('blink');
							$('.progress').find('.active').children('.title').addClass('tblink');
							$('.progress').find('.active').removeClass('dis');
							$('.progress').find('.active').removeClass('active');
							//var pos = $('.progress').find('.active').next().next().children('.label').text();
							//if(pos == 3){
								$('#dialog-box').css({'display':'block'});
							//}
						}
						
						// if user clicked on button, close the dialog	
						$('#dialog-box').click(function () {	
							//$('.progress').next().css({'display':'none'});
							$('#dialog-box').css({'display':'none'});
							return false;
						});
						
						// if user clicked on choosematerial, show the dialog	
						$('#ch_material').click(function () {
							//var id = $(this).parent().attr('id');
							var id = $('.progress').find('.active').next().next().children('.label').text();
							if(id >= 3){
								//$('#ch_material').attr('href', '/bls-material');
								$('#dialog-box1').css({'display':'block'});
							}else{
								yesClickMethod(this);
							}
							return false;
						});
						// if user clicked on choosematerial, show the dialog	
						$('#yes').click(function () {
							yesClickMethod(this);
							return false;
						});
						// if user clicked on choosematerial, show the dialog	
						$('#no').click(function () {
							$('#dialog-box1').css({'display':'none'});
							return false;
						});

						
						/*$('#tab-container').easytabs();
						
						$(".ui-tabs-panel").each(function(i){

							  var totalSize = $(".ui-tabs-panel").size() - 1;
							  
							  if (i != totalSize) {
							      next = i + 2;
						   		  $(this).append("<a href='#' class='next-tab mover' rel='" + next + "'>Next &#187;</a>");
							  }
					  
							  if (i != 0) {
							      prev = i;
						   		  $(this).append("<a href='#' class='prev-tab mover' rel='" + prev + "'>&#171; Prev</a>");
							  }
				   		
							});
					
							   $('.next-tab').click(function() { 
								   var no = $(this).attr("rel")-1;
								   var prevTabId = '#tabs'+no;
									$(prevTabId).css("display","none");
									var CurrTabId = '#tabs'+$(this).attr("rel");
									$(CurrTabId).css("display","block");
									
									var i = $(this).attr("rel");
									i++;
									$('.checkout-bar .bar:nth-of-type(' + i + ')').addClass('active');
									$('.checkout-bar .bar:nth-of-type(' + (i-1) + ')').removeClass('active').addClass('visited');
									
						           return false;
						       });
						       
						       $('.prev-tab').click(function() { 
						    	   var no = $(this).attr("rel");
						    	   no++;
						    	   var NextTabId = '#tabs'+no;
									$(NextTabId).css("display","none");
									
						    	   var CurrTabId = '#tabs'+$(this).attr("rel");
									$(CurrTabId).css("display","block");
									
									var i = $(this).attr("rel");
									$('.checkout-bar .bar:nth-of-type(' + (i++) + ')').removeClass('visited').addClass('active');
									$('.checkout-bar .bar:nth-of-type(' + (i++) + ')').removeClass('active').addClass('next');
									
						           return false;
						       });*/
						
						$("#sizeMeasurementDiv #small").click(function() {

							$("div #height").val("1");
							$("div #chest").val("1");
							$("div #bust").val("1");
							$("div #dartLine").val("1");
							$("div #waist").val("1");
							$("div #hip").val("1");
							$("div #shoulder").val("1");
							$("div #sleeveLength").val("1");
							$("div #nwaist").val("1");
							$("div #armhole").val("1");
							$("div #tsleeve").val("1");
							$("div #bsleeve").val("1");
							$("div #fneck").val("1");
							$("div #bneck").val("1");
							$("div #pantheight").val("1");
							$("div #seat").val("1");

						});
						$("#sizeMeasurementDiv #medium").click(function() {

							$("div #height").val("2");
							$("div #chest").val("2");
							$("div #bust").val("2");
							$("div #dartLine").val("2");
							$("div #waist").val("2");
							$("div #hip").val("2");
							$("div #shoulder").val("2");
							$("div #sleeveLength").val("2");
							$("div #nwaist").val("2");
							$("div #armhole").val("2");
							$("div #tsleeve").val("2");
							$("div #bsleeve").val("2");
							$("div #fneck").val("2");
							$("div #bneck").val("2");
							$("div #pantheight").val("2");
							$("div #seat").val("2");

						});
						$("#sizeMeasurementDiv #large").click(function() {

							$("div #height").val("2");
							$("div #chest").val("2");
							$("div #bust").val("2");
							$("div #dartLine").val("2");
							$("div #waist").val("2");
							$("div #hip").val("2");
							$("div #shoulder").val("2");
							$("div #sleeveLength").val("2");
							$("div #nwaist").val("2");
							$("div #armhole").val("2");
							$("div #tsleeve").val("2");
							$("div #bsleeve").val("2");
							$("div #fneck").val("2");
							$("div #bneck").val("2");
							$("div #pantheight").val("2");
							$("div #seat").val("2");

						});
						$("#sizeMeasurementDiv #xlarge").click(function() {

							$("div #height").val("2");
							$("div #chest").val("2");
							$("div #bust").val("2");
							$("div #dartLine").val("2");
							$("div #waist").val("2");
							$("div #hip").val("2");
							$("div #shoulder").val("2");
							$("div #sleeveLength").val("2");
							$("div #nwaist").val("2");
							$("div #armhole").val("2");
							$("div #tsleeve").val("2");
							$("div #bsleeve").val("2");
							$("div #fneck").val("2");
							$("div #bneck").val("2");
							$("div #pantheight").val("2");
							$("div #seat").val("2");

						});

						// allow only no in input field
						$("#height")
								.keydown(
										function(e) {
											// Allow: backspace, delete, tab,
											// escape, enter and .
											if ($.inArray(e.keyCode, [ 46, 8,
													9, 27, 13, 110, 190 ]) !== -1
													||
													// Allow: Ctrl+A
													(e.keyCode == 65 && e.ctrlKey === true)
													||
													// Allow: home, end, left,
													// right
													(e.keyCode >= 35 && e.keyCode <= 39)) {
												// let it happen, don't do
												// anything
												return;
											}
											// Ensure that it is a number and
											// stop the keypress
											if ((e.shiftKey || (e.keyCode < 48 || e.keyCode > 57))
													&& (e.keyCode < 96 || e.keyCode > 105)) {
												e.preventDefault();
											}
										});
						$("#chest")
								.keydown(
										function(e) {
											// Allow: backspace, delete, tab,
											// escape, enter and .
											if ($.inArray(e.keyCode, [ 46, 8,
													9, 27, 13, 110, 190 ]) !== -1
													||
													// Allow: Ctrl+A
													(e.keyCode == 65 && e.ctrlKey === true)
													||
													// Allow: home, end, left,
													// right
													(e.keyCode >= 35 && e.keyCode <= 39)) {
												// let it happen, don't do
												// anything
												return;
											}
											// Ensure that it is a number and
											// stop the keypress
											if ((e.shiftKey || (e.keyCode < 48 || e.keyCode > 57))
													&& (e.keyCode < 96 || e.keyCode > 105)) {
												e.preventDefault();
											}
										});
						$("#bust")
								.keydown(
										function(e) {
											// Allow: backspace, delete, tab,
											// escape, enter and .
											if ($.inArray(e.keyCode, [ 46, 8,
													9, 27, 13, 110, 190 ]) !== -1
													||
													// Allow: Ctrl+A
													(e.keyCode == 65 && e.ctrlKey === true)
													||
													// Allow: home, end, left,
													// right
													(e.keyCode >= 35 && e.keyCode <= 39)) {
												// let it happen, don't do
												// anything
												return;
											}
											// Ensure that it is a number and
											// stop the keypress
											if ((e.shiftKey || (e.keyCode < 48 || e.keyCode > 57))
													&& (e.keyCode < 96 || e.keyCode > 105)) {
												e.preventDefault();
											}
										});
						$("#dartLine")
								.keydown(
										function(e) {
											// Allow: backspace, delete, tab,
											// escape, enter and .
											if ($.inArray(e.keyCode, [ 46, 8,
													9, 27, 13, 110, 190 ]) !== -1
													||
													// Allow: Ctrl+A
													(e.keyCode == 65 && e.ctrlKey === true)
													||
													// Allow: home, end, left,
													// right
													(e.keyCode >= 35 && e.keyCode <= 39)) {
												// let it happen, don't do
												// anything
												return;
											}
											// Ensure that it is a number and
											// stop the keypress
											if ((e.shiftKey || (e.keyCode < 48 || e.keyCode > 57))
													&& (e.keyCode < 96 || e.keyCode > 105)) {
												e.preventDefault();
											}
										});
						$("#waist")
								.keydown(
										function(e) {
											// Allow: backspace, delete, tab,
											// escape, enter and .
											if ($.inArray(e.keyCode, [ 46, 8,
													9, 27, 13, 110, 190 ]) !== -1
													||
													// Allow: Ctrl+A
													(e.keyCode == 65 && e.ctrlKey === true)
													||
													// Allow: home, end, left,
													// right
													(e.keyCode >= 35 && e.keyCode <= 39)) {
												// let it happen, don't do
												// anything
												return;
											}
											// Ensure that it is a number and
											// stop the keypress
											if ((e.shiftKey || (e.keyCode < 48 || e.keyCode > 57))
													&& (e.keyCode < 96 || e.keyCode > 105)) {
												e.preventDefault();
											}
										});
						$("#hip")
								.keydown(
										function(e) {
											// Allow: backspace, delete, tab,
											// escape, enter and .
											if ($.inArray(e.keyCode, [ 46, 8,
													9, 27, 13, 110, 190 ]) !== -1
													||
													// Allow: Ctrl+A
													(e.keyCode == 65 && e.ctrlKey === true)
													||
													// Allow: home, end, left,
													// right
													(e.keyCode >= 35 && e.keyCode <= 39)) {
												// let it happen, don't do
												// anything
												return;
											}
											// Ensure that it is a number and
											// stop the keypress
											if ((e.shiftKey || (e.keyCode < 48 || e.keyCode > 57))
													&& (e.keyCode < 96 || e.keyCode > 105)) {
												e.preventDefault();
											}
										});
						$("#shoulder")
								.keydown(
										function(e) {
											// Allow: backspace, delete, tab,
											// escape, enter and .
											if ($.inArray(e.keyCode, [ 46, 8,
													9, 27, 13, 110, 190 ]) !== -1
													||
													// Allow: Ctrl+A
													(e.keyCode == 65 && e.ctrlKey === true)
													||
													// Allow: home, end, left,
													// right
													(e.keyCode >= 35 && e.keyCode <= 39)) {
												// let it happen, don't do
												// anything
												return;
											}
											// Ensure that it is a number and
											// stop the keypress
											if ((e.shiftKey || (e.keyCode < 48 || e.keyCode > 57))
													&& (e.keyCode < 96 || e.keyCode > 105)) {
												e.preventDefault();
											}
										});
						$("#sleeveLength")
								.keydown(
										function(e) {
											// Allow: backspace, delete, tab,
											// escape, enter and .
											if ($.inArray(e.keyCode, [ 46, 8,
													9, 27, 13, 110, 190 ]) !== -1
													||
													// Allow: Ctrl+A
													(e.keyCode == 65 && e.ctrlKey === true)
													||
													// Allow: home, end, left,
													// right
													(e.keyCode >= 35 && e.keyCode <= 39)) {
												// let it happen, don't do
												// anything
												return;
											}
											// Ensure that it is a number and
											// stop the keypress
											if ((e.shiftKey || (e.keyCode < 48 || e.keyCode > 57))
													&& (e.keyCode < 96 || e.keyCode > 105)) {
												e.preventDefault();
											}
										});
						// allow only no in input field
						$("#nwaist")
								.keydown(
										function(e) {
											// Allow: backspace, delete, tab,
											// escape, enter and .
											if ($.inArray(e.keyCode, [ 46, 8,
													9, 27, 13, 110, 190 ]) !== -1
													||
													// Allow: Ctrl+A
													(e.keyCode == 65 && e.ctrlKey === true)
													||
													// Allow: home, end, left,
													// right
													(e.keyCode >= 35 && e.keyCode <= 39)) {
												// let it happen, don't do
												// anything
												return;
											}
											// Ensure that it is a number and
											// stop the keypress
											if ((e.shiftKey || (e.keyCode < 48 || e.keyCode > 57))
													&& (e.keyCode < 96 || e.keyCode > 105)) {
												e.preventDefault();
											}
										});
						$("#armhole")
								.keydown(
										function(e) {
											// Allow: backspace, delete, tab,
											// escape, enter and .
											if ($.inArray(e.keyCode, [ 46, 8,
													9, 27, 13, 110, 190 ]) !== -1
													||
													// Allow: Ctrl+A
													(e.keyCode == 65 && e.ctrlKey === true)
													||
													// Allow: home, end, left,
													// right
													(e.keyCode >= 35 && e.keyCode <= 39)) {
												// let it happen, don't do
												// anything
												return;
											}
											// Ensure that it is a number and
											// stop the keypress
											if ((e.shiftKey || (e.keyCode < 48 || e.keyCode > 57))
													&& (e.keyCode < 96 || e.keyCode > 105)) {
												e.preventDefault();
											}
										});
						$("#tsleeve")
								.keydown(
										function(e) {
											// Allow: backspace, delete, tab,
											// escape, enter and .
											if ($.inArray(e.keyCode, [ 46, 8,
													9, 27, 13, 110, 190 ]) !== -1
													||
													// Allow: Ctrl+A
													(e.keyCode == 65 && e.ctrlKey === true)
													||
													// Allow: home, end, left,
													// right
													(e.keyCode >= 35 && e.keyCode <= 39)) {
												// let it happen, don't do
												// anything
												return;
											}
											// Ensure that it is a number and
											// stop the keypress
											if ((e.shiftKey || (e.keyCode < 48 || e.keyCode > 57))
													&& (e.keyCode < 96 || e.keyCode > 105)) {
												e.preventDefault();
											}
										});
						$("#bsleeve")
								.keydown(
										function(e) {
											// Allow: backspace, delete, tab,
											// escape, enter and .
											if ($.inArray(e.keyCode, [ 46, 8,
													9, 27, 13, 110, 190 ]) !== -1
													||
													// Allow: Ctrl+A
													(e.keyCode == 65 && e.ctrlKey === true)
													||
													// Allow: home, end, left,
													// right
													(e.keyCode >= 35 && e.keyCode <= 39)) {
												// let it happen, don't do
												// anything
												return;
											}
											// Ensure that it is a number and
											// stop the keypress
											if ((e.shiftKey || (e.keyCode < 48 || e.keyCode > 57))
													&& (e.keyCode < 96 || e.keyCode > 105)) {
												e.preventDefault();
											}
										});
						$("#fneck")
								.keydown(
										function(e) {
											// Allow: backspace, delete, tab,
											// escape, enter and .
											if ($.inArray(e.keyCode, [ 46, 8,
													9, 27, 13, 110, 190 ]) !== -1
													||
													// Allow: Ctrl+A
													(e.keyCode == 65 && e.ctrlKey === true)
													||
													// Allow: home, end, left,
													// right
													(e.keyCode >= 35 && e.keyCode <= 39)) {
												// let it happen, don't do
												// anything
												return;
											}
											// Ensure that it is a number and
											// stop the keypress
											if ((e.shiftKey || (e.keyCode < 48 || e.keyCode > 57))
													&& (e.keyCode < 96 || e.keyCode > 105)) {
												e.preventDefault();
											}
										});
						$("#bneck")
								.keydown(
										function(e) {
											// Allow: backspace, delete, tab,
											// escape, enter and .
											if ($.inArray(e.keyCode, [ 46, 8,
													9, 27, 13, 110, 190 ]) !== -1
													||
													// Allow: Ctrl+A
													(e.keyCode == 65 && e.ctrlKey === true)
													||
													// Allow: home, end, left,
													// right
													(e.keyCode >= 35 && e.keyCode <= 39)) {
												// let it happen, don't do
												// anything
												return;
											}
											// Ensure that it is a number and
											// stop the keypress
											if ((e.shiftKey || (e.keyCode < 48 || e.keyCode > 57))
													&& (e.keyCode < 96 || e.keyCode > 105)) {
												e.preventDefault();
											}
										});
						$("#pantheight")
								.keydown(
										function(e) {
											// Allow: backspace, delete, tab,
											// escape, enter and .
											if ($.inArray(e.keyCode, [ 46, 8,
													9, 27, 13, 110, 190 ]) !== -1
													||
													// Allow: Ctrl+A
													(e.keyCode == 65 && e.ctrlKey === true)
													||
													// Allow: home, end, left,
													// right
													(e.keyCode >= 35 && e.keyCode <= 39)) {
												// let it happen, don't do
												// anything
												return;
											}
											// Ensure that it is a number and
											// stop the keypress
											if ((e.shiftKey || (e.keyCode < 48 || e.keyCode > 57))
													&& (e.keyCode < 96 || e.keyCode > 105)) {
												e.preventDefault();
											}
										});
						$("#seat")
								.keydown(
										function(e) {
											// Allow: backspace, delete, tab,
											// escape, enter and .
											if ($.inArray(e.keyCode, [ 46, 8,
													9, 27, 13, 110, 190 ]) !== -1
													||
													// Allow: Ctrl+A
													(e.keyCode == 65 && e.ctrlKey === true)
													||
													// Allow: home, end, left,
													// right
													(e.keyCode >= 35 && e.keyCode <= 39)) {
												// let it happen, don't do
												// anything
												return;
											}
											// Ensure that it is a number and
											// stop the keypress
											if ((e.shiftKey || (e.keyCode < 48 || e.keyCode > 57))
													&& (e.keyCode < 96 || e.keyCode > 105)) {
												e.preventDefault();
											}
										});
						
						$(".primaryphone")
						.keydown(
								function(e) {
									// Allow: backspace, delete, tab,
									// escape, enter and .
									if ($.inArray(e.keyCode, [ 46, 8,
											9, 27, 13, 110, 190 ]) !== -1
											||
											// Allow: Ctrl+A
											(e.keyCode == 65 && e.ctrlKey === true)
											||
											// Allow: home, end, left,
											// right
											(e.keyCode >= 35 && e.keyCode <= 39)) {
										// let it happen, don't do
										// anything
										return;
									}
									// Ensure that it is a number and
									// stop the keypress
									if ((e.shiftKey || (e.keyCode < 48 || e.keyCode > 57))
											&& (e.keyCode < 96 || e.keyCode > 105)) {
										e.preventDefault();
									}
								});
						
						if ($('#measurementdropdown option').length < 1) {

							// If there are no previously added measurements,
							// then hide drop down and the corresponding radio
							// button
							$('#measurementDropDown').hide();
							$("#selectMeasurement").hide();
							$("#chooseMeasurementDiv").hide();

							// Display the Add New Option and Offshelf option.
							$("#addNew").show();
							$("#newMeasurementDiv").show();
							$("#dummyMeasurementDiv").show();

							// However offshelf button is hidden since new
							// measurement would be default
							$("#offshelf").hide();

							$("#newMeasurement").prop('checked', true);

						} else {

							// Here drop down is visible and would be the
							// default option
							$("#chooseMeasurementDiv").show();
							$('#measurementDropDown').show();
							$("#selectMeasurement").show();

							// Show other radio buttons
							$("#newMeasurementDiv").show();
							$("#dummyMeasurementDiv").show();

							// Hide other sections
							$("#addNew").hide();
							$("#offshelf").hide();

							$("#chooseMeasurement").prop('checked', true);
							
						}
						
						var _SlideshowTransitions = [
						                             //Collapse Random
						                             { $Duration: 1000, $Delay: 80, $Cols: 10, $Rows: 4, $Clip: 15, $SlideOut: true, $Easing: $JssorEasing$.$EaseOutQuad }

						                             //Fade in LR Chess
						                             , { $Duration: 1200, y: 0.3, $Cols: 2, $During: { $Top: [0.3, 0.7] }, $ChessMode: { $Column: 12 }, $Easing: { $Top: $JssorEasing$.$EaseInCubic, $Opacity: $JssorEasing$.$EaseLinear }, $Opacity: 2, $Outside: true }

						                             //Rotate VDouble+ out
						                             , { $Duration: 1000, x: -1, y: 2, $Rows: 2, $Zoom: 11, $Rotate: 1, $SlideOut: true, $Assembly: 2049, $ChessMode: { $Row: 15 }, $Easing: { $Left: $JssorEasing$.$EaseInExpo, $Top: $JssorEasing$.$EaseInExpo, $Zoom: $JssorEasing$.$EaseInExpo, $Opacity: $JssorEasing$.$EaseLinear, $Rotate: $JssorEasing$.$EaseInExpo }, $Opacity: 2, $Round: { $Rotate: 0.85 } }

						                             ////Swing Inside in Stairs
						                             //, { $Duration: 1200, x: 0.2, y: -0.1, $Delay: 20, $Cols: 10, $Rows: 4, $Clip: 15, $During: { $Left: [0.3, 0.7], $Top: [0.3, 0.7] }, $Formation: $JssorSlideshowFormations$.$FormationStraightStairs, $Assembly: 260, $Easing: { $Left: $JssorEasing$.$EaseInWave, $Top: $JssorEasing$.$EaseInWave, $Clip: $JssorEasing$.$EaseOutQuad }, $Round: { $Left: 1.3, $Top: 2.5} }

						                             //Zoom HDouble+ out
						                             , { $Duration: 1200, x: 4, $Cols: 2, $Zoom: 11, $SlideOut: true, $Assembly: 2049, $ChessMode: { $Column: 15 }, $Easing: { $Left: $JssorEasing$.$EaseInExpo, $Zoom: $JssorEasing$.$EaseInExpo, $Opacity: $JssorEasing$.$EaseLinear }, $Opacity: 2 }

						                             ////Dodge Pet Inside in Stairs
						                             //, { $Duration: 1500, x: 0.2, y: -0.1, $Delay: 20, $Cols: 10, $Rows: 4, $Clip: 15, $During: { $Left: [0.3, 0.7], $Top: [0.3, 0.7] }, $Formation: $JssorSlideshowFormations$.$FormationStraightStairs, $Assembly: 260, $Easing: { $Left: $JssorEasing$.$EaseInWave, $Top: $JssorEasing$.$EaseInWave, $Clip: $JssorEasing$.$EaseOutQuad }, $Round: { $Left: 0.8, $Top: 2.5} }

						                             //Rotate Zoom+ out BL
						                             , { $Duration: 1200, x: 4, y: -4, $Zoom: 11, $Rotate: 1, $SlideOut: true, $Easing: { $Left: $JssorEasing$.$EaseInExpo, $Top: $JssorEasing$.$EaseInExpo, $Zoom: $JssorEasing$.$EaseInExpo, $Opacity: $JssorEasing$.$EaseLinear, $Rotate: $JssorEasing$.$EaseInExpo }, $Opacity: 2, $Round: { $Rotate: 0.8 } }

						                             //Dodge Dance Inside in Random
						                             , { $Duration: 1500, x: 0.3, y: -0.3, $Delay: 80, $Cols: 10, $Rows: 4, $Clip: 15, $During: { $Left: [0.3, 0.7], $Top: [0.3, 0.7] }, $Easing: { $Left: $JssorEasing$.$EaseInJump, $Top: $JssorEasing$.$EaseInJump, $Clip: $JssorEasing$.$EaseOutQuad }, $Round: { $Left: 0.8, $Top: 2.5 } }

						                             //Rotate VFork+ out
						                             , { $Duration: 1200, x: -3, y: 1, $Rows: 2, $Zoom: 11, $Rotate: 1, $SlideOut: true, $Assembly: 2049, $ChessMode: { $Row: 28 }, $Easing: { $Left: $JssorEasing$.$EaseInExpo, $Top: $JssorEasing$.$EaseInExpo, $Zoom: $JssorEasing$.$EaseInExpo, $Opacity: $JssorEasing$.$EaseLinear, $Rotate: $JssorEasing$.$EaseInExpo }, $Opacity: 2, $Round: { $Rotate: 0.7 } }

						                             //Clip and Chess in
						                             , { $Duration: 1200, y: -1, $Cols: 10, $Rows: 4, $Clip: 15, $During: { $Top: [0.5, 0.5], $Clip: [0, 0.5] }, $Formation: $JssorSlideshowFormations$.$FormationStraight, $ChessMode: { $Column: 12 }, $ScaleClip: 0.5 }

						                             ////Swing Inside in Swirl
						                             //, { $Duration: 1200, x: 0.2, y: -0.1, $Delay: 20, $Cols: 10, $Rows: 4, $Clip: 15, $During: { $Left: [0.3, 0.7], $Top: [0.3, 0.7] }, $Formation: $JssorSlideshowFormations$.$FormationSwirl, $Assembly: 260, $Easing: { $Left: $JssorEasing$.$EaseInWave, $Top: $JssorEasing$.$EaseInWave, $Clip: $JssorEasing$.$EaseOutQuad }, $Round: { $Left: 1.3, $Top: 2.5} }

						                             ////Rotate Zoom+ out
						                             //, { $Duration: 1200, $Zoom: 11, $Rotate: 1, $SlideOut: true, $Easing: { $Zoom: $JssorEasing$.$EaseInCubic, $Rotate: $JssorEasing$.$EaseInCubic }, $Opacity: 2, $Round: { $Rotate: 0.7} }

						                             ////Dodge Pet Inside in ZigZag
						                             //, { $Duration: 1500, x: 0.2, y: -0.1, $Delay: 20, $Cols: 10, $Rows: 4, $Clip: 15, $During: { $Left: [0.3, 0.7], $Top: [0.3, 0.7] }, $Formation: $JssorSlideshowFormations$.$FormationZigZag, $Assembly: 260, $Easing: { $Left: $JssorEasing$.$EaseInWave, $Top: $JssorEasing$.$EaseInWave, $Clip: $JssorEasing$.$EaseOutQuad }, $Round: { $Left: 0.8, $Top: 2.5} }

						                             //Rotate Zoom- out TL
						                             , { $Duration: 1200, x: 0.5, y: 0.5, $Zoom: 1, $Rotate: 1, $SlideOut: true, $Easing: { $Left: $JssorEasing$.$EaseInCubic, $Top: $JssorEasing$.$EaseInCubic, $Zoom: $JssorEasing$.$EaseInCubic, $Opacity: $JssorEasing$.$EaseLinear, $Rotate: $JssorEasing$.$EaseInCubic }, $Opacity: 2, $Round: { $Rotate: 0.5 } }

						                             //Rotate Zoom- in BR
						                             , { $Duration: 1200, x: -0.6, y: -0.6, $Zoom: 1, $Rotate: 1, $During: { $Left: [0.2, 0.8], $Top: [0.2, 0.8], $Zoom: [0.2, 0.8], $Rotate: [0.2, 0.8] }, $Easing: { $Zoom: $JssorEasing$.$EaseSwing, $Opacity: $JssorEasing$.$EaseLinear, $Rotate: $JssorEasing$.$EaseSwing }, $Opacity: 2, $Round: { $Rotate: 0.5 } }

						                             // Wave out Eagle
						                             , { $Duration: 1500, y: -0.5, $Delay: 60, $Cols: 24, $SlideOut: true, $Formation: $JssorSlideshowFormations$.$FormationCircle, $Easing: $JssorEasing$.$EaseInWave, $Round: { $Top: 1.5 } }

						                             //Expand Stairs
						                             , { $Duration: 1000, $Delay: 30, $Cols: 10, $Rows: 4, $Clip: 15, $Formation: $JssorSlideshowFormations$.$FormationStraightStairs, $Assembly: 2050, $Easing: $JssorEasing$.$EaseInQuad }

						                             //Fade Clip out H
						                             , { $Duration: 1200, $Delay: 20, $Clip: 3, $SlideOut: true, $Assembly: 260, $Easing: { $Clip: $JssorEasing$.$EaseOutCubic, $Opacity: $JssorEasing$.$EaseLinear }, $Opacity: 2 }

						                             ////Dodge Pet Inside in Random Chess
						                             //, { $Duration: 1500, x: 0.2, y: -0.1, $Delay: 80, $Cols: 10, $Rows: 4, $Clip: 15, $During: { $Left: [0.2, 0.8], $Top: [0.2, 0.8] }, $ChessMode: { $Column: 15, $Row: 15 }, $Easing: { $Left: $JssorEasing$.$EaseInWave, $Top: $JssorEasing$.$EaseInWave, $Clip: $JssorEasing$.$EaseLinear }, $Round: { $Left: 0.8, $Top: 2.5} }
						                             ];
						
						var _CaptionTransitions = [];
			            _CaptionTransitions["L"] = { $Duration: 900, x: 0.6, $Easing: { $Left: $JssorEasing$.$EaseInOutSine }, $Opacity: 2 };
			            _CaptionTransitions["R"] = { $Duration: 900, x: -0.6, $Easing: { $Left: $JssorEasing$.$EaseInOutSine }, $Opacity: 2 };
			            _CaptionTransitions["T"] = { $Duration: 900, y: 0.6, $Easing: { $Top: $JssorEasing$.$EaseInOutSine }, $Opacity: 2 };
			            _CaptionTransitions["B"] = { $Duration: 900, y: -0.6, $Easing: { $Top: $JssorEasing$.$EaseInOutSine }, $Opacity: 2 };
			            _CaptionTransitions["TR"] = { $Duration: 900, x: -0.6, y: 0.6, $Easing: { $Left: $JssorEasing$.$EaseInOutSine, $Top: $JssorEasing$.$EaseInOutSine }, $Opacity: 2 };

			            _CaptionTransitions["L|IB"] = { $Duration: 1200, x: 0.6, $Easing: { $Left: $JssorEasing$.$EaseInOutBack }, $Opacity: 2 };
			            _CaptionTransitions["R|IB"] = { $Duration: 1200, x: -0.6, $Easing: { $Left: $JssorEasing$.$EaseInOutBack }, $Opacity: 2 };
			            _CaptionTransitions["T|IB"] = { $Duration: 1200, y: 0.6, $Easing: { $Top: $JssorEasing$.$EaseInOutBack }, $Opacity: 2 };

			            _CaptionTransitions["CLIP|LR"] = { $Duration: 900, $Clip: 3, $Easing: { $Clip: $JssorEasing$.$EaseInOutCubic }, $Opacity: 2 };
			            _CaptionTransitions["CLIP|TB"] = { $Duration: 900, $Clip: 12, $Easing: { $Clip: $JssorEasing$.$EaseInOutCubic }, $Opacity: 2 };
			            _CaptionTransitions["CLIP|L"] = { $Duration: 900, $Clip: 1, $Easing: { $Clip: $JssorEasing$.$EaseInOutCubic }, $Opacity: 2 };

			            _CaptionTransitions["MCLIP|R"] = { $Duration: 900, $Clip: 2, $Move: true, $Easing: { $Clip: $JssorEasing$.$EaseInOutCubic }, $Opacity: 2 };
			            _CaptionTransitions["MCLIP|T"] = { $Duration: 900, $Clip: 4, $Move: true, $Easing: { $Clip: $JssorEasing$.$EaseInOutCubic }, $Opacity: 2 };

			            _CaptionTransitions["WV|B"] = { $Duration: 1200, x: -0.2, y: -0.6, $Easing: { $Left: $JssorEasing$.$EaseInWave, $Top: $JssorEasing$.$EaseLinear }, $Opacity: 2, $Round: { $Left: 1.5} };

			            _CaptionTransitions["TORTUOUS|VB"] = { $Duration: 1800, y: -0.2, $Zoom: 1, $Easing: { $Top: $JssorEasing$.$EaseOutWave, $Zoom: $JssorEasing$.$EaseOutCubic }, $Opacity: 2, $During: { $Top: [0, 0.7] }, $Round: { $Top: 1.3} };

			            _CaptionTransitions["LISTH|R"] = { $Duration: 1500, x: -0.8, $Clip: 1, $Easing: $JssorEasing$.$EaseInOutCubic, $ScaleClip: 0.8, $Opacity: 2, $During: { $Left: [0.4, 0.6], $Clip: [0, 0.4], $Opacity: [0.4, 0.6]} };

			            _CaptionTransitions["RTT|360"] = { $Duration: 900, $Rotate: 1, $Easing: { $Opacity: $JssorEasing$.$EaseLinear, $Rotate: $JssorEasing$.$EaseInQuad }, $Opacity: 2 };
			            _CaptionTransitions["RTT|10"] = { $Duration: 900, $Zoom: 11, $Rotate: 1, $Easing: { $Zoom: $JssorEasing$.$EaseInExpo, $Opacity: $JssorEasing$.$EaseLinear, $Rotate: $JssorEasing$.$EaseInExpo }, $Opacity: 2, $Round: { $Rotate: 0.8} };

			            _CaptionTransitions["RTTL|BR"] = { $Duration: 900, x: -0.6, y: -0.6, $Zoom: 11, $Rotate: 1, $Easing: { $Left: $JssorEasing$.$EaseInCubic, $Top: $JssorEasing$.$EaseInCubic, $Zoom: $JssorEasing$.$EaseInCubic, $Opacity: $JssorEasing$.$EaseLinear, $Rotate: $JssorEasing$.$EaseInCubic }, $Opacity: 2, $Round: { $Rotate: 0.8} };

			            _CaptionTransitions["T|IE*IE"] = { $Duration: 1800, y: 0.8, $Zoom: 11, $Rotate: -1.5, $Easing: { $Top: $JssorEasing$.$EaseInOutElastic, $Zoom: $JssorEasing$.$EaseInElastic, $Rotate: $JssorEasing$.$EaseInOutElastic }, $Opacity: 2, $During: { $Zoom: [0, 0.8], $Opacity: [0, 0.7] }, $Round: { $Rotate: 0.5} };

			            _CaptionTransitions["RTTS|R"] = { $Duration: 900, x: -0.6, $Zoom: 1, $Rotate: 1, $Easing: { $Left: $JssorEasing$.$EaseInQuad, $Zoom: $JssorEasing$.$EaseInQuad, $Rotate: $JssorEasing$.$EaseInQuad, $Opacity: $JssorEasing$.$EaseOutQuad }, $Opacity: 2, $Round: { $Rotate: 1.2} };
			            _CaptionTransitions["RTTS|T"] = { $Duration: 900, y: 0.6, $Zoom: 1, $Rotate: 1, $Easing: { $Top: $JssorEasing$.$EaseInQuad, $Zoom: $JssorEasing$.$EaseInQuad, $Rotate: $JssorEasing$.$EaseInQuad, $Opacity: $JssorEasing$.$EaseOutQuad }, $Opacity: 2, $Round: { $Rotate: 1.2} };

			            _CaptionTransitions["DDGDANCE|RB"] = { $Duration: 1800, x: -0.3, y: -0.3, $Zoom: 1, $Easing: { $Left: $JssorEasing$.$EaseInJump, $Top: $JssorEasing$.$EaseInJump, $Zoom: $JssorEasing$.$EaseOutQuad }, $Opacity: 2, $During: { $Left: [0, 0.8], $Top: [0, 0.8] }, $Round: { $Left: 0.8, $Top: 2.5} };
			            _CaptionTransitions["ZMF|10"] = { $Duration: 900, $Zoom: 11, $Easing: { $Zoom: $JssorEasing$.$EaseInExpo, $Opacity: $JssorEasing$.$EaseLinear }, $Opacity: 2 };
			            _CaptionTransitions["DDG|TR"] = { $Duration: 1200, x: -0.3, y: 0.3, $Zoom: 1, $Easing: { $Left: $JssorEasing$.$EaseInJump, $Top: $JssorEasing$.$EaseInJump }, $Opacity: 2, $During: { $Left: [0, 0.8], $Top: [0, 0.8] }, $Round: { $Left: 0.8, $Top: 0.8} };

			            _CaptionTransitions["FLTTR|R"] = { $Duration: 900, x: -0.2, y: -0.1, $Easing: { $Left: $JssorEasing$.$EaseLinear, $Top: $JssorEasing$.$EaseInWave }, $Opacity: 2, $Round: { $Top: 1.3} };
			            _CaptionTransitions["FLTTRWN|LT"] = { $Duration: 1800, x: 0.5, y: 0.2, $Zoom: 1, $Easing: { $Left: $JssorEasing$.$EaseInOutSine, $Top: $JssorEasing$.$EaseInWave, $Zoom: $JssorEasing$.$EaseInOutQuad }, $Opacity: 2, $During: { $Left: [0, 0.7], $Top: [0.1, 0.7] }, $Round: { $Top: 1.3} };

			            _CaptionTransitions["ATTACK|BR"] = { $Duration: 1500, x: -0.1, y: -0.5, $Zoom: 1, $Easing: { $Left: $JssorEasing$.$EaseOutWave, $Top: $JssorEasing$.$EaseInExpo }, $Opacity: 2, $During: { $Left: [0.3, 0.7], $Top: [0, 0.7] }, $Round: { $Left: 1.3} };

			            _CaptionTransitions["FADE"] = { $Duration: 900, $Opacity: 2 };

			            var options = {
			                $AutoPlay: true,                                    //[Optional] Whether to auto play, to enable slideshow, this option must be set to true, default value is false
			                $AutoPlaySteps: 1,                                  //[Optional] Steps to go for each navigation request (this options applys only when slideshow disabled), the default value is 1
			                $AutoPlayInterval: 2000,                            //[Optional] Interval (in milliseconds) to go for next slide since the previous stopped if the slider is auto playing, default value is 3000
			                $PauseOnHover: 1,                                   //[Optional] Whether to pause when mouse over if a slider is auto playing, 0 no pause, 1 pause for desktop, 2 pause for touch device, 3 pause for desktop and touch device, 4 freeze for desktop, 8 freeze for touch device, 12 freeze for desktop and touch device, default value is 1

			                $ArrowKeyNavigation: true,   			            //[Optional] Allows keyboard (arrow key) navigation or not, default value is false
			                $SlideEasing: $JssorEasing$.$EaseOutQuint,          //[Optional] Specifies easing for right to left animation, default value is $JssorEasing$.$EaseOutQuad
			                $SlideDuration: 800,                                //[Optional] Specifies default duration (swipe) for slide in milliseconds, default value is 500
			                $MinDragOffsetToSlide: 20,                          //[Optional] Minimum drag offset to trigger slide , default value is 20
			                //$SlideWidth: 600,                                 //[Optional] Width of every slide in pixels, default value is width of 'slides' container
			                //$SlideHeight: 300,                                //[Optional] Height of every slide in pixels, default value is height of 'slides' container
			                $SlideSpacing: 0, 					                //[Optional] Space between each slide in pixels, default value is 0
			                $DisplayPieces: 1,                                  //[Optional] Number of pieces to display (the slideshow would be disabled if the value is set to greater than 1), the default value is 1
			                $ParkingPosition: 0,                                //[Optional] The offset position to park slide (this options applys only when slideshow disabled), default value is 0.
			                $UISearchMode: 1,                                   //[Optional] The way (0 parellel, 1 recursive, default value is 1) to search UI components (slides container, loading screen, navigator container, arrow navigator container, thumbnail navigator container etc).
			                $PlayOrientation: 1,                                //[Optional] Orientation to play slide (for auto play, navigation), 1 horizental, 2 vertical, 5 horizental reverse, 6 vertical reverse, default value is 1
			                $DragOrientation: 3,                                //[Optional] Orientation to drag slide, 0 no drag, 1 horizental, 2 vertical, 3 either, default value is 1 (Note that the $DragOrientation should be the same as $PlayOrientation when $DisplayPieces is greater than 1, or parking position is not 0)

			                $SlideshowOptions: {                                //[Optional] Options to specify and enable slideshow or not
			                    $Class: $JssorSlideshowRunner$,                 //[Required] Class to create instance of slideshow
			                    $Transitions: _SlideshowTransitions,            //[Required] An array of slideshow transitions to play slideshow
			                    $TransitionsOrder: 1,                           //[Optional] The way to choose transition to play slide, 1 Sequence, 0 Random
			                    $ShowLink: true                                    //[Optional] Whether to bring slide link on top of the slider when slideshow is running, default value is false
			                },

			                $CaptionSliderOptions: {                            //[Optional] Options which specifies how to animate caption
			                    $Class: $JssorCaptionSlider$,                   //[Required] Class to create instance to animate caption
			                    $CaptionTransitions: _CaptionTransitions,       //[Required] An array of caption transitions to play caption, see caption transition section at jssor slideshow transition builder
			                    $PlayInMode: 1,                                 //[Optional] 0 None (no play), 1 Chain (goes after main slide), 3 Chain Flatten (goes after main slide and flatten all caption animations), default value is 1
			                    $PlayOutMode: 3                                 //[Optional] 0 None (no play), 1 Chain (goes before main slide), 3 Chain Flatten (goes before main slide and flatten all caption animations), default value is 1
			                },

			                $ArrowNavigatorOptions: {                       //[Optional] Options to specify and enable arrow navigator or not
			                    $Class: $JssorArrowNavigator$,              //[Requried] Class to create arrow navigator instance
			                    $ChanceToShow: 1,                               //[Required] 0 Never, 1 Mouse Over, 2 Always
			                    $AutoCenter: 2,                                 //[Optional] Auto center arrows in parent container, 0 No, 1 Horizontal, 2 Vertical, 3 Both, default value is 0
			                    $Steps: 1                                       //[Optional] Steps to go for each navigation request, default value is 1
			                },

			                $BulletNavigatorOptions: {                                //[Optional] Options to specify and enable navigator or not
			                    $Class: $JssorBulletNavigator$,                       //[Required] Class to create navigator instance
			                    $ChanceToShow: 2,                               //[Required] 0 Never, 1 Mouse Over, 2 Always
			                    $AutoCenter: 1,                                 //[Optional] Auto center navigator in parent container, 0 None, 1 Horizontal, 2 Vertical, 3 Both, default value is 0
			                    $Steps: 1,                                      //[Optional] Steps to go for each navigation request, default value is 1
			                    $Lanes: 1,                                      //[Optional] Specify lanes to arrange items, default value is 1
			                    $SpacingX: 4,                                   //[Optional] Horizontal space between each item in pixel, default value is 0
			                    $SpacingY: 4,                                   //[Optional] Vertical space between each item in pixel, default value is 0
			                    $Orientation: 1                                 //[Optional] The orientation of the navigator, 1 horizontal, 2 vertical, default value is 1
			                }
			            };

			            var jssor_slider1 = new $JssorSlider$("slider1_container", options);
			            //responsive code begin
			            //you can remove responsive code if you don't want the slider scales while window resizes
			            function ScaleSlider() {
			                var parentWidth = jssor_slider1.$Elmt.parentNode.clientWidth;
			                if (parentWidth)
			                    jssor_slider1.$ScaleWidth(Math.max(Math.min(parentWidth, 980), 300));
			                else
			                    window.setTimeout(ScaleSlider, 30);
			            }

			            ScaleSlider();

			            if (!navigator.userAgent.match(/(iPhone|iPod|iPad|BlackBerry|IEMobile)/)) {
			                $(window).bind('resize', ScaleSlider);
			            }


						return false;
					});

	$("#newMeasurement").click(
			function() {

				$("#addNew").show();
				$("#measurementDropDown").hide();
				$("#selectMeasurement").hide();
				$("#offshelf").hide();
				
				$("#sizeMeasurementDiv").show();
				$("#preferredMeasurementDiv").show();
				
				var $descOp = $(this).attr('desc');
				$sec = $(this).parent().parent().parent().parent();
				// console.log('tagname:'+$sec.get(0).tagName);
				$sec2 = $sec.next();
				$ch1 = $sec2.children('#options').children('#right_column')
						.children('#options');
				// console.log('tagname:'+$ch1.prop('tagName'));
				$pTag = $ch1.find('#content');
				// console.log('tagname:'+$pTag.prop('tagName'));
				$($pTag).text($descOp);

				return true;

			});

	$("#chooseMeasurement").click(
			function() {
				$("#addNew").hide();
				$("#measurementDropDown").show();
				$("#selectMeasurement").show();
				$("#offshelf").hide();
				
				$("#sizeMeasurementDiv").hide();
				$("#preferredMeasurementDiv").show();
				
				var $descOp = $(this).attr('desc');
				$sec = $(this).parent().parent().parent().parent();
				// console.log('tagname:'+$sec.get(0).tagName);
				$sec2 = $sec.next();
				$ch1 = $sec2.children('#options').children('#right_column')
						.children('#options');
				// console.log('tagname:'+$ch1.prop('tagName'));
				$pTag = $ch1.find('#content');
				// console.log('tagname:'+$pTag.prop('tagName'));
				$($pTag).text($descOp);

				return true;

			});
	$("#dummyMeasurement").click(
			function() {
				$("#addNew").hide();
				$("#measurementDropDown").hide();
				$("#selectMeasurement").hide();
				$("#offshelf").show();
				
				$("#sizeMeasurementDiv").hide();
				$("#preferredMeasurementDiv").hide();
				
				var $descOp = $(this).attr('desc');
				$sec = $(this).parent().parent().parent().parent();
				// console.log('tagname:'+$sec.get(0).tagName);
				$sec2 = $sec.next();
				$ch1 = $sec2.children('#options').children('#right_column')
						.children('#options');
				// console.log('tagname:'+$ch1.prop('tagName'));
				$pTag = $ch1.find('#content');
				// console.log('tagname:'+$pTag.prop('tagName'));
				$($pTag).text($descOp);

				return true;

			});
	
	// Setup form validation on the #register-form element
	$("#addnew").validate({

		// Specify the validation rules
		rules : {
			name : "required",
			description : "required",
			height : "required",
			chest : "required",
			bust : "required",
			dartLine : "required",
			waist : "required",
			hip : "required",
			shoulder : "required",
			sleeveLength : "required",
			nwaist : "required",
			armhole : "required",
			tsleeve : "required",
			bsleeve : "required",
			fneck : "required",
			bneck : "required",
			pantheight : "required",
			seat : "required",
		/*
		 * height: { required: true, number: true }, chest: { required: true,
		 * number: true }, bust: { required: true, number: true }, dartLine: {
		 * required: true, number: true }, waist: { required: true, number: true },
		 * hip: { required: true, number: true }, shoulder: { required: true,
		 * number: true }, sleeveLength: { required: true, number: true },
		 */
		},

		// Specify the validation error messages
		messages : {
			name : "Please enter Measurement name",
			description : "Please enter Measurement desc",
			height : "Please enter a valid number",
			chest : "Please enter a valid number",
			bust : "Please enter a valid number",
			dartLine : "Please enter a valid number",
			waist : "Please enter a valid number",
			hip : "Please enter a valid number",
			shoulder : "Please enter a valid number",
			sleeveLength : "Please enter a valid number",
			nwaist : "Please enter a valid number",
			armhole : "Please enter a valid number",
			tsleeve : "Please enter a valid number",
			bsleeve : "Please enter a valid number",
			fneck : "Please enter a valid number",
			bneck : "Please enter a valid number",
			pantheight : "Please enter a valid number",
			seat : "Please enter a valid number",
		},

		submitHandler : function(form) {
			form.submit();
		}
	});

	$('#height').on(
			'focus',
			function() {
				var $this = $(this);
				$imgSrc = $this.attr('imgsrc');
				$sec = $this.parent().parent().parent().parent();
				// console.log('tagname:'+$sec.get(0).tagName);
				$sec2 = $sec.next();
				// $ch1 = $sec2.find('#options');
				$ch1 = $sec2.children('#options');
				// console.log('tagname:'+$ch1.prop('tagName'));
				$imgTag = $ch1.find('#dImg');
				// console.log('tagname:'+$ch2.prop('tagName'));
				// $imgTag.src = $imgSrc;
				$($imgTag).attr('src', $imgSrc);

				var $descOp = $(this).attr('desc');
				$sec = $(this).parent().parent().parent().parent();
				// console.log('tagname:'+$sec.get(0).tagName);
				$sec2 = $sec.next();
				$ch1 = $sec2.children('#options').children('#right_column')
						.children('#options');
				// console.log('tagname:'+$ch1.prop('tagName'));
				$pTag = $ch1.find('#content');
				// console.log('tagname:'+$pTag.prop('tagName'));
				$($pTag).text($descOp);

			}).on(
			'blur',
			function() {
				var $this = $(this);
				$sec = $this.parent().parent().parent().parent();
				// console.log('tagname:'+$sec.get(0).tagName);
				$sec2 = $sec.next();
				$ch1 = $sec2.children('#options');
				$imgTag = $ch1.find('#dImg');
				// $imgTag.src = '/img/blank.gif';
				$($imgTag).attr('src', '/img/blank.gif');

				// var $descOp = $(this).attr('desc');
				$sec = $(this).parent().parent().parent().parent();
				// console.log('tagname:'+$sec.get(0).tagName);
				$sec2 = $sec.next();
				$ch1 = $sec2.children('#options').children('#right_column')
						.children('#options');
				// console.log('tagname:'+$ch1.prop('tagName'));
				$pTag = $ch1.find('#content');
				// console.log('tagname:'+$pTag.prop('tagName'));
				$($pTag).text("");
			}).hover(function() {
					var $this = $(this);
					$imgSrc = $this.attr('imgsrc');
					$sec = $this.parent().parent().parent().parent();
					// console.log('tagname:'+$sec.get(0).tagName);
					$sec2 = $sec.next();
					// $ch1 = $sec2.find('#options');
					$ch1 = $sec2.children('#options');
					// console.log('tagname:'+$ch1.prop('tagName'));
					$imgTag = $ch1.find('#dImg');
					// console.log('tagname:'+$ch2.prop('tagName'));
					// $imgTag.src = $imgSrc;
					$($imgTag).attr('src', $imgSrc);

					var $descOp = $(this).attr('desc');
					$sec = $(this).parent().parent().parent().parent();
					// console.log('tagname:'+$sec.get(0).tagName);
					$sec2 = $sec.next();
					$ch1 = $sec2.children('#options').children('#right_column')
							.children('#options');
					// console.log('tagname:'+$ch1.prop('tagName'));
					$pTag = $ch1.find('#content');
					// console.log('tagname:'+$pTag.prop('tagName'));
					$($pTag).text($descOp);
					},function() {
								var $this = $(this);
								$sec = $this.parent().parent().parent().parent();
								// console.log('tagname:'+$sec.get(0).tagName);
								$sec2 = $sec.next();
								$ch1 = $sec2.children('#options');
								$imgTag = $ch1.find('#dImg');
								// $imgTag.src = '/img/blank.gif';
								$($imgTag).attr('src', '/img/blank.gif');

								// var $descOp = $(this).attr('desc');
								$sec = $(this).parent().parent().parent().parent();
								// console.log('tagname:'+$sec.get(0).tagName);
								$sec2 = $sec.next();
								$ch1 = $sec2.children('#options').children('#right_column')
										.children('#options');
								// console.log('tagname:'+$ch1.prop('tagName'));
								$pTag = $ch1.find('#content');
								// console.log('tagname:'+$pTag.prop('tagName'));
								$($pTag).text("");
							});

	$('#chest').on(
			'focus',
			function() {
				var $this = $(this);
				$imgSrc = $this.attr('imgsrc');
				$sec = $this.parent().parent().parent().parent();
				// console.log('tagname:'+$sec.get(0).tagName);
				$sec2 = $sec.next();
				// $ch1 = $sec2.find('#options');
				$ch1 = $sec2.children('#options');
				// console.log('tagname:'+$ch1.prop('tagName'));
				$imgTag = $ch1.find('#dImg');
				// console.log('tagname:'+$ch2.prop('tagName'));
				// $imgTag.src = $imgSrc;
				$($imgTag).attr('src', $imgSrc);

				var $descOp = $(this).attr('desc');
				$sec = $(this).parent().parent().parent().parent();
				// console.log('tagname:'+$sec.get(0).tagName);
				$sec2 = $sec.next();
				$ch1 = $sec2.children('#options').children('#right_column')
						.children('#options');
				// console.log('tagname:'+$ch1.prop('tagName'));
				$pTag = $ch1.find('#content');
				// console.log('tagname:'+$pTag.prop('tagName'));
				$($pTag).text($descOp);

			}).on(
			'blur',
			function() {
				var $this = $(this);
				$sec = $this.parent().parent().parent().parent();
				// console.log('tagname:'+$sec.get(0).tagName);
				$sec2 = $sec.next();
				$ch1 = $sec2.children('#options');
				$imgTag = $ch1.find('#dImg');
				// $imgTag.src = '/img/blank.gif';
				$($imgTag).attr('src', '/img/blank.gif');

				var $descOp = $(this).attr('desc');
				$sec = $(this).parent().parent().parent().parent();
				// console.log('tagname:'+$sec.get(0).tagName);
				$sec2 = $sec.next();
				$ch1 = $sec2.children('#options').children('#right_column')
						.children('#options');
				// console.log('tagname:'+$ch1.prop('tagName'));
				$pTag = $ch1.find('#content');
				// console.log('tagname:'+$pTag.prop('tagName'));
				$($pTag).text("");
			}).hover(function() {
						var $this = $(this);
						$imgSrc = $this.attr('imgsrc');
						$sec = $this.parent().parent().parent().parent();
						// console.log('tagname:'+$sec.get(0).tagName);
						$sec2 = $sec.next();
						// $ch1 = $sec2.find('#options');
						$ch1 = $sec2.children('#options');
						// console.log('tagname:'+$ch1.prop('tagName'));
						$imgTag = $ch1.find('#dImg');
						// console.log('tagname:'+$ch2.prop('tagName'));
						// $imgTag.src = $imgSrc;
						$($imgTag).attr('src', $imgSrc);

						var $descOp = $(this).attr('desc');
						$sec = $(this).parent().parent().parent().parent();
						// console.log('tagname:'+$sec.get(0).tagName);
						$sec2 = $sec.next();
						$ch1 = $sec2.children('#options').children('#right_column')
								.children('#options');
						// console.log('tagname:'+$ch1.prop('tagName'));
						$pTag = $ch1.find('#content');
						// console.log('tagname:'+$pTag.prop('tagName'));
						$($pTag).text($descOp);

					},function() {
						var $this = $(this);
						$sec = $this.parent().parent().parent().parent();
						// console.log('tagname:'+$sec.get(0).tagName);
						$sec2 = $sec.next();
						$ch1 = $sec2.children('#options');
						$imgTag = $ch1.find('#dImg');
						// $imgTag.src = '/img/blank.gif';
						$($imgTag).attr('src', '/img/blank.gif');

						var $descOp = $(this).attr('desc');
						$sec = $(this).parent().parent().parent().parent();
						// console.log('tagname:'+$sec.get(0).tagName);
						$sec2 = $sec.next();
						$ch1 = $sec2.children('#options').children('#right_column')
								.children('#options');
						// console.log('tagname:'+$ch1.prop('tagName'));
						$pTag = $ch1.find('#content');
						// console.log('tagname:'+$pTag.prop('tagName'));
						$($pTag).text("");
					});

	$('#bust').on(
			'focus',
			function() {
				var $this = $(this);
				$imgSrc = $this.attr('imgsrc');
				$sec = $this.parent().parent().parent().parent();
				// console.log('tagname:'+$sec.get(0).tagName);
				$sec2 = $sec.next();
				// $ch1 = $sec2.find('#options');
				$ch1 = $sec2.children('#options');
				// console.log('tagname:'+$ch1.prop('tagName'));
				$imgTag = $ch1.find('#dImg');
				// console.log('tagname:'+$ch2.prop('tagName'));
				// $imgTag.src = $imgSrc;
				$($imgTag).attr('src', $imgSrc);

				var $descOp = $(this).attr('desc');
				$sec = $(this).parent().parent().parent().parent();
				// console.log('tagname:'+$sec.get(0).tagName);
				$sec2 = $sec.next();
				$ch1 = $sec2.children('#options').children('#right_column')
						.children('#options');
				// console.log('tagname:'+$ch1.prop('tagName'));
				$pTag = $ch1.find('#content');
				// console.log('tagname:'+$pTag.prop('tagName'));
				$($pTag).text($descOp);

			}).on(
			'blur',
			function() {
				var $this = $(this);
				$sec = $this.parent().parent().parent().parent();
				// console.log('tagname:'+$sec.get(0).tagName);
				$sec2 = $sec.next();
				$ch1 = $sec2.children('#options');
				$imgTag = $ch1.find('#dImg');
				// $imgTag.src = '/img/blank.gif';
				$($imgTag).attr('src', '/img/blank.gif');

				var $descOp = $(this).attr('desc');
				$sec = $(this).parent().parent().parent().parent();
				// console.log('tagname:'+$sec.get(0).tagName);
				$sec2 = $sec.next();
				$ch1 = $sec2.children('#options').children('#right_column')
						.children('#options');
				// console.log('tagname:'+$ch1.prop('tagName'));
				$pTag = $ch1.find('#content');
				// console.log('tagname:'+$pTag.prop('tagName'));
				$($pTag).text("");

			}).hover(function() {
						var $this = $(this);
						$imgSrc = $this.attr('imgsrc');
						$sec = $this.parent().parent().parent().parent();
						// console.log('tagname:'+$sec.get(0).tagName);
						$sec2 = $sec.next();
						// $ch1 = $sec2.find('#options');
						$ch1 = $sec2.children('#options');
						// console.log('tagname:'+$ch1.prop('tagName'));
						$imgTag = $ch1.find('#dImg');
						// console.log('tagname:'+$ch2.prop('tagName'));
						// $imgTag.src = $imgSrc;
						$($imgTag).attr('src', $imgSrc);

						var $descOp = $(this).attr('desc');
						$sec = $(this).parent().parent().parent().parent();
						// console.log('tagname:'+$sec.get(0).tagName);
						$sec2 = $sec.next();
						$ch1 = $sec2.children('#options').children('#right_column')
								.children('#options');
						// console.log('tagname:'+$ch1.prop('tagName'));
						$pTag = $ch1.find('#content');
						// console.log('tagname:'+$pTag.prop('tagName'));
						$($pTag).text($descOp);

					},function() {
						var $this = $(this);
						$sec = $this.parent().parent().parent().parent();
						// console.log('tagname:'+$sec.get(0).tagName);
						$sec2 = $sec.next();
						$ch1 = $sec2.children('#options');
						$imgTag = $ch1.find('#dImg');
						// $imgTag.src = '/img/blank.gif';
						$($imgTag).attr('src', '/img/blank.gif');

						var $descOp = $(this).attr('desc');
						$sec = $(this).parent().parent().parent().parent();
						// console.log('tagname:'+$sec.get(0).tagName);
						$sec2 = $sec.next();
						$ch1 = $sec2.children('#options').children('#right_column')
								.children('#options');
						// console.log('tagname:'+$ch1.prop('tagName'));
						$pTag = $ch1.find('#content');
						// console.log('tagname:'+$pTag.prop('tagName'));
						$($pTag).text("");

					});

	$('#dartLine').on(
			'focus',
			function() {
				var $this = $(this);
				$imgSrc = $this.attr('imgsrc');
				$sec = $this.parent().parent().parent().parent();
				// console.log('tagname:'+$sec.get(0).tagName);
				$sec2 = $sec.next();
				// $ch1 = $sec2.find('#options');
				$ch1 = $sec2.children('#options');
				// console.log('tagname:'+$ch1.prop('tagName'));
				$imgTag = $ch1.find('#dImg');
				// console.log('tagname:'+$ch2.prop('tagName'));
				// $imgTag.src = $imgSrc;
				$($imgTag).attr('src', $imgSrc);

				var $descOp = $(this).attr('desc');
				$sec = $(this).parent().parent().parent().parent();
				// console.log('tagname:'+$sec.get(0).tagName);
				$sec2 = $sec.next();
				$ch1 = $sec2.children('#options').children('#right_column')
						.children('#options');
				// console.log('tagname:'+$ch1.prop('tagName'));
				$pTag = $ch1.find('#content');
				// console.log('tagname:'+$pTag.prop('tagName'));
				$($pTag).text($descOp);

			}).on(
			'blur',
			function() {
				var $this = $(this);
				$sec = $this.parent().parent().parent().parent();
				// console.log('tagname:'+$sec.get(0).tagName);
				$sec2 = $sec.next();
				$ch1 = $sec2.children('#options');
				$imgTag = $ch1.find('#dImg');
				// $imgTag.src = '/img/blank.gif';
				$($imgTag).attr('src', '/img/blank.gif');

				var $descOp = $(this).attr('desc');
				$sec = $(this).parent().parent().parent().parent();
				// console.log('tagname:'+$sec.get(0).tagName);
				$sec2 = $sec.next();
				$ch1 = $sec2.children('#options').children('#right_column')
						.children('#options');
				// console.log('tagname:'+$ch1.prop('tagName'));
				$pTag = $ch1.find('#content');
				// console.log('tagname:'+$pTag.prop('tagName'));
				$($pTag).text("");

			}).hover(function() {
						var $this = $(this);
						$imgSrc = $this.attr('imgsrc');
						$sec = $this.parent().parent().parent().parent();
						// console.log('tagname:'+$sec.get(0).tagName);
						$sec2 = $sec.next();
						// $ch1 = $sec2.find('#options');
						$ch1 = $sec2.children('#options');
						// console.log('tagname:'+$ch1.prop('tagName'));
						$imgTag = $ch1.find('#dImg');
						// console.log('tagname:'+$ch2.prop('tagName'));
						// $imgTag.src = $imgSrc;
						$($imgTag).attr('src', $imgSrc);

						var $descOp = $(this).attr('desc');
						$sec = $(this).parent().parent().parent().parent();
						// console.log('tagname:'+$sec.get(0).tagName);
						$sec2 = $sec.next();
						$ch1 = $sec2.children('#options').children('#right_column')
								.children('#options');
						// console.log('tagname:'+$ch1.prop('tagName'));
						$pTag = $ch1.find('#content');
						// console.log('tagname:'+$pTag.prop('tagName'));
						$($pTag).text($descOp);

					},function() {
						var $this = $(this);
						$sec = $this.parent().parent().parent().parent();
						// console.log('tagname:'+$sec.get(0).tagName);
						$sec2 = $sec.next();
						$ch1 = $sec2.children('#options');
						$imgTag = $ch1.find('#dImg');
						// $imgTag.src = '/img/blank.gif';
						$($imgTag).attr('src', '/img/blank.gif');

						var $descOp = $(this).attr('desc');
						$sec = $(this).parent().parent().parent().parent();
						// console.log('tagname:'+$sec.get(0).tagName);
						$sec2 = $sec.next();
						$ch1 = $sec2.children('#options').children('#right_column')
								.children('#options');
						// console.log('tagname:'+$ch1.prop('tagName'));
						$pTag = $ch1.find('#content');
						// console.log('tagname:'+$pTag.prop('tagName'));
						$($pTag).text("");

					});

	$('#waist').on(
			'focus',
			function() {
				var $this = $(this);
				$imgSrc = $this.attr('imgsrc');
				$sec = $this.parent().parent().parent().parent();
				// console.log('tagname:'+$sec.get(0).tagName);
				$sec2 = $sec.next();
				// $ch1 = $sec2.find('#options');
				$ch1 = $sec2.children('#options');
				// console.log('tagname:'+$ch1.prop('tagName'));
				$imgTag = $ch1.find('#dImg');
				// console.log('tagname:'+$ch2.prop('tagName'));
				// $imgTag.src = $imgSrc;
				$($imgTag).attr('src', $imgSrc);

				var $descOp = $(this).attr('desc');
				$sec = $(this).parent().parent().parent().parent();
				// console.log('tagname:'+$sec.get(0).tagName);
				$sec2 = $sec.next();
				$ch1 = $sec2.children('#options').children('#right_column')
						.children('#options');
				// console.log('tagname:'+$ch1.prop('tagName'));
				$pTag = $ch1.find('#content');
				// console.log('tagname:'+$pTag.prop('tagName'));
				$($pTag).text($descOp);

			}).on(
			'blur',
			function() {
				var $this = $(this);
				$sec = $this.parent().parent().parent().parent();
				// console.log('tagname:'+$sec.get(0).tagName);
				$sec2 = $sec.next();
				$ch1 = $sec2.children('#options');
				$imgTag = $ch1.find('#dImg');
				// $imgTag.src = '/img/blank.gif';
				$($imgTag).attr('src', '/img/blank.gif');

				var $descOp = $(this).attr('desc');
				$sec = $(this).parent().parent().parent().parent();
				// console.log('tagname:'+$sec.get(0).tagName);
				$sec2 = $sec.next();
				$ch1 = $sec2.children('#options').children('#right_column')
						.children('#options');
				// console.log('tagname:'+$ch1.prop('tagName'));
				$pTag = $ch1.find('#content');
				// console.log('tagname:'+$pTag.prop('tagName'));
				$($pTag).text("");
			}).hover(function() {
						var $this = $(this);
						$imgSrc = $this.attr('imgsrc');
						$sec = $this.parent().parent().parent().parent();
						// console.log('tagname:'+$sec.get(0).tagName);
						$sec2 = $sec.next();
						// $ch1 = $sec2.find('#options');
						$ch1 = $sec2.children('#options');
						// console.log('tagname:'+$ch1.prop('tagName'));
						$imgTag = $ch1.find('#dImg');
						// console.log('tagname:'+$ch2.prop('tagName'));
						// $imgTag.src = $imgSrc;
						$($imgTag).attr('src', $imgSrc);

						var $descOp = $(this).attr('desc');
						$sec = $(this).parent().parent().parent().parent();
						// console.log('tagname:'+$sec.get(0).tagName);
						$sec2 = $sec.next();
						$ch1 = $sec2.children('#options').children('#right_column')
								.children('#options');
						// console.log('tagname:'+$ch1.prop('tagName'));
						$pTag = $ch1.find('#content');
						// console.log('tagname:'+$pTag.prop('tagName'));
						$($pTag).text($descOp);

					},function() {
						var $this = $(this);
						$sec = $this.parent().parent().parent().parent();
						// console.log('tagname:'+$sec.get(0).tagName);
						$sec2 = $sec.next();
						$ch1 = $sec2.children('#options');
						$imgTag = $ch1.find('#dImg');
						// $imgTag.src = '/img/blank.gif';
						$($imgTag).attr('src', '/img/blank.gif');

						var $descOp = $(this).attr('desc');
						$sec = $(this).parent().parent().parent().parent();
						// console.log('tagname:'+$sec.get(0).tagName);
						$sec2 = $sec.next();
						$ch1 = $sec2.children('#options').children('#right_column')
								.children('#options');
						// console.log('tagname:'+$ch1.prop('tagName'));
						$pTag = $ch1.find('#content');
						// console.log('tagname:'+$pTag.prop('tagName'));
						$($pTag).text("");
					});

	$('#hip').on(
			'focus',
			function() {
				var $this = $(this);
				$imgSrc = $this.attr('imgsrc');
				$sec = $this.parent().parent().parent().parent();
				// console.log('tagname:'+$sec.get(0).tagName);
				$sec2 = $sec.next();
				// $ch1 = $sec2.find('#options');
				$ch1 = $sec2.children('#options');
				// console.log('tagname:'+$ch1.prop('tagName'));
				$imgTag = $ch1.find('#dImg');
				// console.log('tagname:'+$ch2.prop('tagName'));
				// $imgTag.src = $imgSrc;
				$($imgTag).attr('src', $imgSrc);

				var $descOp = $(this).attr('desc');
				$sec = $(this).parent().parent().parent().parent();
				// console.log('tagname:'+$sec.get(0).tagName);
				$sec2 = $sec.next();
				$ch1 = $sec2.children('#options').children('#right_column')
						.children('#options');
				// console.log('tagname:'+$ch1.prop('tagName'));
				$pTag = $ch1.find('#content');
				// console.log('tagname:'+$pTag.prop('tagName'));
				$($pTag).text($descOp);

			}).on(
			'blur',
			function() {
				var $this = $(this);
				$sec = $this.parent().parent().parent().parent();
				// console.log('tagname:'+$sec.get(0).tagName);
				$sec2 = $sec.next();
				$ch1 = $sec2.children('#options');
				$imgTag = $ch1.find('#dImg');
				// $imgTag.src = '/img/blank.gif';
				$($imgTag).attr('src', '/img/blank.gif');

				var $descOp = $(this).attr('desc');
				$sec = $(this).parent().parent().parent().parent();
				// console.log('tagname:'+$sec.get(0).tagName);
				$sec2 = $sec.next();
				$ch1 = $sec2.children('#options').children('#right_column')
						.children('#options');
				// console.log('tagname:'+$ch1.prop('tagName'));
				$pTag = $ch1.find('#content');
				// console.log('tagname:'+$pTag.prop('tagName'));
				$($pTag).text("");
			}).hover(function() {
						var $this = $(this);
						$imgSrc = $this.attr('imgsrc');
						$sec = $this.parent().parent().parent().parent();
						// console.log('tagname:'+$sec.get(0).tagName);
						$sec2 = $sec.next();
						// $ch1 = $sec2.find('#options');
						$ch1 = $sec2.children('#options');
						// console.log('tagname:'+$ch1.prop('tagName'));
						$imgTag = $ch1.find('#dImg');
						// console.log('tagname:'+$ch2.prop('tagName'));
						// $imgTag.src = $imgSrc;
						$($imgTag).attr('src', $imgSrc);

						var $descOp = $(this).attr('desc');
						$sec = $(this).parent().parent().parent().parent();
						// console.log('tagname:'+$sec.get(0).tagName);
						$sec2 = $sec.next();
						$ch1 = $sec2.children('#options').children('#right_column')
								.children('#options');
						// console.log('tagname:'+$ch1.prop('tagName'));
						$pTag = $ch1.find('#content');
						// console.log('tagname:'+$pTag.prop('tagName'));
						$($pTag).text($descOp);

					},function() {
						var $this = $(this);
						$sec = $this.parent().parent().parent().parent();
						// console.log('tagname:'+$sec.get(0).tagName);
						$sec2 = $sec.next();
						$ch1 = $sec2.children('#options');
						$imgTag = $ch1.find('#dImg');
						// $imgTag.src = '/img/blank.gif';
						$($imgTag).attr('src', '/img/blank.gif');

						var $descOp = $(this).attr('desc');
						$sec = $(this).parent().parent().parent().parent();
						// console.log('tagname:'+$sec.get(0).tagName);
						$sec2 = $sec.next();
						$ch1 = $sec2.children('#options').children('#right_column')
								.children('#options');
						// console.log('tagname:'+$ch1.prop('tagName'));
						$pTag = $ch1.find('#content');
						// console.log('tagname:'+$pTag.prop('tagName'));
						$($pTag).text("");
					});

	$('#shoulder').on(
			'focus',
			function() {
				var $this = $(this);
				$imgSrc = $this.attr('imgsrc');
				$sec = $this.parent().parent().parent().parent();
				// console.log('tagname:'+$sec.get(0).tagName);
				$sec2 = $sec.next();
				// $ch1 = $sec2.find('#options');
				$ch1 = $sec2.children('#options');
				// console.log('tagname:'+$ch1.prop('tagName'));
				$imgTag = $ch1.find('#dImg');
				// console.log('tagname:'+$ch2.prop('tagName'));
				// $imgTag.src = $imgSrc;
				$($imgTag).attr('src', $imgSrc);

				var $descOp = $(this).attr('desc');
				$sec = $(this).parent().parent().parent().parent();
				// console.log('tagname:'+$sec.get(0).tagName);
				$sec2 = $sec.next();
				$ch1 = $sec2.children('#options').children('#right_column')
						.children('#options');
				// console.log('tagname:'+$ch1.prop('tagName'));
				$pTag = $ch1.find('#content');
				// console.log('tagname:'+$pTag.prop('tagName'));
				$($pTag).text($descOp);

			}).on(
			'blur',
			function() {
				var $this = $(this);
				$sec = $this.parent().parent().parent().parent();
				// console.log('tagname:'+$sec.get(0).tagName);
				$sec2 = $sec.next();
				$ch1 = $sec2.children('#options');
				$imgTag = $ch1.find('#dImg');
				// $imgTag.src = '/img/blank.gif';
				$($imgTag).attr('src', '/img/blank.gif');

				var $descOp = $(this).attr('desc');
				$sec = $(this).parent().parent().parent().parent();
				// console.log('tagname:'+$sec.get(0).tagName);
				$sec2 = $sec.next();
				$ch1 = $sec2.children('#options').children('#right_column')
						.children('#options');
				// console.log('tagname:'+$ch1.prop('tagName'));
				$pTag = $ch1.find('#content');
				// console.log('tagname:'+$pTag.prop('tagName'));
				$($pTag).text("");
			}).hover(function() {
						var $this = $(this);
						$imgSrc = $this.attr('imgsrc');
						$sec = $this.parent().parent().parent().parent();
						// console.log('tagname:'+$sec.get(0).tagName);
						$sec2 = $sec.next();
						// $ch1 = $sec2.find('#options');
						$ch1 = $sec2.children('#options');
						// console.log('tagname:'+$ch1.prop('tagName'));
						$imgTag = $ch1.find('#dImg');
						// console.log('tagname:'+$ch2.prop('tagName'));
						// $imgTag.src = $imgSrc;
						$($imgTag).attr('src', $imgSrc);

						var $descOp = $(this).attr('desc');
						$sec = $(this).parent().parent().parent().parent();
						// console.log('tagname:'+$sec.get(0).tagName);
						$sec2 = $sec.next();
						$ch1 = $sec2.children('#options').children('#right_column')
								.children('#options');
						// console.log('tagname:'+$ch1.prop('tagName'));
						$pTag = $ch1.find('#content');
						// console.log('tagname:'+$pTag.prop('tagName'));
						$($pTag).text($descOp);

					},function() {
						var $this = $(this);
						$sec = $this.parent().parent().parent().parent();
						// console.log('tagname:'+$sec.get(0).tagName);
						$sec2 = $sec.next();
						$ch1 = $sec2.children('#options');
						$imgTag = $ch1.find('#dImg');
						// $imgTag.src = '/img/blank.gif';
						$($imgTag).attr('src', '/img/blank.gif');

						var $descOp = $(this).attr('desc');
						$sec = $(this).parent().parent().parent().parent();
						// console.log('tagname:'+$sec.get(0).tagName);
						$sec2 = $sec.next();
						$ch1 = $sec2.children('#options').children('#right_column')
								.children('#options');
						// console.log('tagname:'+$ch1.prop('tagName'));
						$pTag = $ch1.find('#content');
						// console.log('tagname:'+$pTag.prop('tagName'));
						$($pTag).text("");
					});

	$('#sleeveLength').on(
			'focus',
			function() {
				var $this = $(this);
				$imgSrc = $this.attr('imgsrc');
				$sec = $this.parent().parent().parent().parent();
				// console.log('tagname:'+$sec.get(0).tagName);
				$sec2 = $sec.next();
				// $ch1 = $sec2.find('#options');
				$ch1 = $sec2.children('#options');
				// console.log('tagname:'+$ch1.prop('tagName'));
				$imgTag = $ch1.find('#dImg');
				// console.log('tagname:'+$ch2.prop('tagName'));
				// $imgTag.src = $imgSrc;
				$($imgTag).attr('src', $imgSrc);

				var $descOp = $(this).attr('desc');
				$sec = $(this).parent().parent().parent().parent();
				// console.log('tagname:'+$sec.get(0).tagName);
				$sec2 = $sec.next();
				$ch1 = $sec2.children('#options').children('#right_column')
						.children('#options');
				// console.log('tagname:'+$ch1.prop('tagName'));
				$pTag = $ch1.find('#content');
				// console.log('tagname:'+$pTag.prop('tagName'));
				$($pTag).text($descOp);

			}).on(
			'blur',
			function() {
				var $this = $(this);
				$sec = $this.parent().parent().parent().parent();
				// console.log('tagname:'+$sec.get(0).tagName);
				$sec2 = $sec.next();
				$ch1 = $sec2.children('#options');
				$imgTag = $ch1.find('#dImg');
				// $imgTag.src = '/img/blank.gif';
				$($imgTag).attr('src', '/img/blank.gif');

				var $descOp = $(this).attr('desc');
				$sec = $(this).parent().parent().parent().parent();
				// console.log('tagname:'+$sec.get(0).tagName);
				$sec2 = $sec.next();
				$ch1 = $sec2.children('#options').children('#right_column')
						.children('#options');
				// console.log('tagname:'+$ch1.prop('tagName'));
				$pTag = $ch1.find('#content');
				// console.log('tagname:'+$pTag.prop('tagName'));
				$($pTag).text("");

			}).hover(function() {
						var $this = $(this);
						$imgSrc = $this.attr('imgsrc');
						$sec = $this.parent().parent().parent().parent();
						// console.log('tagname:'+$sec.get(0).tagName);
						$sec2 = $sec.next();
						// $ch1 = $sec2.find('#options');
						$ch1 = $sec2.children('#options');
						// console.log('tagname:'+$ch1.prop('tagName'));
						$imgTag = $ch1.find('#dImg');
						// console.log('tagname:'+$ch2.prop('tagName'));
						// $imgTag.src = $imgSrc;
						$($imgTag).attr('src', $imgSrc);

						var $descOp = $(this).attr('desc');
						$sec = $(this).parent().parent().parent().parent();
						// console.log('tagname:'+$sec.get(0).tagName);
						$sec2 = $sec.next();
						$ch1 = $sec2.children('#options').children('#right_column')
								.children('#options');
						// console.log('tagname:'+$ch1.prop('tagName'));
						$pTag = $ch1.find('#content');
						// console.log('tagname:'+$pTag.prop('tagName'));
						$($pTag).text($descOp);

					},function() {
						var $this = $(this);
						$sec = $this.parent().parent().parent().parent();
						// console.log('tagname:'+$sec.get(0).tagName);
						$sec2 = $sec.next();
						$ch1 = $sec2.children('#options');
						$imgTag = $ch1.find('#dImg');
						// $imgTag.src = '/img/blank.gif';
						$($imgTag).attr('src', '/img/blank.gif');

						var $descOp = $(this).attr('desc');
						$sec = $(this).parent().parent().parent().parent();
						// console.log('tagname:'+$sec.get(0).tagName);
						$sec2 = $sec.next();
						$ch1 = $sec2.children('#options').children('#right_column')
								.children('#options');
						// console.log('tagname:'+$ch1.prop('tagName'));
						$pTag = $ch1.find('#content');
						// console.log('tagname:'+$pTag.prop('tagName'));
						$($pTag).text("");

					});
	$('#nwaist').on(
			'focus',
			function() {
				var $this = $(this);
				$imgSrc = $this.attr('imgsrc');
				$sec = $this.parent().parent().parent().parent();
				// console.log('tagname:'+$sec.get(0).tagName);
				$sec2 = $sec.next();
				// $ch1 = $sec2.find('#options');
				$ch1 = $sec2.children('#options');
				// console.log('tagname:'+$ch1.prop('tagName'));
				$imgTag = $ch1.find('#dImg');
				// console.log('tagname:'+$ch2.prop('tagName'));
				// $imgTag.src = $imgSrc;
				$($imgTag).attr('src', $imgSrc);

				var $descOp = $(this).attr('desc');
				$sec = $(this).parent().parent().parent().parent();
				// console.log('tagname:'+$sec.get(0).tagName);
				$sec2 = $sec.next();
				$ch1 = $sec2.children('#options').children('#right_column')
						.children('#options');
				// console.log('tagname:'+$ch1.prop('tagName'));
				$pTag = $ch1.find('#content');
				// console.log('tagname:'+$pTag.prop('tagName'));
				$($pTag).text($descOp);

			}).on(
			'blur',
			function() {
				var $this = $(this);
				$sec = $this.parent().parent().parent().parent();
				// console.log('tagname:'+$sec.get(0).tagName);
				$sec2 = $sec.next();
				$ch1 = $sec2.children('#options');
				$imgTag = $ch1.find('#dImg');
				// $imgTag.src = '/img/blank.gif';
				$($imgTag).attr('src', '/img/blank.gif');

				var $descOp = $(this).attr('desc');
				$sec = $(this).parent().parent().parent().parent();
				// console.log('tagname:'+$sec.get(0).tagName);
				$sec2 = $sec.next();
				$ch1 = $sec2.children('#options').children('#right_column')
						.children('#options');
				// console.log('tagname:'+$ch1.prop('tagName'));
				$pTag = $ch1.find('#content');
				// console.log('tagname:'+$pTag.prop('tagName'));
				$($pTag).text("");
			}).hover(function() {
						var $this = $(this);
						$imgSrc = $this.attr('imgsrc');
						$sec = $this.parent().parent().parent().parent();
						// console.log('tagname:'+$sec.get(0).tagName);
						$sec2 = $sec.next();
						// $ch1 = $sec2.find('#options');
						$ch1 = $sec2.children('#options');
						// console.log('tagname:'+$ch1.prop('tagName'));
						$imgTag = $ch1.find('#dImg');
						// console.log('tagname:'+$ch2.prop('tagName'));
						// $imgTag.src = $imgSrc;
						$($imgTag).attr('src', $imgSrc);

						var $descOp = $(this).attr('desc');
						$sec = $(this).parent().parent().parent().parent();
						// console.log('tagname:'+$sec.get(0).tagName);
						$sec2 = $sec.next();
						$ch1 = $sec2.children('#options').children('#right_column')
								.children('#options');
						// console.log('tagname:'+$ch1.prop('tagName'));
						$pTag = $ch1.find('#content');
						// console.log('tagname:'+$pTag.prop('tagName'));
						$($pTag).text($descOp);

					},function() {
						var $this = $(this);
						$sec = $this.parent().parent().parent().parent();
						// console.log('tagname:'+$sec.get(0).tagName);
						$sec2 = $sec.next();
						$ch1 = $sec2.children('#options');
						$imgTag = $ch1.find('#dImg');
						// $imgTag.src = '/img/blank.gif';
						$($imgTag).attr('src', '/img/blank.gif');

						var $descOp = $(this).attr('desc');
						$sec = $(this).parent().parent().parent().parent();
						// console.log('tagname:'+$sec.get(0).tagName);
						$sec2 = $sec.next();
						$ch1 = $sec2.children('#options').children('#right_column')
								.children('#options');
						// console.log('tagname:'+$ch1.prop('tagName'));
						$pTag = $ch1.find('#content');
						// console.log('tagname:'+$pTag.prop('tagName'));
						$($pTag).text("");
					});

	$('#armhole').on(
			'focus',
			function() {
				var $this = $(this);
				$imgSrc = $this.attr('imgsrc');
				$sec = $this.parent().parent().parent().parent();
				// console.log('tagname:'+$sec.get(0).tagName);
				$sec2 = $sec.next();
				// $ch1 = $sec2.find('#options');
				$ch1 = $sec2.children('#options');
				// console.log('tagname:'+$ch1.prop('tagName'));
				$imgTag = $ch1.find('#dImg');
				// console.log('tagname:'+$ch2.prop('tagName'));
				// $imgTag.src = $imgSrc;
				$($imgTag).attr('src', $imgSrc);

				var $descOp = $(this).attr('desc');
				$sec = $(this).parent().parent().parent().parent();
				// console.log('tagname:'+$sec.get(0).tagName);
				$sec2 = $sec.next();
				$ch1 = $sec2.children('#options').children('#right_column')
						.children('#options');
				// console.log('tagname:'+$ch1.prop('tagName'));
				$pTag = $ch1.find('#content');
				// console.log('tagname:'+$pTag.prop('tagName'));
				$($pTag).text($descOp);

			}).on(
			'blur',
			function() {
				var $this = $(this);
				$sec = $this.parent().parent().parent().parent();
				// console.log('tagname:'+$sec.get(0).tagName);
				$sec2 = $sec.next();
				$ch1 = $sec2.children('#options');
				$imgTag = $ch1.find('#dImg');
				// $imgTag.src = '/img/blank.gif';
				$($imgTag).attr('src', '/img/blank.gif');

				var $descOp = $(this).attr('desc');
				$sec = $(this).parent().parent().parent().parent();
				// console.log('tagname:'+$sec.get(0).tagName);
				$sec2 = $sec.next();
				$ch1 = $sec2.children('#options').children('#right_column')
						.children('#options');
				// console.log('tagname:'+$ch1.prop('tagName'));
				$pTag = $ch1.find('#content');
				// console.log('tagname:'+$pTag.prop('tagName'));
				$($pTag).text("");
			}).hover(function() {
						var $this = $(this);
						$imgSrc = $this.attr('imgsrc');
						$sec = $this.parent().parent().parent().parent();
						// console.log('tagname:'+$sec.get(0).tagName);
						$sec2 = $sec.next();
						// $ch1 = $sec2.find('#options');
						$ch1 = $sec2.children('#options');
						// console.log('tagname:'+$ch1.prop('tagName'));
						$imgTag = $ch1.find('#dImg');
						// console.log('tagname:'+$ch2.prop('tagName'));
						// $imgTag.src = $imgSrc;
						$($imgTag).attr('src', $imgSrc);

						var $descOp = $(this).attr('desc');
						$sec = $(this).parent().parent().parent().parent();
						// console.log('tagname:'+$sec.get(0).tagName);
						$sec2 = $sec.next();
						$ch1 = $sec2.children('#options').children('#right_column')
								.children('#options');
						// console.log('tagname:'+$ch1.prop('tagName'));
						$pTag = $ch1.find('#content');
						// console.log('tagname:'+$pTag.prop('tagName'));
						$($pTag).text($descOp);

					},function() {
						var $this = $(this);
						$sec = $this.parent().parent().parent().parent();
						// console.log('tagname:'+$sec.get(0).tagName);
						$sec2 = $sec.next();
						$ch1 = $sec2.children('#options');
						$imgTag = $ch1.find('#dImg');
						// $imgTag.src = '/img/blank.gif';
						$($imgTag).attr('src', '/img/blank.gif');

						var $descOp = $(this).attr('desc');
						$sec = $(this).parent().parent().parent().parent();
						// console.log('tagname:'+$sec.get(0).tagName);
						$sec2 = $sec.next();
						$ch1 = $sec2.children('#options').children('#right_column')
								.children('#options');
						// console.log('tagname:'+$ch1.prop('tagName'));
						$pTag = $ch1.find('#content');
						// console.log('tagname:'+$pTag.prop('tagName'));
						$($pTag).text("");
					});

	$('#tsleeve').on(
			'focus',
			function() {
				var $this = $(this);
				$imgSrc = $this.attr('imgsrc');
				$sec = $this.parent().parent().parent().parent();
				// console.log('tagname:'+$sec.get(0).tagName);
				$sec2 = $sec.next();
				// $ch1 = $sec2.find('#options');
				$ch1 = $sec2.children('#options');
				// console.log('tagname:'+$ch1.prop('tagName'));
				$imgTag = $ch1.find('#dImg');
				// console.log('tagname:'+$ch2.prop('tagName'));
				// $imgTag.src = $imgSrc;
				$($imgTag).attr('src', $imgSrc);

				var $descOp = $(this).attr('desc');
				$sec = $(this).parent().parent().parent().parent();
				// console.log('tagname:'+$sec.get(0).tagName);
				$sec2 = $sec.next();
				$ch1 = $sec2.children('#options').children('#right_column')
						.children('#options');
				// console.log('tagname:'+$ch1.prop('tagName'));
				$pTag = $ch1.find('#content');
				// console.log('tagname:'+$pTag.prop('tagName'));
				$($pTag).text($descOp);

			}).on(
			'blur',
			function() {
				var $this = $(this);
				$sec = $this.parent().parent().parent().parent();
				// console.log('tagname:'+$sec.get(0).tagName);
				$sec2 = $sec.next();
				$ch1 = $sec2.children('#options');
				$imgTag = $ch1.find('#dImg');
				// $imgTag.src = '/img/blank.gif';
				$($imgTag).attr('src', '/img/blank.gif');

				var $descOp = $(this).attr('desc');
				$sec = $(this).parent().parent().parent().parent();
				// console.log('tagname:'+$sec.get(0).tagName);
				$sec2 = $sec.next();
				$ch1 = $sec2.children('#options').children('#right_column')
						.children('#options');
				// console.log('tagname:'+$ch1.prop('tagName'));
				$pTag = $ch1.find('#content');
				// console.log('tagname:'+$pTag.prop('tagName'));
				$($pTag).text("");

			}).hover(function() {
						var $this = $(this);
						$imgSrc = $this.attr('imgsrc');
						$sec = $this.parent().parent().parent().parent();
						// console.log('tagname:'+$sec.get(0).tagName);
						$sec2 = $sec.next();
						// $ch1 = $sec2.find('#options');
						$ch1 = $sec2.children('#options');
						// console.log('tagname:'+$ch1.prop('tagName'));
						$imgTag = $ch1.find('#dImg');
						// console.log('tagname:'+$ch2.prop('tagName'));
						// $imgTag.src = $imgSrc;
						$($imgTag).attr('src', $imgSrc);

						var $descOp = $(this).attr('desc');
						$sec = $(this).parent().parent().parent().parent();
						// console.log('tagname:'+$sec.get(0).tagName);
						$sec2 = $sec.next();
						$ch1 = $sec2.children('#options').children('#right_column')
								.children('#options');
						// console.log('tagname:'+$ch1.prop('tagName'));
						$pTag = $ch1.find('#content');
						// console.log('tagname:'+$pTag.prop('tagName'));
						$($pTag).text($descOp);

					},function() {
						var $this = $(this);
						$sec = $this.parent().parent().parent().parent();
						// console.log('tagname:'+$sec.get(0).tagName);
						$sec2 = $sec.next();
						$ch1 = $sec2.children('#options');
						$imgTag = $ch1.find('#dImg');
						// $imgTag.src = '/img/blank.gif';
						$($imgTag).attr('src', '/img/blank.gif');

						var $descOp = $(this).attr('desc');
						$sec = $(this).parent().parent().parent().parent();
						// console.log('tagname:'+$sec.get(0).tagName);
						$sec2 = $sec.next();
						$ch1 = $sec2.children('#options').children('#right_column')
								.children('#options');
						// console.log('tagname:'+$ch1.prop('tagName'));
						$pTag = $ch1.find('#content');
						// console.log('tagname:'+$pTag.prop('tagName'));
						$($pTag).text("");

					});

	$('#bsleeve').on(
			'focus',
			function() {
				var $this = $(this);
				$imgSrc = $this.attr('imgsrc');
				$sec = $this.parent().parent().parent().parent();
				// console.log('tagname:'+$sec.get(0).tagName);
				$sec2 = $sec.next();
				// $ch1 = $sec2.find('#options');
				$ch1 = $sec2.children('#options');
				// console.log('tagname:'+$ch1.prop('tagName'));
				$imgTag = $ch1.find('#dImg');
				// console.log('tagname:'+$ch2.prop('tagName'));
				// $imgTag.src = $imgSrc;
				$($imgTag).attr('src', $imgSrc);

				var $descOp = $(this).attr('desc');
				$sec = $(this).parent().parent().parent().parent();
				// console.log('tagname:'+$sec.get(0).tagName);
				$sec2 = $sec.next();
				$ch1 = $sec2.children('#options').children('#right_column')
						.children('#options');
				// console.log('tagname:'+$ch1.prop('tagName'));
				$pTag = $ch1.find('#content');
				// console.log('tagname:'+$pTag.prop('tagName'));
				$($pTag).text($descOp);

			}).on(
			'blur',
			function() {
				var $this = $(this);
				$sec = $this.parent().parent().parent().parent();
				// console.log('tagname:'+$sec.get(0).tagName);
				$sec2 = $sec.next();
				$ch1 = $sec2.children('#options');
				$imgTag = $ch1.find('#dImg');
				// $imgTag.src = '/img/blank.gif';
				$($imgTag).attr('src', '/img/blank.gif');

				var $descOp = $(this).attr('desc');
				$sec = $(this).parent().parent().parent().parent();
				// console.log('tagname:'+$sec.get(0).tagName);
				$sec2 = $sec.next();
				$ch1 = $sec2.children('#options').children('#right_column')
						.children('#options');
				// console.log('tagname:'+$ch1.prop('tagName'));
				$pTag = $ch1.find('#content');
				// console.log('tagname:'+$pTag.prop('tagName'));
				$($pTag).text("");
			}).hover(function() {
						var $this = $(this);
						$imgSrc = $this.attr('imgsrc');
						$sec = $this.parent().parent().parent().parent();
						// console.log('tagname:'+$sec.get(0).tagName);
						$sec2 = $sec.next();
						// $ch1 = $sec2.find('#options');
						$ch1 = $sec2.children('#options');
						// console.log('tagname:'+$ch1.prop('tagName'));
						$imgTag = $ch1.find('#dImg');
						// console.log('tagname:'+$ch2.prop('tagName'));
						// $imgTag.src = $imgSrc;
						$($imgTag).attr('src', $imgSrc);

						var $descOp = $(this).attr('desc');
						$sec = $(this).parent().parent().parent().parent();
						// console.log('tagname:'+$sec.get(0).tagName);
						$sec2 = $sec.next();
						$ch1 = $sec2.children('#options').children('#right_column')
								.children('#options');
						// console.log('tagname:'+$ch1.prop('tagName'));
						$pTag = $ch1.find('#content');
						// console.log('tagname:'+$pTag.prop('tagName'));
						$($pTag).text($descOp);

					},function() {
						var $this = $(this);
						$sec = $this.parent().parent().parent().parent();
						// console.log('tagname:'+$sec.get(0).tagName);
						$sec2 = $sec.next();
						$ch1 = $sec2.children('#options');
						$imgTag = $ch1.find('#dImg');
						// $imgTag.src = '/img/blank.gif';
						$($imgTag).attr('src', '/img/blank.gif');

						var $descOp = $(this).attr('desc');
						$sec = $(this).parent().parent().parent().parent();
						// console.log('tagname:'+$sec.get(0).tagName);
						$sec2 = $sec.next();
						$ch1 = $sec2.children('#options').children('#right_column')
								.children('#options');
						// console.log('tagname:'+$ch1.prop('tagName'));
						$pTag = $ch1.find('#content');
						// console.log('tagname:'+$pTag.prop('tagName'));
						$($pTag).text("");
					});

	$('#fneck').on(
			'focus',
			function() {
				var $this = $(this);
				$imgSrc = $this.attr('imgsrc');
				$sec = $this.parent().parent().parent().parent();
				// console.log('tagname:'+$sec.get(0).tagName);
				$sec2 = $sec.next();
				// $ch1 = $sec2.find('#options');
				$ch1 = $sec2.children('#options');
				// console.log('tagname:'+$ch1.prop('tagName'));
				$imgTag = $ch1.find('#dImg');
				// console.log('tagname:'+$ch2.prop('tagName'));
				// $imgTag.src = $imgSrc;
				$($imgTag).attr('src', $imgSrc);

				var $descOp = $(this).attr('desc');
				$sec = $(this).parent().parent().parent().parent();
				// console.log('tagname:'+$sec.get(0).tagName);
				$sec2 = $sec.next();
				$ch1 = $sec2.children('#options').children('#right_column')
						.children('#options');
				// console.log('tagname:'+$ch1.prop('tagName'));
				$pTag = $ch1.find('#content');
				// console.log('tagname:'+$pTag.prop('tagName'));
				$($pTag).text($descOp);

			}).on(
			'blur',
			function() {
				var $this = $(this);
				$sec = $this.parent().parent().parent().parent();
				// console.log('tagname:'+$sec.get(0).tagName);
				$sec2 = $sec.next();
				$ch1 = $sec2.children('#options');
				$imgTag = $ch1.find('#dImg');
				// $imgTag.src = '/img/blank.gif';
				$($imgTag).attr('src', '/img/blank.gif');

				var $descOp = $(this).attr('desc');
				$sec = $(this).parent().parent().parent().parent();
				// console.log('tagname:'+$sec.get(0).tagName);
				$sec2 = $sec.next();
				$ch1 = $sec2.children('#options').children('#right_column')
						.children('#options');
				// console.log('tagname:'+$ch1.prop('tagName'));
				$pTag = $ch1.find('#content');
				// console.log('tagname:'+$pTag.prop('tagName'));
				$($pTag).text("");
			}).hover(function() {
						var $this = $(this);
						$imgSrc = $this.attr('imgsrc');
						$sec = $this.parent().parent().parent().parent();
						// console.log('tagname:'+$sec.get(0).tagName);
						$sec2 = $sec.next();
						// $ch1 = $sec2.find('#options');
						$ch1 = $sec2.children('#options');
						// console.log('tagname:'+$ch1.prop('tagName'));
						$imgTag = $ch1.find('#dImg');
						// console.log('tagname:'+$ch2.prop('tagName'));
						// $imgTag.src = $imgSrc;
						$($imgTag).attr('src', $imgSrc);

						var $descOp = $(this).attr('desc');
						$sec = $(this).parent().parent().parent().parent();
						// console.log('tagname:'+$sec.get(0).tagName);
						$sec2 = $sec.next();
						$ch1 = $sec2.children('#options').children('#right_column')
								.children('#options');
						// console.log('tagname:'+$ch1.prop('tagName'));
						$pTag = $ch1.find('#content');
						// console.log('tagname:'+$pTag.prop('tagName'));
						$($pTag).text($descOp);

					},function() {
						var $this = $(this);
						$sec = $this.parent().parent().parent().parent();
						// console.log('tagname:'+$sec.get(0).tagName);
						$sec2 = $sec.next();
						$ch1 = $sec2.children('#options');
						$imgTag = $ch1.find('#dImg');
						// $imgTag.src = '/img/blank.gif';
						$($imgTag).attr('src', '/img/blank.gif');

						var $descOp = $(this).attr('desc');
						$sec = $(this).parent().parent().parent().parent();
						// console.log('tagname:'+$sec.get(0).tagName);
						$sec2 = $sec.next();
						$ch1 = $sec2.children('#options').children('#right_column')
								.children('#options');
						// console.log('tagname:'+$ch1.prop('tagName'));
						$pTag = $ch1.find('#content');
						// console.log('tagname:'+$pTag.prop('tagName'));
						$($pTag).text("");
					});

	$('#bneck').on(
			'focus',
			function() {
				var $this = $(this);
				$imgSrc = $this.attr('imgsrc');
				$sec = $this.parent().parent().parent().parent();
				// console.log('tagname:'+$sec.get(0).tagName);
				$sec2 = $sec.next();
				// $ch1 = $sec2.find('#options');
				$ch1 = $sec2.children('#options');
				// console.log('tagname:'+$ch1.prop('tagName'));
				$imgTag = $ch1.find('#dImg');
				// console.log('tagname:'+$ch2.prop('tagName'));
				// $imgTag.src = $imgSrc;
				$($imgTag).attr('src', $imgSrc);

				var $descOp = $(this).attr('desc');
				$sec = $(this).parent().parent().parent().parent();
				// console.log('tagname:'+$sec.get(0).tagName);
				$sec2 = $sec.next();
				$ch1 = $sec2.children('#options').children('#right_column')
						.children('#options');
				// console.log('tagname:'+$ch1.prop('tagName'));
				$pTag = $ch1.find('#content');
				// console.log('tagname:'+$pTag.prop('tagName'));
				$($pTag).text($descOp);

			}).on(
			'blur',
			function() {
				var $this = $(this);
				$sec = $this.parent().parent().parent().parent();
				// console.log('tagname:'+$sec.get(0).tagName);
				$sec2 = $sec.next();
				$ch1 = $sec2.children('#options');
				$imgTag = $ch1.find('#dImg');
				// $imgTag.src = '/img/blank.gif';
				$($imgTag).attr('src', '/img/blank.gif');

				var $descOp = $(this).attr('desc');
				$sec = $(this).parent().parent().parent().parent();
				// console.log('tagname:'+$sec.get(0).tagName);
				$sec2 = $sec.next();
				$ch1 = $sec2.children('#options').children('#right_column')
						.children('#options');
				// console.log('tagname:'+$ch1.prop('tagName'));
				$pTag = $ch1.find('#content');
				// console.log('tagname:'+$pTag.prop('tagName'));
				$($pTag).text("");
			}).hover(function() {
						var $this = $(this);
						$imgSrc = $this.attr('imgsrc');
						$sec = $this.parent().parent().parent().parent();
						// console.log('tagname:'+$sec.get(0).tagName);
						$sec2 = $sec.next();
						// $ch1 = $sec2.find('#options');
						$ch1 = $sec2.children('#options');
						// console.log('tagname:'+$ch1.prop('tagName'));
						$imgTag = $ch1.find('#dImg');
						// console.log('tagname:'+$ch2.prop('tagName'));
						// $imgTag.src = $imgSrc;
						$($imgTag).attr('src', $imgSrc);

						var $descOp = $(this).attr('desc');
						$sec = $(this).parent().parent().parent().parent();
						// console.log('tagname:'+$sec.get(0).tagName);
						$sec2 = $sec.next();
						$ch1 = $sec2.children('#options').children('#right_column')
								.children('#options');
						// console.log('tagname:'+$ch1.prop('tagName'));
						$pTag = $ch1.find('#content');
						// console.log('tagname:'+$pTag.prop('tagName'));
						$($pTag).text($descOp);

					},function() {
						var $this = $(this);
						$sec = $this.parent().parent().parent().parent();
						// console.log('tagname:'+$sec.get(0).tagName);
						$sec2 = $sec.next();
						$ch1 = $sec2.children('#options');
						$imgTag = $ch1.find('#dImg');
						// $imgTag.src = '/img/blank.gif';
						$($imgTag).attr('src', '/img/blank.gif');

						var $descOp = $(this).attr('desc');
						$sec = $(this).parent().parent().parent().parent();
						// console.log('tagname:'+$sec.get(0).tagName);
						$sec2 = $sec.next();
						$ch1 = $sec2.children('#options').children('#right_column')
								.children('#options');
						// console.log('tagname:'+$ch1.prop('tagName'));
						$pTag = $ch1.find('#content');
						// console.log('tagname:'+$pTag.prop('tagName'));
						$($pTag).text("");
					});
	$('#pantheight').on(
			'focus',
			function() {
				var $this = $(this);
				$imgSrc = $this.attr('imgsrc');
				$sec = $this.parent().parent().parent().parent();
				// console.log('tagname:'+$sec.get(0).tagName);
				$sec2 = $sec.next();
				// $ch1 = $sec2.find('#options');
				$ch1 = $sec2.children('#options');
				// console.log('tagname:'+$ch1.prop('tagName'));
				$imgTag = $ch1.find('#dImg');
				// console.log('tagname:'+$ch2.prop('tagName'));
				// $imgTag.src = $imgSrc;
				$($imgTag).attr('src', $imgSrc);

				var $descOp = $(this).attr('desc');
				$sec = $(this).parent().parent().parent().parent();
				// console.log('tagname:'+$sec.get(0).tagName);
				$sec2 = $sec.next();
				$ch1 = $sec2.children('#options').children('#right_column')
						.children('#options');
				// console.log('tagname:'+$ch1.prop('tagName'));
				$pTag = $ch1.find('#content');
				// console.log('tagname:'+$pTag.prop('tagName'));
				$($pTag).text($descOp);

			}).on(
			'blur',
			function() {
				var $this = $(this);
				$sec = $this.parent().parent().parent().parent();
				// console.log('tagname:'+$sec.get(0).tagName);
				$sec2 = $sec.next();
				$ch1 = $sec2.children('#options');
				$imgTag = $ch1.find('#dImg');
				// $imgTag.src = '/img/blank.gif';
				$($imgTag).attr('src', '/img/blank.gif');

				var $descOp = $(this).attr('desc');
				$sec = $(this).parent().parent().parent().parent();
				// console.log('tagname:'+$sec.get(0).tagName);
				$sec2 = $sec.next();
				$ch1 = $sec2.children('#options').children('#right_column')
						.children('#options');
				// console.log('tagname:'+$ch1.prop('tagName'));
				$pTag = $ch1.find('#content');
				// console.log('tagname:'+$pTag.prop('tagName'));
				$($pTag).text("");

			}).hover(function() {
						var $this = $(this);
						$imgSrc = $this.attr('imgsrc');
						$sec = $this.parent().parent().parent().parent();
						// console.log('tagname:'+$sec.get(0).tagName);
						$sec2 = $sec.next();
						// $ch1 = $sec2.find('#options');
						$ch1 = $sec2.children('#options');
						// console.log('tagname:'+$ch1.prop('tagName'));
						$imgTag = $ch1.find('#dImg');
						// console.log('tagname:'+$ch2.prop('tagName'));
						// $imgTag.src = $imgSrc;
						$($imgTag).attr('src', $imgSrc);

						var $descOp = $(this).attr('desc');
						$sec = $(this).parent().parent().parent().parent();
						// console.log('tagname:'+$sec.get(0).tagName);
						$sec2 = $sec.next();
						$ch1 = $sec2.children('#options').children('#right_column')
								.children('#options');
						// console.log('tagname:'+$ch1.prop('tagName'));
						$pTag = $ch1.find('#content');
						// console.log('tagname:'+$pTag.prop('tagName'));
						$($pTag).text($descOp);

					},function() {
						var $this = $(this);
						$sec = $this.parent().parent().parent().parent();
						// console.log('tagname:'+$sec.get(0).tagName);
						$sec2 = $sec.next();
						$ch1 = $sec2.children('#options');
						$imgTag = $ch1.find('#dImg');
						// $imgTag.src = '/img/blank.gif';
						$($imgTag).attr('src', '/img/blank.gif');

						var $descOp = $(this).attr('desc');
						$sec = $(this).parent().parent().parent().parent();
						// console.log('tagname:'+$sec.get(0).tagName);
						$sec2 = $sec.next();
						$ch1 = $sec2.children('#options').children('#right_column')
								.children('#options');
						// console.log('tagname:'+$ch1.prop('tagName'));
						$pTag = $ch1.find('#content');
						// console.log('tagname:'+$pTag.prop('tagName'));
						$($pTag).text("");

					});

	$('#seat').on(
			'focus',
			function() {
				var $this = $(this);
				$imgSrc = $this.attr('imgsrc');
				$sec = $this.parent().parent().parent().parent();
				// console.log('tagname:'+$sec.get(0).tagName);
				$sec2 = $sec.next();
				// $ch1 = $sec2.find('#options');
				$ch1 = $sec2.children('#options');
				// console.log('tagname:'+$ch1.prop('tagName'));
				$imgTag = $ch1.find('#dImg');
				// console.log('tagname:'+$ch2.prop('tagName'));
				// $imgTag.src = $imgSrc;
				$($imgTag).attr('src', $imgSrc);

				var $descOp = $(this).attr('desc');
				$sec = $(this).parent().parent().parent().parent();
				// console.log('tagname:'+$sec.get(0).tagName);
				$sec2 = $sec.next();
				$ch1 = $sec2.children('#options').children('#right_column')
						.children('#options');
				// console.log('tagname:'+$ch1.prop('tagName'));
				$pTag = $ch1.find('#content');
				// console.log('tagname:'+$pTag.prop('tagName'));
				$($pTag).text($descOp);

			}).on(
			'blur',
			function() {
				var $this = $(this);
				$sec = $this.parent().parent().parent().parent();
				// console.log('tagname:'+$sec.get(0).tagName);
				$sec2 = $sec.next();
				$ch1 = $sec2.children('#options');
				$imgTag = $ch1.find('#dImg');
				// $imgTag.src = '/img/blank.gif';
				$($imgTag).attr('src', '/img/blank.gif');

				var $descOp = $(this).attr('desc');
				$sec = $(this).parent().parent().parent().parent();
				// console.log('tagname:'+$sec.get(0).tagName);
				$sec2 = $sec.next();
				$ch1 = $sec2.children('#options').children('#right_column')
						.children('#options');
				// console.log('tagname:'+$ch1.prop('tagName'));
				$pTag = $ch1.find('#content');
				// console.log('tagname:'+$pTag.prop('tagName'));
				$($pTag).text("");

			}).hover(function() {
						var $this = $(this);
						$imgSrc = $this.attr('imgsrc');
						$sec = $this.parent().parent().parent().parent();
						// console.log('tagname:'+$sec.get(0).tagName);
						$sec2 = $sec.next();
						// $ch1 = $sec2.find('#options');
						$ch1 = $sec2.children('#options');
						// console.log('tagname:'+$ch1.prop('tagName'));
						$imgTag = $ch1.find('#dImg');
						// console.log('tagname:'+$ch2.prop('tagName'));
						// $imgTag.src = $imgSrc;
						$($imgTag).attr('src', $imgSrc);

						var $descOp = $(this).attr('desc');
						$sec = $(this).parent().parent().parent().parent();
						// console.log('tagname:'+$sec.get(0).tagName);
						$sec2 = $sec.next();
						$ch1 = $sec2.children('#options').children('#right_column')
								.children('#options');
						// console.log('tagname:'+$ch1.prop('tagName'));
						$pTag = $ch1.find('#content');
						// console.log('tagname:'+$pTag.prop('tagName'));
						$($pTag).text($descOp);

					},function() {
						var $this = $(this);
						$sec = $this.parent().parent().parent().parent();
						// console.log('tagname:'+$sec.get(0).tagName);
						$sec2 = $sec.next();
						$ch1 = $sec2.children('#options');
						$imgTag = $ch1.find('#dImg');
						// $imgTag.src = '/img/blank.gif';
						$($imgTag).attr('src', '/img/blank.gif');

						var $descOp = $(this).attr('desc');
						$sec = $(this).parent().parent().parent().parent();
						// console.log('tagname:'+$sec.get(0).tagName);
						$sec2 = $sec.next();
						$ch1 = $sec2.children('#options').children('#right_column')
								.children('#options');
						// console.log('tagname:'+$ch1.prop('tagName'));
						$pTag = $ch1.find('#content');
						// console.log('tagname:'+$pTag.prop('tagName'));
						$($pTag).text("");

					});
	
	$('.pp').on('blur', function() {
		var inputVal = $(this).val();
		if (inputVal.length == 0) {
			$(".phnoevalerror").text("Please enter Phone number");
			 $(this).addClass("fieldError"); 
		} else {
			$(".phnoevalerror").text("");
			 $(this).removeClass("fieldError"); 
		}
	});
	
});