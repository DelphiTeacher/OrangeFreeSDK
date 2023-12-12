package com.example.escprintdemov2.no_label_ui;

import android.content.Context;
import android.content.Intent;
import android.graphics.Bitmap;
import android.os.Bundle;
import android.text.TextUtils;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

import com.example.escprintdemov2.App;
import com.example.escprintdemov2.BaseActivity;
import com.example.escprintdemov2.R;
import com.example.escprintdemov2.label_ui.LabelTemplateActivity;
import com.example.escprintdemov2.utils.BitmapUtils;
import com.example.escprintdemov2.utils.PrintStrUtils;
import com.example.escprintdemov2.utils.SPUtils;
import com.example.print_sdk.PrintUtil;
import com.example.print_sdk.enums.ALIGN_MODE;
import com.example.print_sdk.enums.MODE_ENLARGE;
import com.google.zxing.BarcodeFormat;

public class NoLabelTemplateActivity extends BaseActivity {

    private PrintUtil printUtil;
    private String mPageType;

    private Context mContext;
    private EditText editNoTempCon;
    int getsupportprint;
    com.example.lc_print_sdk.PrintUtil newprintUtil;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentLayout(R.layout.activity_no_label_template);
        setTitle(getString(R.string.btn_NO_label_TXT4));//设置标题
        setBackArrow();//设置返回按钮和点击事件

        mContext = getApplicationContext();
        Intent intent = getIntent();
        mPageType = intent.getStringExtra("TYPE");
        getsupportprint=(int) SPUtils.get (NoLabelTemplateActivity.this, "getsupportprint", 0);
        if (getsupportprint == 0) {
            printUtil=App.getPrint ();
            printUtil.printEnableMark(false);
        } else {
            newprintUtil=App.getnewPrint ();
            newprintUtil.printEnableMark(false);
        }

        editNoTempCon = findViewById(R.id.edit_no_temp_con);


        Button mBtnNoTemplatePrint = findViewById(R.id.btn_no_template_print);
        mBtnNoTemplatePrint.setOnClickListener(view -> {
            try {
                if (TextUtils.isEmpty(editNoTempCon.getText().toString().trim())) {
                    Toast.makeText(NoLabelTemplateActivity.this, getString(R.string.toast_density), Toast.LENGTH_SHORT).show();
                    return;
                }

                if (getsupportprint == 0){
                    printUtil.printStartNumber(App.number);
                    printUtil.printConcentration(Integer.valueOf(editNoTempCon.getText().toString().trim()));
                    printUtil.printState();
                    printUtil.printAlignment(ALIGN_MODE.ALIGN_LEFT);
                    printUtil.printFontSize(MODE_ENLARGE.NORMAL);
                    printUtil.printTextBold(false);
                    printUtil.printLine();
                    printUtil.printText(PrintStrUtils.LanguageChange(mContext));
                    printUtil.printLine();
                    printUtil.printLine(3);
                    printUtil.printEndNumber();
                }else {

                    newprintUtil.printConcentration(Integer.valueOf(editNoTempCon.getText().toString().trim()));
                    newprintUtil.printTextBold(false);
                    newprintUtil.printLine(1);
                    newprintUtil.printText(PrintStrUtils.LanguageChange(mContext));
                    newprintUtil.printLine(1);
                    newprintUtil.printLine(3);
                    newprintUtil.start();
                }

            } catch (Exception e) {
                e.printStackTrace();
            }
        });
    }


}