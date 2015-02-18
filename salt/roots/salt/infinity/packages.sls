ffmpeg-ubuntu-ppa:
    pkgrepo.managed:
        - ppa: jon-severinsson/ffmpeg
        - require:
            - pkg: python-software-properties

infinity-grafics:
    pkg.installed:
        - pkgs:
            - imagemagick
            - graphicsmagick
            - gifsicle
            - ffmpeg
        - require:
            - pkgrepo: ffmpeg-ubuntu-ppa

