# Boom_Boom
This project is a small 3d game which is made using Godot 4.

The language used to write scripts in this project is GDScript.

The game is available in Android and Windows for now.

The latest builds of game for Android and Windows are available at the root directory of the repository Boom_Boom.apk and Boom_Boom.exe respectively.

The game is yet to be optimized and is far from entering the beta stage yet.

You may want to hide Control nodes in each scene if you want touch controls to disappear when creating a build for laptops.


To export the game, you need to follow these steps:

1. Store this project inside a directory/folder in your workstation.
2. Load this folder directory in Godot 4.
3. Project>Export>Add Presets
4. Add a template for the platform you want to choose and it should be fine.
5. You may need to do one or more additional task but Godot will let you know what to do for it.
6. For Android, you will need Android SDK, Java SDK, a keystore file(even if you want just a debug build). You need to provide the the information related to these 3 things in Android Export Options.
