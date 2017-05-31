## Easily Download a YouTube video as an mp4


**Usage:**

``` 
$  ./ez-youtube-dl.sh https://www.youtube.com/watch?v=yswb4kjm94g
[youtube] yswb4kjm94g: Downloading webpage
[youtube] yswb4kjm94g: Downloading video info webpage
[youtube] yswb4kjm94g: Extracting video information
[youtube] yswb4kjm94g: Downloading MPD manifest
[download] Destination: /Users/hernamesbarbara/data/youtube_dl/Band of Horses - The End's Not Near.f135.mp4
```

You can then convert it into an mp3 like so:

```
$  ffmpeg -i Band\ of\ Horses\ -\ The\ End\'s\ Not\ Near.mp4 -vn \
    -acodec libmp3lame -ac 2 -qscale:a 4 -ar 48000 \
    band-of-horses-the-ends-not-near.mp3
```



