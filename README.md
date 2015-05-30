# m4a-2-mp3
Command Line Utility to batch convert m4a files to mp3 files

m4a-2-mp3 is a small command line utility to batch-convert all your m4a files to mp3. This works great for people who have music players which only play mp3 (I have an old iRiver-LPlayer which I like a lot :)).

### Before you clone
Before you clone this repository, this utility needs some pre-existing tools installed on your MAC or Linux machines.
- Bash enabled shell
- **ffmpeg** - A complete, cross-platform solution to record, convert and stream audio and video

### Installing required tools

**ffmpeg** - To install ffmpeg, follow this [great] tutorial by [renevolution] for MAC and [this] tutorial by [linuxers] for your Linux machines.

*Note:* This script is not compatible with windows machines as of now.

### Configuring the script
This script comes with a config.cfg file which lets you configure 3 options 
- 'quality' - Quality of the final mp3 files - Values are high, medium or low
- 'paths' - Comma separated list of directories which contain the m4a files which you want to convert to mp3. By default all the final mp3 files are saved in the same folders with the same filenames. Space in directory names is also supported.
- 'delete' - Option to keep or delete the original m4a files - values are true or false


### Running the script
After the config file is setup, running the script is as simple as either running 
    sh m4a-2-mp3.sh 
or 
    ./m4a-2-mp3.sh 
(if you change the permissions of the file to executable)

### License

MIT (See Attached)



[great]:http://www.renevolution.com/how-to-install-ffmpeg-on-mac-os-x/
[renevolution]:http://www.renevolution.com/how-to-install-ffmpeg-on-mac-os-x/
[this]:http://linuxers.org/tutorial/how-install-ffmpeg-linux
[linuxers]:http://linuxers.org/tutorial/how-install-ffmpeg-linux
