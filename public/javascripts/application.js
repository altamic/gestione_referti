function changeLocation(url){
  document.location.href=url;
}

function toggle(obj) {
	var el = document.getElementById(obj);
  if ( el.style.display != 'none' ) {
   el.style.display = 'none';
  }
  else {
   el.style.display = 'block';
  }
}

function setVisibility (obj, item) {
  var el = document.getElementById(obj);
  if (document.getElementByID(item).checked == 'checked') {
   el.style.display = 'block';
  }
  else {
   el.style.display = 'none';
  }
}

function computeDiscount(value) {
  var gross = document.getElementById('invoice_trail_gross_amount');
  var discount = document.getElementById('invoice_trail_discounted_amount');
  discount.value =  Math.max(0, gross.value - ((gross.value * value) / 100.0))
}