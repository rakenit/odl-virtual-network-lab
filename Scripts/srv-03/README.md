Server 03 Scripts
=================

Reserved for server-specific scripts used by `srv-03` in the virtual network lab.

Place TAP interface handlers, device startup scripts, and stop scripts here when `srv-03` hosts QEMU-based virtual devices.

This folder supports the programmable virtual network proof of concept by
providing a location for host-specific runtime scripts. Review any scripts here
against the top-level workflow before execution.

Do not commit private credentials, proprietary images, generated logs, or local
exports. Before private lab use, replace host paths, bridge names, TAP names,
disk image filenames, and topology-specific values.
