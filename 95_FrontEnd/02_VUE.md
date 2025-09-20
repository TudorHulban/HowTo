# Vue.JS

Installation and first steps

## Installation vue-cli

```sh
npm install -g @vue/cli
```

## Upgrade vue-cli

```sh
npm i -g vue-cli
# or
npm uninstall -g vue-cli
npm install -g @vue/cli
```

## FontAwesome

### Install

```sh
npm install vue-awesome
```

### Use

#### In main.js

```js
import 'vue-awesome/icons'
import Icon from 'vue-awesome/components/Icon'
Vue.component('v-icon', Icon)
```

#### In xxx.vue

```js
<template>
<v-icon name="camera"/>
```

## Create Project

```sh
vue create project_name
# or
vue create -p preset project_name
# and
npm run serve
```

### Check webpack configuration

```sh
cd project_name
vue inspect
```

## Deployment

See: https://cli.vuejs.org/guide/deployment.html.

```sh
npm run build
```

## VS Code

Install package for Vue and enable formatter on save in File / Preferences / Settings / Formatting.

### Disable double quotes error

In .eslintrc.js, section rules add:

```sh
 quotes: 0
```

### Disable comma dangle error

In .eslintrc.js, section rules add:

```js
'comma-dangle': [
      'error',
      {
        arrays: 'never',
        objects: 'only-multiline',
        imports: 'never',
        exports: 'never',
        functions: 'never'
      }
    ]
```

## Resources

```html
https://vuejsexamples.com/generate-a-vue-form-with-validation-and-bulma-style-from-json/
https://scotch.io/tutorials/create-a-single-page-app-with-go-echo-and-vue
https://scotch.io/courses/build-an-online-shop-with-vue
https://medium.com/@jcbaey/authentication-in-spa-reactjs-and-vuejs-the-right-way-e4a9ac5cd9a3
```
