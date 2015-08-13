# ECB-demo
Demonstration of why ECB mode should not be used with block ciphers. 

![demo](https://raw.githubusercontent.com/tblah/ECB-demo/master/out.png)

To use the script, make sure imageMagick is installed and then call the script with the arguement being the image you want to encrypt e.g.
``
./ECB-art.sh demo.png
``

This works best on images with large blocks of the same colour. An easy way of acheiving this is to make an image only black and white. This can be done using imageMagick using something like

``
convert input.png -threshold 50% output.png
``

This occurs because ECB produces the same output for the same input so whatever the black parts of the image are mapped to, they will always end up the same, likewise for any other input. This causes information about the plaintext to be leaked.
