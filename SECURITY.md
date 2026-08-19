# Security Policy

## Public Repository Guidance

Do not commit credentials, private keys, certificates, environment files, API tokens, packet captures, or proprietary vendor images to this repository.

This lab references vendor network operating systems such as IOS XRv, NX-OSv, and CSR1000v. Those images are not included here. Users are responsible for obtaining properly licensed images and storing them outside source control.

Historical build notes may contain lab-local RFC1918 addresses, hostnames, usernames, file paths, and vendor image filenames. Treat those values as examples only, and replace them before adapting the lab to another environment.

## Sensitive Data Checklist

Before publishing changes, check for:

- Passwords, tokens, API keys, and Basic Auth headers.
- Default controller, appliance, or Karaf credentials.
- Private keys, certificates, `.env` files, and credential exports.
- Proprietary VM images, ISO files, OVA files, VMDK files, and QCOW/QCOW2 disks.
- Internal hostnames, usernames, emails, customer names, and private project names.
- Logs or packet captures that may expose environment details.

## Reporting Concerns

If sensitive information is found, remove it from the working tree before publishing. If it has already been pushed to a remote repository, rotate the exposed credential or key and remove it from the repository history before making the repo public.
