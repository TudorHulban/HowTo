# Svelte JS

Installation and first steps

## Download predefined template

```sh
npx degit sveltejs/template <new project name>
```

## Install required NPM packages

```sh
cd <created folder>
npm install
```

## Run Svelte in development mode

```sh
npm run dev
```

## Svelte context

App.svelte

```js
<script>
  import { onMount } from "svelte";
  import { getContext } from "svelte";
  import C1 from "./C1.svelte";

  onMount(_ => {
    let x = getContext("K1");
    console.log("xmount:", x);
  });
</script>

<C1 />
```

C1.svelte

```js
<script>
  import { onMount } from "svelte";
  import { setContext } from "svelte";

  onMount(() => {
    setContext("K1", { number: 19 });
  });
</script>

<h4>Context not available w/o C1 in DOM.</h4>
```

## Svelte store

store.js

```js
import { writable } from 'svelte/store';

let productStore = [
  { id: 1, name: 'Product 1', price: 5.99 },
  { id: 2, name: 'Product 2', price: 1.99 }
];

function createProducts() {
  const { subscribe } = writable(productStore);

  return {
    subscribe
  };
}

export let products = createProducts();
```

App.svelte

```js
<script>
  import { products } from "./store.js";

  console.log("store:", $products);
</script>

{JSON.stringify($products)}
```

## Form submit

Under Review.

## Resources

```html
https://www.toptal.com/front-end/svelte-framework-guide?utm_campaign=Svelte%20Status&utm_medium=email&utm_source=Revue%20newsletter
https://css-tricks.com/what-i-like-about-writing-styles-with-svelte/?utm_campaign=Svelte%20Status&utm_medium=email&utm_source=Revue%20newsletter
https://www.freecodecamp.org/news/the-svelte-handbook/?utm_campaign=Svelte%20Status&utm_medium=email&utm_source=Revue%20newsletter
http://www.sveltestatus.com/issues/the-svelte-handbook-a-common-log-in-form-in-svelte-svelte-commerce-more-204457
https://objectcomputing.com/resources/publications/sett/july-2019-web-dev-simplified-with-svelte
https://www.alvareznavarro.es/blog/2019/6/svelete-firebase-user-authentication
https://mauricius.dev/building-a-pagination-component-in-svelte/?utm_campaign=Svelte%20Status&utm_medium=email&utm_source=Revue%20newsletter
https://www.valentinog.com/blog/svelte/
```
