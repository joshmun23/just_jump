$(".accordion-icon").click(function(){

  var itemInfo = $('.active .item-info')[0].innerHTML.split(', ')
  //"3 Pizzanini Large Pizza"
  var currentUserID = itemInfo[0]
  var restaurant = itemInfo[1]
  var menuItemID = itemInfo[2]

  var newMenuItem

  if ($('.active .fi-plus').length > 0) {

    newMenuItem = $.ajax({
      url: '/users/' + currentUserID + '/menu_items/',
      method: 'POST',
      data: { currentUserID: currentUserID, restaurant: restaurant, menuItemID: menuItemID },
      dataType: 'json'
    });

    var changeIcon = $('.active .fi-plus')[0].className = 'fi-minus accordion-icon';
  } else if ($('.active .fi-minus').length > 0) {
    newMenuItem = $.ajax({
      url: '/users/' + currentUserID + '/menu_items/' + menuItemID,
      method: 'DELETE',
      data: { currentUserID: currentUserID, restaurant: restaurant, menuItemID: menuItemID },
      dataType: 'json'
    });

    var changeIcon = $('.active .fi-minus')[0].className = 'fi-plus accordion-icon';
  }

  // newMenuItem.done(result) {

  // };
  // newMenuItem.fail() {
  // };
});
