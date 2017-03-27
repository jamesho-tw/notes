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

Note: for multiple .pcd files, provide multiple -{fc,ps} parameters; they will be automatically assigned to the right file

[http://pointclouds.org/documentation/overview/visualization.php](http://pointclouds.org/documentation/overview/visualization.php)