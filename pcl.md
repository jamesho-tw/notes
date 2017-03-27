# Raspberry Pi

* Install pcl library
```
$> sudo apt-get install libpcl1.7 libpcl-dev
```

* Install pcl tools
```
$> sudo apt-get install pcl-tools
```


# PCL Visualization `pcl_viewer`
```
-bc r,g,b = background color
-fc r,g,b = foreground color
-ps X = point size (1..64)
-multiview X = enable: 1, disable: 0; auto-multi viewport rendering (default disabled)
```

_Note:_ for multiple .pcd files, provide multiple -{fc,ps} parameters; they will be automatically assigned to the right file

* The viewer window provides interactive commands; for help, press 'h' or 'H' from within the window
```
Using the [Shift] + left click; to move a point
Using the [Ctrl] + left click; geometric handlers
```

[http://pointclouds.org/documentation/overview/visualization.php](http://pointclouds.org/documentation/overview/visualization.php)
