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

import android.content.Intent;
import android.content.pm.PackageManager;
import android.os.Bundle;
import androidx.preference.PreferenceFragment;
import androidx.preference.Preference;
import androidx.preference.PreferenceCategory;

import id.xyz.xyzzone.kcal.KCalSettingsActivity;
import id.xyz.xyzzone.preferences.SecureSettingListPreference;
import id.xyz.xyzzone.preferences.SecureSettingSwitchPreference;
import id.xyz.xyzzone.preferences.VibrationSeekBarPreference;
import id.xyz.xyzzone.preferences.NotificationLedSeekBarPreference;
import id.xyz.xyzzone.preferences.CustomSeekBarPreference;

import java.lang.Math.*;

public class XYZzone extends PreferenceFragment implements
        Preference.OnPreferenceChangeListener {

    // LED Node
    public static final String CATEGORY_NOTIF = "notification_led";
    public static final String PREF_NOTIF_LED = "notification_led_brightness";
    public static final String NOTIF_LED_PATH = "/sys/class/leds/white/max_brightness";
    
    // FPS Node
    public static final String PREF_KEY_FPS_INFO = "fps_info";
    
    // Gain Node
    public static final  String CATEGORY_AUDIO_AMPLIFY = "audio_amplify";
    public static final  String PREF_HEADPHONE_GAIN = "headphone_gain";
    public static final  String PREF_MIC_GAIN = "mic_gain";
    public static final  String HEADPHONE_GAIN_PATH = "/sys/kernel/sound_control/headphone_gain";
    public static final  String MIC_GAIN_PATH = "/sys/kernel/sound_control/mic_gain";

    public static final int MIN_LED = 1;
    public static final int MAX_LED = 255;

    private static final String CATEGORY_DISPLAY = "display";
    private static final String PREF_DEVICE_DOZE = "device_doze";
    private static final String PREF_DEVICE_KCAL = "device_kcal";

    public static final String HALL_WAKEUP_PATH = "/sys/module/hall/parameters/hall_toggle";
    public static final String HALL_WAKEUP_PROP = "persist.service.folio_daemon";

    @Override
    public void onCreatePreferences(Bundle savedInstanceState, String rootKey) {
        setPreferencesFromResource(R.xml.preferences_xyzzone, rootKey);
        
        if (FileUtils.fileWritable(NOTIF_LED_PATH)) {
            NotificationLedSeekBarPreference notifLedBrightness =
                    (NotificationLedSeekBarPreference) findPreference(PREF_NOTIF_LED);
            notifLedBrightness.setOnPreferenceChangeListener(this);
        } else { getPreferenceScreen().removePreference(findPreference(CATEGORY_NOTIF)); }
        
        // Headphone & Mic Gain
        if (FileUtils.fileWritable(HEADPHONE_GAIN_PATH) && FileUtils.fileWritable(MIC_GAIN_PATH)) {
           CustomSeekBarPreference headphoneGain = (CustomSeekBarPreference) findPreference(PREF_HEADPHONE_GAIN);
           headphoneGain.setOnPreferenceChangeListener(this);
           CustomSeekBarPreference micGain = (CustomSeekBarPreference) findPreference(PREF_MIC_GAIN);
           micGain.setOnPreferenceChangeListener(this);
        } else {
          getPreferenceScreen().removePreference(findPreference(CATEGORY_AUDIO_AMPLIFY));
        }
        
        SecureSettingSwitchPreference fpsInfo = (SecureSettingSwitchPreference) findPreference(PREF_KEY_FPS_INFO);
        fpsInfo.setOnPreferenceChangeListener(this);

        Preference kcal = findPreference(PREF_DEVICE_KCAL);

        kcal.setOnPreferenceClickListener(preference -> {
            Intent intent = new Intent(getActivity().getApplicationContext(), KCalSettingsActivity.class);
            startActivity(intent);
            return true;
        });

    }

    @Override
    public boolean onPreferenceChange(Preference preference, Object value) {
        final String key = preference.getKey();
        switch (key) {
            case PREF_NOTIF_LED:
                FileUtils.setValue(NOTIF_LED_PATH, (1 + Math.pow(1.05694, (int) value )));
                break;

            case PREF_HEADPHONE_GAIN:
                FileUtils.setValue(HEADPHONE_GAIN_PATH, value + " " + value);
                break;

            case PREF_MIC_GAIN:
                FileUtils.setValue(MIC_GAIN_PATH, (int) value);
                break;

            case PREF_KEY_FPS_INFO:
                boolean enabled = (boolean) value;
                Intent fpsinfo = new Intent(this.getContext(), FPSInfoService.class);
                if (enabled) {
                    this.getContext().startService(fpsinfo);
                } else {
                    this.getContext().stopService(fpsinfo);
                }
                break;

            default:
                break;
        }
        return true;
    }

    private boolean isAppNotInstalled(String uri) {
        PackageManager packageManager = getContext().getPackageManager();
        try {
            packageManager.getPackageInfo(uri, PackageManager.GET_ACTIVITIES);
            return false;
        } catch (PackageManager.NameNotFoundException e) {
            return true;
        }
    }
}
