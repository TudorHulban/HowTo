# LiteIDE - Install

## Download

```sh
wget https://github.com/visualfc/liteide/releases/download/x36.2/liteidex36.1.linux64-qt5.5.1.AppImage
```

* version with qt 5.x.y
* version as AppImage
* view->options->LiteEditor->Fonts&Colors->Sublime

Create desktop shortcut:

```sh
vi ~/Desktop/liteide.desktop
chmod +x ~/Desktop/liteide.desktop
```

With contents:

```sh
[Desktop Entry]
Version=1.0
Encoding=UTF-8
Type=Application
Icon=/home/tudi/Pictures/Oxygen-Icons.org-Oxygen-Categories-applications-system.ico
Exec=/home/tudi/liteidex36.2.linux64-qt5.5.1.AppImage
Name=LiteIDE
GenericName=IDE
```

## Link to Go binary

In case Go binary is not found create a soft link to Go binary in the folder where LiteIDE bin is (tested when not using AppImage0:

```sh
ln -s $GOROOT/bin/go go
```
