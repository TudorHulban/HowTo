# Product Badge
## Based on product ID
```php
add_action( 'woocommerce_before_shop_loop_item_title', 'best_badge', 3 );
          
function best_badge() {
   global $product;
	
   $target_products_ids = array(166,167);	
   $product_id = get_the_ID();
	
   foreach ($target_products_ids as $target_product_id) {
	   if ($target_product_id == $product_id) {
		    echo '<span class="new-badge onsale">' . esc_html__( 'Best Seller', 'woocommerce' ) . '</span>';
	   }
   }	
}
```

CSS - Ribbon Style
```css
.woocommerce ul.products li.product .new-badge.onsale {
	background: #ffcc00;
	top: .5em;
	z-index: 10;
	right: auto;
	color: #000;
	font-weight: 700;
	text-transform: uppercase;
	font-size: 0.9em;
	border-radius: 0px;
	min-width: 60px;
	padding-left: 19px !important;
}
span.new-badge.onsale:after {
	border: 5px solid #ffcc00;
border-color: transparent transparent #ffcc00 #ffcc00;
	border-width: 9px 6px;
	position: absolute;
	right: -10px;
	bottom: 0;
	content: '';
}
span.new-badge.onsale:before {
border: 5px solid #ffcc00;
    border-color: #ffcc00 transparent transparent #ffcc00;
    border-width: 9px 6px;
    position: absolute;
    right: -10px;
    top: 0;
    content: '';
}
span.new-badge.onsale {
min-width: 60px;
-moz-transform: rotate(90deg);
    -webkit-transform: rotate(90deg);
    -o-transform: rotate(90deg);
    -ms-transform: rotate(90deg);
    transform: rotate(90deg);
}
```

CSS - Circle Style
```css
.woocommerce ul.products li.product .new-badge.onsale {
	background: #ffcc00;
	right: auto;
	color: #000;
	font-weight: 700;
	text-transform: uppercase;
	font-size: 0.9em;
	border-radius: 0px;
	border-radius: 999px;
	min-width: 3em;
	min-height: 3em;
	line-height: 3em;
	padding: 0;
	position: absolute;
	text-align: center;
	top: .5em;
	left: .5em;
}
```

CSS - Simple
```css
.woocommerce ul.products li.product .new-badge.onsale {
	background: #ffcc00;
	top: 0.0em;
	z-index: 10;
	right: auto; 
	color: #000;
	font-weight: 700;
	text-transform: uppercase;
	font-size: 0.9em;
	border-radius: 0px;
	min-width: 40px;
	padding-left: 10px !important;
}

span.new-badge.onsale {
min-width: 60px;
}
```

## Resources
```
https://wpsimplehacks.com/how-to-display-new-badge-on-woocommerce-recent-products/
```
