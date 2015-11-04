# fakedeb_generator
A fake debs generator based on apt-cache results.

It will create a fake version of any package located into repositories.

## Usage case
I have OpenCV installed from sources, but several additional packages (like ROS ones) relies on opencv.
To allow to use apt-get, I did this patch.

**PS:**
OpenCV can build .deb packages with `CPACK_BINARY_DEB:BOOL=ON`, so this workarround could not be required
