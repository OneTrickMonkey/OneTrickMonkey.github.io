@echo off

ECHO Start of Loop

set files=

FOR /L %%i IN (0,1,89) DO (
	set /a "num=4*%%i"
	call magick convert -background none imageOg.png -scale 64x64 -rotate %%num%% -crop 64x64+0+0 image%%i.png
	call set files=%%files%% image%%i.png
)

magick montage -background none %files% -tile 1x90 -geometry 64x64+0+0 montage.png

:: magick convert -background none image1.png -rotate 4 -resize 64x64 image2.png
:: magick montage -background none image.png image1.png -tile 1x2 montage.png