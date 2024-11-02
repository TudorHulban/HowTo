# React.JS: Install
## Install nvm 
From https://github.com/creationix/nvm (check latest version):<br/>
wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash

## Verify
```sh
nvm --version # exit terminal if it does not work
```
## Install latest Node.JS version
```sh
nvm install node
```
Verify version: 
```sh
node -v
npm -v
```
## Create React app
a. install prerequisites:
```sh
npm install -g create-react-app
```
b. create the app scaffold:
```sh
create-react-app myapp
```
c. test app
```sh
cd myapp
npm start
```
## Create production files
```sh
npm run build
```
