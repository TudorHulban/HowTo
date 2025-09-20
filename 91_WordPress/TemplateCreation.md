# Template 

Is considered by WordPress PHP a file with header as below:

```php
<?php
/*
Template Name: Template Page
*/
?>

<?php get_header(); ?>

<?php get_footer(); ?>
```

## Load CSS file

```html
<link rel="stylesheet" href="<?php echo get_stylesheet_uri(); ?>">
```
