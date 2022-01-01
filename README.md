# Spotify-AppImage
Unofficial AppImage for Spotify. This is only an experimental release for test (download [here](https://github.com/ivan-hc/Spotify-AppImage/releases)), created from a popular repository in AUR: use it at your own risk!

If you would like to see an official Spotify AppImage, vote on [community.spotify.com](https://community.spotify.com) and let [SpotifyCares](https://twitter.com/SpotifyCares) know. [A first attempt went and died ](https://community.spotify.com/t5/Closed-Ideas/Provide-Spotify-Desktop-Client-in-cross-distro-AppImage-bundle/idi-p/1337399), but now you can do the difference.

I'm not allowed to distribute Spotify AppImage as an official release, so take this release as an experimental version.

If you're looking for furter releases, use [AppMan](https://github.com/ivan-hc/AppMan), a command line utility that downloads and creates AppImages taking packages from known sources.

If you're looking for furter releases of a standalone version (not an AppImage) that runs anywhere, use [AM](https://github.com/ivan-hc/AM-application-manager), a multiarchitecture Application Manager for AppImages and other standalone programs that works like APT or Pacman, which manages and updates hundreds of programs to the latest version.

# How to use [AppMan](https://github.com/ivan-hc/AppMan)

INSTALL and/or UPDATE using this command:

    appman -i spotify
In this way will be downloaded, unpacked and repacked a package from Arch User Repository converting it to an AppImage. Use this command each time a new official release for GNU/Linux is ready.

Learn more about AppMan on [github.com/ivan-hc/AppMan](https://github.com/ivan-hc/AppMan).

# How to install Spotify with automatic updates on any GNU/Linux disto (not the AppImage)

Alternativelly to AppMan, exists a new App Manager named "[AM](https://github.com/ivan-hc/AM-application-manager)", that manages a lot of scripts to install/remove standalone programs and AppImages the way that they can update themself when you run the program.

The script to install Spotify will install the program in /opt/spotify, a launcher in /usr/share/applications and a script in /usr/local/bin that will check if there is a new version of the program from the source every time you launch it.

Use the following commands:

    wget https://raw.githubusercontent.com/ivan-hc/AM-application-manager/main/programs/x86_64/spotify
    chmod a+x ./spotify
    sudo ./spotify
Now just use the app without having any care of new updates in the future, they are managed automatically when you launch the program.

To remove the AM's version of Spotify (and all the files listed above), run the following command:

    sudo /opt/spotify/remove

### This and more scripts will be available on my new repository, at [ivan-hc/AM-application-manager](https://github.com/ivan-hc/AM-application-manager).
