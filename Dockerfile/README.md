OpenDaylight Controller Images
==============================

This directory contains Docker build contexts for the OpenDaylight controller containers used in the virtual network lab.

Each subdirectory targets a specific OpenDaylight/Karaf release and includes the Dockerfile, SSH configuration, and supervisord configuration required to run the controller process inside a container.

The images do not include a default root password. If SSH access is required for an isolated lab, provide one at build time:

```text
docker build --build-arg ROOT_PASSWORD='<lab-only-password>' -t <image-name> .
```

If `ROOT_PASSWORD` is omitted, the root account is locked and the controller process still starts under supervisord. Keep SSH access bound to trusted lab networks and avoid reusing production credentials.

## Config Review Flow

1. Use `odl-01` to review topology management, OVSDB, and OpenFlow.
2. Use `odl-02` as an additional OpenDaylight controller container from the original lab build.
3. Use `odl-03` as an additional OpenDaylight controller container from the original lab build.

## Sanitization And Replacement Notes

These Docker contexts do not include production credentials or proprietary
network images. Before private lab use, provide local controller credentials,
review exposed SSH settings, confirm the OpenDaylight release required by the
workflow, and keep any environment-specific image tags outside public docs.
