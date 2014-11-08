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
	$(document)
			.ready(
					function() {

						$('#tab-container').easytabs();
						
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
						       });
						
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

						return false;
					});

	$("#newMeasurement").click(
			function() {

				$("#addNew").show();
				$("#measurementDropDown").hide();
				$("#selectMeasurement").hide();
				$("#offshelf").hide();
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

			});
});