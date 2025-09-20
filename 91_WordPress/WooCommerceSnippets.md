# WordPress Snippets

Use plugin `Code Snippets` (`https://wordpress.org/plugins/code-snippets/`) or manually update `functions.php`.

## Make postal code optional

In (child theme) in file ../wordpress/wp-content/themes/astra/functions.php add at last:

```php
// Make zip/postcode field optional
add_filter( 'woocommerce_default_address_fields' , 'optional_postcode_checkout' );
function optional_postcode_checkout( $p_fields ) {
$p_fields['postcode']['required'] = false;
return $p_fields;
}
```

## Show only Free Shipping

Below shows only free shipping method when available.  
`../wordpress/wp-content/themes/astra/functions.php` add at last:

```php
// Only show all free shipping rates when available
function only_show_free_shipping_rate_when_available( $rates, $package ) {

$free_shipping_rates = array();

// Loop through shipping rates
if ( is_array( $rates ) ) :
foreach ( $rates as $key => $rate ) :

// Check if current rate is free
if ( 0 == $rate->cost ) :
$free_shipping_rates[ $key ] = $rate;
endif;

endforeach;
endif;

// Return the free shipping rates when possible -- Make sure its not only local_pickup
if ( ! empty( $free_shipping_rates ) && ( count( $free_shipping_rates ) > 1 || ! isset( $free_shipping_rates['local_pickup'] ) ) ) :
return $free_shipping_rates;
endif;

return $rates;
}
add_action( 'woocommerce_package_rates', 'only_show_free_shipping_rate_when_available', 10, 2 );
```

## Resources free shipping

```html
https://wordpress.org/support/topic/free-flat-rate-shipping/
```

### Show product already in cart

```php
// Change button for single products
 
add_filter( 'woocommerce_product_single_add_to_cart_text', 'already_in_cart_single_product' );
function already_in_cart_single_product( $label ) {
   foreach( WC()->cart->get_cart() as $cart_item_key => $values ) {
      $product = $values['data'];
      if( get_the_ID() == $product->get_id() ) {
         $label = __('Product already in Cart. Add again?', 'woocommerce');
      }
   } 
   return $label;
}
 
// Change button for archive page products
 
add_filter( 'woocommerce_product_add_to_cart_text', 'already_in_cart_archive_product', 99, 2 );
function already_in_cart_archive_product( $label, $product ) {
   if ( $product->get_type() == 'simple' && $product->is_purchasable() && $product->is_in_stock() ) {
      foreach( WC()->cart->get_cart() as $cart_item_key => $values ) {
         $_product = $values['data'];
         if( get_the_ID() == $_product->get_id() ) {
            $label = __('Product already in Cart. Add again?', 'woocommerce');
         }
      }
   }
   return $label;
}
```

#### Resources show product

```html
https://wpsimplehacks.com/how-to-show-product-already-in-cart/
```

### BOGO

Buy one get one free.  
Visibility on gifted is hidden.

```php
add_action( 'template_redirect', 'bbloomer_add_gift_if_id_in_cart' );
 
function bbloomer_add_gift_if_id_in_cart() {
   if ( is_admin() ) return;
   if ( WC()->cart->is_empty() ) return;
 
   $product_bought_id = 166;
   $product_gifted_id = 167;
 
   // see if product id in cart
   $product_bought_cart_id = WC()->cart->generate_cart_id( $product_bought_id );
   $product_bought_in_cart = WC()->cart->find_product_in_cart( $product_bought_cart_id );
 
   // see if gift id in cart
   $product_gifted_cart_id = WC()->cart->generate_cart_id( $product_gifted_id );
   $product_gifted_in_cart = WC()->cart->find_product_in_cart( $product_gifted_cart_id );
 
   if ( $product_bought_in_cart )  {
	  if ( !$product_gifted_in_cart ) WC()->cart->add_to_cart( $product_gifted_id );  
	  return; 
   } 
     
   if ( $product_gifted_in_cart ) WC()->cart->remove_cart_item( $product_gifted_in_cart );
}
```

#### Resources BOGO

```html
https://www.businessbloomer.com/woocommerce-buy-1-product-add-free-product-cart-programmatically/
```

### Show out of stock in search

```php
// display an 'Out of Stock' label on archive pages
add_action( 'woocommerce_after_shop_loop_item_title', 'woocommerce_template_loop_stock', 10 );
function woocommerce_template_loop_stock() {
    global $product;
    if ( ! $product->managing_stock() && ! $product->is_in_stock() )
        echo '<p class="stock out-of-stock">Out of Stock</p>';
}
```

#### Resources out of stock

```html
https://wisdmlabs.com/blog/woocommerce-add-out-of-stock-label-on-shop-page/
```

### Find Products

```sql
SELECT * FROM `wp_posts` WHERE `post_type` = "product"
```

#### Resources find products

```html
https://wp-staging.com/in-which-database-table-is-woocommerce-storing-products/
```

### Kadence - no zoom on image on product page

Customize -> Additional CSS

```css
/* Turn of zoom pointer in woocommerce product */
.woocommerce div.product div.images .woocommerce-product-gallery__wrapper {
    pointer-events: none;
}
```

#### Resources

```html
https://ideaspot.com.au/blog/kadence-woocommerce-tutorial/
```
