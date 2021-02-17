# Youtube Archival
This is a simple application based on youtube-dl to automatically backup Youtube content to preserve it.

## Usage
Run `docker build https://github.com/Seopril/YoutubeArchival.git` to build the Docker image locally.

The /root/config/source.txt contains a list of URLs that can be modified. These are the Youtube channels or playlists
that are automatically archived.

The /root/config/youtube-dl.conf contains the youtube-dl configuration. This may be modified based on personal preference.

/etc/cron.d/auto-archiver is the cron script that will reoccuringly run the auto-archiver.sh script.

The Dockerfile has two volumes, /config and /videos. Point /config to a local AppData folder for the image and /videos for
the deseired video backup location. By default the videos will have a naming scheme of 
`/videos/%(uploader)s/%(title)s (%(id)s)/%(title)s (%(id)s).%(ext)s`

The unraid-docker-termplate can be imported into an Unraid server in place of the Dockerfile.