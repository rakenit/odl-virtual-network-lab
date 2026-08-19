OpenDaylight Fluorine 0.9.2
===========================

Docker build context for an OpenDaylight Fluorine container based on release 0.9.2.

Use this image when the lab scenario requires the Fluorine controller release.

Review the Dockerfile, SSH configuration, and supervisord configuration before
building the image. This folder supports controller-version comparison within
the virtual network proof of concept.

No production credentials or proprietary images are included. Before private lab
use, replace image tags, build arguments, exposed access settings, and any local
registry naming required by your environment.
