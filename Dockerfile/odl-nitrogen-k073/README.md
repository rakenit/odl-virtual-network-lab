OpenDaylight Nitrogen Karaf 0.7.3
=================================

Docker build context for an OpenDaylight Nitrogen container based on Karaf 0.7.3.

Use this image when the lab scenario requires the Nitrogen 0.7.3 controller release.

Review the Dockerfile, SSH configuration, and supervisord configuration before
building the image. This folder supports controller-version comparison within
the virtual network proof of concept.

No production credentials or proprietary images are included. Before private lab
use, replace image tags, build arguments, exposed access settings, and any local
registry naming required by your environment.
