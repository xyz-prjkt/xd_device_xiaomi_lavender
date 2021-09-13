/*
 * Copyright (C) 2018-2019 The Xiaomi-SDM660 Project
 * Copyright (C) 2020-2021 a xyzprjkt LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License
 */

package id.xyz.xyzzone;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.provider.Settings;

import id.xyz.xyzzone.kcal.Utils;
import id.xyz.xyzzone.preferences.SecureSettingSwitchPreference;

import java.lang.Math.*;

public class BootReceiver extends BroadcastReceiver implements Utils {

    public static final  String HEADPHONE_GAIN_PATH = "/sys/kernel/sound_control/headphone_gain";
    public static final  String MIC_GAIN_PATH = "/sys/kernel/sound_control/mic_gain";
    
    public void onReceive(Context context, Intent intent) {

        if (Settings.Secure.getInt(context.getContentResolver(), PREF_ENABLED, 0) == 1) {
            FileUtils.setValue(KCAL_ENABLE, Settings.Secure.getInt(context.getContentResolver(),
                    PREF_ENABLED, 0));

            String rgbValue = Settings.Secure.getInt(context.getContentResolver(),
                    PREF_RED, RED_DEFAULT) + " " +
                    Settings.Secure.getInt(context.getContentResolver(), PREF_GREEN,
                            GREEN_DEFAULT) + " " +
                    Settings.Secure.getInt(context.getContentResolver(), PREF_BLUE,
                            BLUE_DEFAULT);

            FileUtils.setValue(KCAL_RGB, rgbValue);
            FileUtils.setValue(KCAL_MIN, Settings.Secure.getInt(context.getContentResolver(),
                    PREF_MINIMUM, MINIMUM_DEFAULT));
            FileUtils.setValue(KCAL_SAT, Settings.Secure.getInt(context.getContentResolver(),
                    PREF_GRAYSCALE, 0) == 1 ? 128 :
                    Settings.Secure.getInt(context.getContentResolver(),
                            PREF_SATURATION, SATURATION_DEFAULT) + SATURATION_OFFSET);
            FileUtils.setValue(KCAL_VAL, Settings.Secure.getInt(context.getContentResolver(),
                    PREF_VALUE, VALUE_DEFAULT) + VALUE_OFFSET);
            FileUtils.setValue(KCAL_CONT, Settings.Secure.getInt(context.getContentResolver(),
                    PREF_CONTRAST, CONTRAST_DEFAULT) + CONTRAST_OFFSET);
            FileUtils.setValue(KCAL_HUE, Settings.Secure.getInt(context.getContentResolver(),
                    PREF_HUE, HUE_DEFAULT));
        }
        
        int gain = Settings.Secure.getInt(context.getContentResolver(),
                XYZzone.PREF_HEADPHONE_GAIN, 0);
        FileUtils.setValue(HEADPHONE_GAIN_PATH, gain + " " + gain);
        FileUtils.setValue(MIC_GAIN_PATH, Settings.Secure.getInt(context.getContentResolver(),
                XYZzone.PREF_MIC_GAIN, 0));

        FileUtils.setValue(XYZzone.NOTIF_LED_PATH,(1 + Math.pow(1.05694, Settings.Secure.getInt(
                context.getContentResolver(), XYZzone.PREF_NOTIF_LED, 100))));

        boolean enabled = Settings.Secure.getInt(context.getContentResolver(), XYZzone.PREF_KEY_FPS_INFO, 0) == 1;
        if (enabled) {
            context.startService(new Intent(context, FPSInfoService.class));
        }
    }
}
