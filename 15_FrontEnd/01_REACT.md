# React.JS: Install
## Install nvm 
From https://github.com/creationix/nvm (check latest version):<br/>
wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash

## Verify
```bash
nvm --version # exit terminal if it does not work
```
## Install latest Node.JS version
```bash
nvm install node
```
Verify version: 
```bash
node -v
npm -v
```
## Create React app
a. install prerequisites:
```bash
npm install -g create-react-app
```
b. create the app scaffold:
```bash
create-react-app myapp
```
c. test app
```bash
cd myapp
npm start
```
## Create production files
```bash
npm run build
```
