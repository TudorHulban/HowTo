# MailHog

## Install

Binary:

```sh
wget https://github.com/mailhog/MailHog/releases/download/v1.0.1/MailHog_linux_amd64
```

Embedded:

```sh
go install github.com/mailhog/MailHog@latest
```

## Run

Open http://localhost:8025/ in browser.  
The SMTP server starts on port 1025.

### Troubleshoot

```sh
sudo lsof -i :8025
```

## Resources

```html
https://github.com/mailhog/MailHog#configuration
```
