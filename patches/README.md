# GazaOS Upstream Patches

This directory contains cherry-picked patches for repositories that remain tracked directly from upstream (`Lunaris-AOSP` / `LineageOS`) rather than forked under the GazaOS organization.

## Structure

Folders should be named after the relative repository path with forward slashes (`/`) replaced by underscores (`_`):

- `packages_apps_Updater/`: Patches applied to `packages/apps/Updater`
- `packages_apps_SetupWizard/`: Patches applied to `packages/apps/SetupWizard`
- `device_xiaomi_stone/`: Patches applied to `device/xiaomi/stone`

## Application

Run the automated script from the root of your Android build tree:

```bash
bash vendor/lineage/apply-patches.sh
```
