# Use the same base image
FROM mandarons/icloud-drive

# (Optional) Label or maintainer info
LABEL maintainer="Marco Visin <marco@visin.ch>"

# Declare volumes so Docker knows these are external
VOLUME ["/etc/timezone", "/etc/localtime"]

