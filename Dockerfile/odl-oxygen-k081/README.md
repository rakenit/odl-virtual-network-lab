OpenDaylight Oxygen Karaf 0.8.1
===============================

Docker build context for an OpenDaylight Oxygen container based on Karaf 0.8.1.

Use this image when the lab scenario requires the Oxygen 0.8.1 controller release.

Review the Dockerfile, SSH configuration, and supervisord configuration before
building the image. This folder supports controller-version comparison within
the virtual network proof of concept.

No production credentials or proprietary images are included. Before private lab
use, replace image tags, build arguments, exposed access settings, and any local
registry naming required by your environment.
