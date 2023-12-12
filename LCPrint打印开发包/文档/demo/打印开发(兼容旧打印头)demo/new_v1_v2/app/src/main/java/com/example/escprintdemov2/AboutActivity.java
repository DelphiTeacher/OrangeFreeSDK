package com.example.escprintdemov2;

import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;

import com.example.escprintdemov2.utils.CommonUtils;
import com.example.print_sdk.PrintUtil;
import com.example.print_sdk.enums.MODE_ENLARGE;

import java.text.SimpleDateFormat;

public class AboutActivity extends BaseActivity {


    private SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMdd");

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentLayout(R.layout.activity_about);
        setTitle(getString(R.string.app_set_about));//设置标题
        setBackArrow();//设置返回按钮和点击事件

        PrintUtil printUtil = App.getPrint();


        Button btnPrintCheck = findViewById(R.id.btn_print_check);
        Button btnSetDef = findViewById(R.id.btn_set_def);

        TextView txt_version = findViewById(R.id.txt_version);
        txt_version.setText(CommonUtils.getPackageName(this));

        btnPrintCheck.setOnClickListener(view -> {
            try {
                printUtil.printState();
                printUtil.printFontSize(MODE_ENLARGE.NORMAL);
                printUtil.printFeatureList();
                printUtil.printLine(3);
            } catch (Exception e) {
                e.printStackTrace();
            }
        });

        btnSetDef.setOnClickListener(view -> {
            try {
                printUtil.printState();
                printUtil.printFontSize(MODE_ENLARGE.NORMAL);
                printUtil.resetPrint();
            } catch (Exception e) {
                e.printStackTrace();
            }
        });
    }

    public static void toSelfSetting(Context context) {

        Intent mIntent = new Intent();
        mIntent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
        if (Build.VERSION.SDK_INT >= 9) {
            mIntent.setAction("android.settings.APPLICATION_DETAILS_SETTINGS");
            mIntent.setData(Uri.fromParts("package", context.getPackageName(), null));
        } else if (Build.VERSION.SDK_INT <= 8) {
            mIntent.setAction(Intent.ACTION_VIEW);
            mIntent.setClassName("com.android.settings", "com.android.setting.InstalledAppDetails");
            mIntent.putExtra("com.android.settings.ApplicationPkgName", context.getPackageName());
        }
        context.startActivity(mIntent);

    }
}
