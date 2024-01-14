# PHP: Install

## 1. Prerequisites

```bash
sudo apt upgrade
sudo apt update
```

## 2. Download Binaries

```bash
sudo apt install ca-certificates apt-transport-https 
wget -q https://packages.sury.org/php/apt.gpg -O- | sudo apt-key add -
echo "deb https://packages.sury.org/php/ stretch main" | sudo tee /etc/apt/sources.list.d/php.list
```

## 3. Install Binaries

```bash
sudo apt update
sudo apt install php7.2
sudo apt install php7.2-cli php7.2-common php7.2-curl php7.2-mbstring php7.2-mysql php7.2-xml
```

## 4. VS Code Extensions

```sh
PHP IntelliSense - https://marketplace.visualstudio.com/...
PHP Intelephense - https://marketplace.visualstudio.com/...
phpfmt - PHP formatter - https://marketplace.visualstudio.com/...
PHP Namespace Resolver - https://marketplace.visualstudio.com/...
PHP Debug - https://marketplace.visualstudio.com/...
PHP Getters & Setters - https://marketplace.visualstudio.com/...
PHP Constructor - https://marketplace.visualstudio.com/...
PHP DocBlocker - https://marketplace.visualstudio.com/...
phpcs - https://marketplace.visualstudio.com/...
PHP Files - https://marketplace.visualstudio.com/...
PHP Server - https://marketplace.visualstudio.com/...
MySQL - https://marketplace.visualstudio.com/...
```

### Resources

```html
https://www.youtube.com/watch?v=v9dWFbiir9Q
```

## 5. Install Pear

```html
https://gist.github.com/PatelUtkarsh/139b4e0db29f2e6cd3466fa129b9a02a
```
