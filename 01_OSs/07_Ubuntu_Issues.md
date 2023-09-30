# Ubuntu Troubleshoot

## Audio

### No ability to change output device
```sh
rm -r ~/.config/pulse/
systemctl --user restart pulseaudio
```
