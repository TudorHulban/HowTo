# Svelte: Store Update
## App.svelte
```js
<script>
  import { products } from "./store.js";
  import C1 from "./C1.svelte";

  console.log("store:", $products);
</script>

{JSON.stringify($products)}
<C1 />
```
## C1.svelte
```js
<script>
  import { products } from "./store.js";

  function decrement() {
    let curQuantity = $products[0].quantity;
    let newQuantity = curQuantity - 1;
    console.log("newQuantity", newQuantity);
    products.updateObject(1, newQuantity);
  }
</script>

<h4>---------</h4>
<button on:click={decrement}>D</button>
```
## store.js
```js
import { writable } from 'svelte/store';

let productStore = [
  { id: 1, name: 'Product 1', quantity: 5 },
  { id: 2, name: 'Product 2', quantity: 2 }
];
function createProducts() {
  const { subscribe, update } = writable(productStore);

  return {
    subscribe,
    updateObject: (pID, pQuantity) => {
      console.log('id:', pID);
      update(products => {
        let ix = products.findIndex(item => item.id === pID);
        console.log('ix:', ix);
        console.log('item', products[ix]);
        return [
          ...products.slice(0, ix),
          { ...products[ix], quantity: pQuantity },
          ...products.slice(ix + 1)
        ];
      });
    }
  };
}
export let products = createProducts();

```
