# Shipment tracking

```php
// For displaying in Order page columns.

add_filter( 'manage_edit-shop_order_columns', 'set_tracking_column' );
function set_tracking_column($columns) {
    $columns['tracking_column'] = __( 'Tracking code', 'your_text_domain' );
    return $columns;
}

// Add the data to the custom columns for the order post type:
add_action( 'manage_shop_order_posts_custom_column' , 'custom_shop_order_column', 10, 2 );
function custom_shop_order_column( $column, $post_id ) {
    switch ( $column ) {
        case 'tracking_column' :
            echo esc_html( get_post_meta( $post_id, 'tracking_column', true ) );
            break;
    }
}

// For display and saving in order details page.
add_action( 'add_meta_boxes', 'tracking_code_meta_box' );
function tracking_code_meta_box() {
    add_meta_box(
        'tracking_column',
        __( 'Tracking code', 'your_text_domain' ),
		'shop_order_display_callback',
		'shop_order'
    );
}

// For displaying it correctly
function shop_order_display_callback( $post ) {
    $value = get_post_meta( $post->ID, 'tracking_column', true );
    echo '<textarea style="width:100%" id="tracking_column" name="tracking_column">' . esc_attr( $value ) . '</textarea>';
}

// Saving the input data
function save_tracking_code_meta_box_data( $post_id ) {
	
    // If this is an autosave, our form has not been submitted, so we don't want to do anything.
    if ( defined( 'DOING_AUTOSAVE' ) && DOING_AUTOSAVE ) {
        return;
    }

    // Check the user's permissions.
    if ( isset( $_POST['post_type'] ) && 'shop_order' == $_POST['post_type'] ) {
        if ( ! current_user_can( 'edit_shop_order', $post_id ) ) {
            return;
        }
    }

    // Make sure that it is set.
    if ( ! isset( $_POST['tracking_column'] ) ) {
        return;
    }

    // Sanitize user input.
    $my_data = sanitize_text_field( $_POST['tracking_column'] );

    // Update the meta field in the database.
    update_post_meta( $post_id, 'tracking_column', $my_data );
}

add_action( 'save_post', 'save_tracking_code_meta_box_data' );


// Showing the info on My orders page

// New column on My orders page

add_filter( 'woocommerce_account_orders_columns', 'add_account_orders_column', 1, 1 );
function add_account_orders_column( $columns ){
    $columns['tracking-column'] = __( 'Tracking code', 'woocommerce' );

    return $columns;
}

add_action( 'woocommerce_my_account_my_orders_column_tracking-column', 'add_account_orders_column_rows' );
function add_account_orders_column_rows( $order ) {
    // Example with a custom field
    if ( $value = $order->get_meta( 'tracking_column' ) ) {
        echo esc_html( $value );
    }
}

// Showing tracking code on View order page and on Thank you page

add_action( 'woocommerce_thankyou', 'tracking_on_thankyou_page', 20 );
add_action( 'woocommerce_view_order', 'tracking_on_thankyou_page', 20 );
 
function tracking_on_thankyou_page( $order_id ){  ?>
    <table class="woocommerce-table shop_table gift_info">
        <tbody>        
            <tr>
                <th>Tracking code</th>
                <td><?php echo wpautop( get_post_meta( $order_id, 'tracking_column', true ) ); ?></td>
            </tr>
        </tbody>
    </table>
<?php }
```

## Resources

```html
https://wpsimplehacks.com/how-to-add-shipment-tracking-to-woocommerce/
```
