# Node.JS: Install
## A. With package manager
If issues with permission denied:
```html
https://docs.npmjs.com/resolving-eacces-permissions-errors-when-installing-packages-globally
```
or set in vi ~/.profile:
```sh
NPM_CONFIG_PREFIX=~/.npm-global
```
a. install nvm (https://github.com/creationix/nvm), check latest version:
```sh
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
```
verify:
```sh
nvm --version
# exit terminal if it does not work
```
b. install latest nodejs version:
```sh
nvm install node
```
verify version: 
```sh
node -v
npm -v
```
## B. With snap
```sh
sudo snap install --edge --classic node
```
If npm not found, add it to the path:
```sh
sudo snap search npm
```
## Install SASS Compiler
```js
npm install -g sass
```
```sh
sass scss/style.scss css/style.css
```
Delete style.css and map files after debugging as because different map the IDE will have issues with SASS compilation.
