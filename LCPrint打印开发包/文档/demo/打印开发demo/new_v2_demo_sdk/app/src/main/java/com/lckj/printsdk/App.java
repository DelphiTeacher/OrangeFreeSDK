package com.lckj.printsdk;

import android.app.Application;
import android.content.Context;

import com.lckj.printsdk.utils.LoadProgressDialog;


/**
 * 应用启动类
 * 初始化打印机实例
 */
public class App extends Application {


    private Context mContext;
    private static LoadProgressDialog loadProgressDialog;

    @Override
    public void onCreate() {
        super.onCreate();
        mContext = getApplicationContext();
    }

    public static LoadProgressDialog getLoadProgressDialog(Context context) {
        loadProgressDialog = new LoadProgressDialog(context, "打印中……");
        return loadProgressDialog;
    }

}