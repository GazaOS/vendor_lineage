/*
 * Copyright (C) 2026 GazaOS Project
 * SPDX-License-Identifier: Apache-2.0
 */
package org.gazaos.wallpapers;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;

/**
 * Marker receiver discovered by WallpaperPicker2/ThemePicker via PARTNER_CUSTOMIZATION.
 */
public final class PartnerReceiver extends BroadcastReceiver {
    @Override
    public void onReceive(Context context, Intent intent) {
        // No-op: resources are queried via PackageManager.
    }
}
