package com.example.escprintdemov2.utils;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.os.Parcelable;
import android.provider.Settings;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import androidx.fragment.app.Fragment;

/**
 * Created by moxiaomo
 * on 2021/2/24
 */
public class IntentUtil {

    public static final String SETTINGS_ACTION = "android.settings.APPLICATION_DETAILS_SETTINGS";


    public static void go(Context context, Class cls) {
        Intent intent = new Intent(context, cls);
        context.startActivity(intent);
    }

    /**
     * 没有参数的跳转
     *
     * @param context
     * @param cls
     * @param key
     * @param val
     */

    public static void go(Context context, Class cls, String key, String val) {
        Intent intent = new Intent(context, cls);
        intent.putExtra(key, val);
        context.startActivity(intent);
    }

    /**
     * 两个参数的跳转
     *
     * @param context
     * @param cls
     * @param key
     * @param val
     * @param key2
     * @param val2
     */

    public static void go(Context context, Class cls, String key, String val, String key2, String val2) {
        Intent intent = new Intent(context, cls);
        intent.putExtra(key, val);
        intent.putExtra(key2, val2);
        context.startActivity(intent);
    }

    /**
     * 三个参数的跳转
     *
     * @param context
     * @param cls
     * @param key
     * @param val
     * @param key2
     * @param val2
     */


    public static void go(Context context, Class cls, String key, String val, String key2, String val2, String key3, String val3) {
        Intent intent = new Intent(context, cls);
        intent.putExtra(key, val);
        intent.putExtra(key2, val2);
        intent.putExtra(key3, val3);
        context.startActivity(intent);
    }

    /**
     * 四个参数的跳转
     *
     * @param context
     * @param cls
     * @param key
     * @param val
     * @param key2
     * @param val2
     */
    public static void go(Context context, Class cls, String key, String val, String key2, String val2, String key3, String val3, String key4, String val4) {
        Intent intent = new Intent(context, cls);
        intent.putExtra(key, val);
        intent.putExtra(key2, val2);
        intent.putExtra(key3, val3);
        intent.putExtra(key4, val4);
        context.startActivity(intent);
    }

    /**
     * 对象跳转
     *
     * @param context
     * @param cls
     * @param key
     * @param val
     */

    public static void StartBundleIntent(Context context, Class cls, String key, Class val) {
        Intent intent = new Intent(context, cls);
        Bundle bundle = new Bundle();
        bundle.putSerializable(key, val);
        context.startActivity(intent);
    }

    /**
     * 集合跳转
     *
     * @param context
     * @param cls
     * @param key
     */
    public static void StartListIntent(Context context, Class cls, String key, List list) {
        Intent intent = new Intent(context, cls);
        intent.putExtra(key, (Serializable) list);
        context.startActivity(intent);
    }

    /**
     * 集合带一个参数
     *
     * @param context
     * @param cls
     * @param key
     * @param list
     * @param key2
     * @param val
     */
    public static void StartListSignIntent(Context context, Class cls, String key, List list, String key2, String val) {
        Intent intent = new Intent(context, cls);
        intent.putExtra(key, (Serializable) list);
        intent.putExtra(key2, val);
        context.startActivity(intent);
    }


    /**
     * 跳转到打电话界面
     *
     * @param context
     * @param phoneNum
     */
    public static void goCall(Context context, String phoneNum) {
        Intent intent = new Intent();
        intent.setAction(Intent.ACTION_CALL);
        intent.setData(Uri.parse("tel://" + phoneNum));
        context.startActivity(intent);
    }


    /**
     * 跳转到浏览器页面
     *
     * @param context
     * @param url
     */
    public static void goBrowser(Context context, String url) {
        Intent intent = new Intent();
        intent.setAction(Intent.ACTION_VIEW);
        intent.setData(Uri.parse(url));
        context.startActivity(intent);
    }


    /**
     * 跳转到app的设置页面(包括通知管理、应用权限等)
     */
    public static void goSetting(Context context) {
        Intent intent = new Intent()
                .setAction(SETTINGS_ACTION)
                .setData(Uri.fromParts("package",
                        context.getApplicationContext().getPackageName(), null));
        context.startActivity(intent);
    }

    /**
     * 跳转系统的蓝牙设置界面
     *
     * @param context
     */
    public static void goBluetoothSetting(Context context) {
        Intent intent = new Intent(Settings.ACTION_BLUETOOTH_SETTINGS);
        context.startActivity(intent);
    }

    /**
     * 跳转到无限网络界面
     *
     * @param context
     */
    public static void goWifiSetting(Context context) {
        Intent intent = new Intent(Settings.ACTION_WIFI_SETTINGS);
        context.startActivity(intent);
    }

    /**
     * 跳转到移动网络设置界面
     *
     * @param context
     */
    public static void goRoamingSetting(Context context) {
        Intent intent = new Intent(Settings.ACTION_DATA_ROAMING_SETTINGS);
        context.startActivity(intent);
    }

    /**
     * 跳转位置服务界面【管理已安装的应用程序】
     *
     * @param context
     */
    public static void goLocationSettings(Context context) {
        Intent intent = new Intent(Settings.ACTION_LOCATION_SOURCE_SETTINGS);
        context.startActivity(intent);
    }

}