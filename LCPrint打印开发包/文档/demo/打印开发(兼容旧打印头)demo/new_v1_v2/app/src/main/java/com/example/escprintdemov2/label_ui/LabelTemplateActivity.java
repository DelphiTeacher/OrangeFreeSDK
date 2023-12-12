package com.example.escprintdemov2.label_ui;

import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.os.Bundle;
import android.text.TextUtils;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

import com.example.escprintdemov2.App;
import com.example.escprintdemov2.BaseActivity;
import com.example.escprintdemov2.R;
import com.example.escprintdemov2.utils.BitmapUtils;
import com.example.escprintdemov2.utils.SPUtils;
import com.example.print_sdk.PrintUtil;
import com.example.print_sdk.enums.ALIGN_MODE;
import com.example.print_sdk.enums.MODE_ENLARGE;
import com.example.print_sdk.interfaces.OnPrintEventListener;

public class LabelTemplateActivity extends BaseActivity {

    private PrintUtil printUtil;
    private String mPageType;
    private EditText editTtempCon;

    int getsupportprint;
    com.example.lc_print_sdk.PrintUtil newprintUtil;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate (savedInstanceState);
        setContentLayout (R.layout.activity_label_template);
        setTitle (getString (R.string.btn_label_TXT4));//设置标题
        setBackArrow ();//设置返回按钮和点击事件

        Intent intent=getIntent ();
        mPageType=intent.getStringExtra ("TYPE");

        getsupportprint=(int) SPUtils.get (LabelTemplateActivity.this, "getsupportprint", 0);
        if (getsupportprint == 0) {
            printUtil=App.getPrint ();
            printUtil.printEnableMark(true);
        } else {
            newprintUtil=App.getnewPrint ();
            newprintUtil.printEnableMark(true);
        }

        editTtempCon=findViewById (R.id.edit_temp_con);
        Button mBtnTemplatePrint=findViewById (R.id.btn_template_print);
        mBtnTemplatePrint.setOnClickListener (new View.OnClickListener () {
            @Override
            public void onClick(View view) {

                if (TextUtils.isEmpty (editTtempCon.getText ().toString ().trim ())) {
                    Toast.makeText (LabelTemplateActivity.this, getString (R.string.toast_density), Toast.LENGTH_SHORT).show ();
                    return;
                }
                printLabel ();

            }

        });

    }

    public void printLabel() {
        try {
            if (getsupportprint == 0) {
                printUtil.printEnableMark (true);
                printUtil.printState ();
                printUtil.printConcentration (Integer.valueOf (editTtempCon.getText ().toString ().trim ()));
                printUtil.printStartNumber (App.number);
                printUtil.printConcentration (25);
                printUtil.printFontSize (MODE_ENLARGE.NORMAL);
                printUtil.printAlignment (ALIGN_MODE.ALIGN_CENTER);
                printUtil.printLine (1);
                printUtil.printText (getString (R.string.Label_test1));
                printUtil.printLine ();
                printUtil.printText (getString (R.string.Label_test2));
                printUtil.printLine ();
                printUtil.printText (getString (R.string.Label_test3));
                printUtil.printLine ();
                printUtil.printGoToNextMark ();
                printUtil.printEndNumber ();
            } else {
                newprintUtil.printEnableMark (true);
                newprintUtil.printConcentration (Integer.valueOf (editTtempCon.getText ().toString ().trim ()));
                newprintUtil.printConcentration (25);
                newprintUtil.printLine (1);
                newprintUtil.printText (getString (R.string.Label_test1));
                newprintUtil.printLine (1);
                newprintUtil.printText (getString (R.string.Label_test2));
                newprintUtil.printLine (1);
                newprintUtil.printText (getString (R.string.Label_test3));
                newprintUtil.printLine (1);
                newprintUtil.printGoToNextMark ();
            }
        } catch (Exception e) {
            e.printStackTrace ();
        }


    }


}