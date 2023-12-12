package com.example.escprintdemov2.label_ui;

import android.content.Intent;
import android.graphics.Paint;
import android.graphics.Typeface;
import android.os.Bundle;
import android.text.SpannableString;
import android.text.TextUtils;
import android.text.style.AbsoluteSizeSpan;
import android.util.TypedValue;
import android.view.View;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.CompoundButton;
import android.widget.EditText;
import android.widget.RadioButton;
import android.widget.RadioGroup;
import android.widget.Toast;

import com.example.escprintdemov2.App;
import com.example.escprintdemov2.BaseActivity;
import com.example.escprintdemov2.R;
import com.example.escprintdemov2.navigatorBar.LineEditext;
import com.example.escprintdemov2.utils.SPUtils;
import com.example.print_sdk.PrintUtil;
import com.example.print_sdk.enums.ALIGN_MODE;
import com.example.print_sdk.enums.MODE_ENLARGE;

public class LabelTextActivity extends BaseActivity implements RadioGroup.OnCheckedChangeListener, View.OnClickListener {

    private RadioGroup mRgAlign, rgFont;
    private CheckBox mCbBold, mCbLine;
    private LineEditext mEditTextIn;
    private AbsoluteSizeSpan ass;
    private Button mBtnPrintText;
    private ALIGN_MODE align_mode;
    private MODE_ENLARGE mode_enlarge;
    private boolean bold=false;
    private boolean line=false;
    private String mPageType;
    private PrintUtil printUtil;
    private EditText editTxtCon;
    int getsupportprint;
    com.example.lc_print_sdk.PrintUtil newprintUtil;
    int fontsize;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate (savedInstanceState);
        setContentLayout (R.layout.activity_text);
        Intent intent=getIntent ();
        mPageType=intent.getStringExtra ("TYPE");
        if ("1".equals (mPageType)) {
            setTitle (getString (R.string.btn_label_TXT1));//设置标题
        } else {
            setTitle (getString (R.string.btn_NO_label_TXT1));//设置标题
        }
        setBackArrow ();//设置返回按钮和点击事件

        getsupportprint=(int) SPUtils.get (LabelTextActivity.this, "getsupportprint", 0);
        if (getsupportprint == 0) {
            printUtil=App.getPrint ();
            //初始化调用一次即可。设置开启/关闭黑标检测

            if ("1".equals (mPageType)) {
                printUtil.printEnableMark (true);
            } else {
                printUtil.printEnableMark (false);
            }
        } else {

            newprintUtil=App.getnewPrint ();
            if ("1".equals (mPageType)) {
                newprintUtil.printEnableMark (true);
            } else {
                newprintUtil.printEnableMark (false);
            }
        }


        editTxtCon=findViewById (R.id.edit_txt_con);
        mRgAlign=findViewById (R.id.rg_align);
        rgFont=findViewById (R.id.rg_font);
        mRgAlign.setOnCheckedChangeListener (this);
        rgFont.setOnCheckedChangeListener (this);

        mCbBold=findViewById (R.id.cb_bold);
        mCbLine=findViewById (R.id.cb_under_line);
        mEditTextIn=findViewById (R.id.edit_text_in);
        mBtnPrintText=findViewById (R.id.btn_print_text);
        mBtnPrintText.setOnClickListener (this);
        RadioButton rb_align_center=findViewById (R.id.rb_align_center);
        rb_align_center.setChecked (true);

        RadioButton rb_double_width=findViewById (R.id.rb_double_width);
        rb_double_width.setChecked (true);

        SpannableString ss=new SpannableString (getString (R.string.in_txt));//定义hint的值



        mCbBold.setOnCheckedChangeListener (new CompoundButton.OnCheckedChangeListener () {
            @Override
            public void onCheckedChanged(CompoundButton compoundButton, boolean b) {
                if (b) {
                    mEditTextIn.setTypeface (Typeface.create (mEditTextIn.getTypeface (), Typeface.BOLD), Typeface.NORMAL);
                    mEditTextIn.invalidate ();
                    bold=true;
                } else {
                    mEditTextIn.setTypeface (Typeface.create (mEditTextIn.getTypeface (), Typeface.NORMAL), Typeface.NORMAL);
                    mEditTextIn.invalidate ();
                    bold=false;
                }
            }
        });
        mCbLine.setOnCheckedChangeListener (new CompoundButton.OnCheckedChangeListener () {
            @Override
            public void onCheckedChanged(CompoundButton compoundButton, boolean b) {
                if (b) {
                    line=true;
                    mEditTextIn.isLine (true);
                    mEditTextIn.getPaint ().setFlags (Paint.UNDERLINE_TEXT_FLAG);
                } else {
                    line=false;
                    mEditTextIn.isLine (false);
                    mEditTextIn.getPaint ().setFlags (0);
                }
            }
        });
    }

    @Override
    public void onCheckedChanged(RadioGroup radioGroup, int checkedId) {
        switch (checkedId) {
            case R.id.rb_align_left:
                align_mode=ALIGN_MODE.ALIGN_LEFT;
                break;
            case R.id.rb_align_center:
                align_mode=ALIGN_MODE.ALIGN_CENTER;
                break;
            case R.id.rb_align_right:
                align_mode=ALIGN_MODE.ALIGN_RIGHT;
                break;
            case R.id.rb_small:
                mEditTextIn.setTextSize (TypedValue.COMPLEX_UNIT_SP, 14);
                mode_enlarge=MODE_ENLARGE.NORMAL;

                fontsize=3;
                break;
            case R.id.rb_double_width:
                mEditTextIn.setTextSize (TypedValue.COMPLEX_UNIT_SP, 20);
                mode_enlarge=MODE_ENLARGE.HEIGHT_DOUBLE;
                fontsize=5;
                break;
            case R.id.rb_double_height:
                mEditTextIn.setTextSize (TypedValue.COMPLEX_UNIT_SP, 25);
                mode_enlarge=MODE_ENLARGE.HEIGHT_WIDTH_DOUBLE;
                fontsize=7;
                break;
        }
    }


    @Override
    public void onClick(View view) {
        try {
            if (TextUtils.isEmpty (mEditTextIn.getText ().toString ())) {
                Toast.makeText (this, getString (R.string.toast_no_data), Toast.LENGTH_SHORT).show ();
                return;
            }

            if (TextUtils.isEmpty (editTxtCon.getText ().toString ().trim ())) {
                Toast.makeText (this, getString (R.string.toast_density), Toast.LENGTH_SHORT).show ();
                return;
            }
            if (getsupportprint == 0) {
                printUtil.printFontSize (MODE_ENLARGE.HEIGHT_DOUBLE);
                printUtil.printState ();
                printUtil.printStartNumber (App.number);
                printUtil.printConcentration (Integer.valueOf (editTxtCon.getText ().toString ().trim ()));
                if (align_mode != null) {
                    printUtil.printAlignment (align_mode);
                }
                if (mode_enlarge != null) {
                    printUtil.printFontSize (mode_enlarge);
                }
                if (line) {
                    printUtil.printUnderscore (50);
                } else {
                    printUtil.printUnderscore (48);
                }
                printUtil.printTextBold (bold);
                printUtil.printLine ();
                printUtil.printText (mEditTextIn.getText ().toString ());
                printUtil.printLine ();
                if ("1".equals (mPageType)) {
                    printUtil.printGoToNextMark ();
                } else {
                    printUtil.printLine (3);
                }
                printUtil.printEndNumber ();
            } else {
                newprintUtil.printConcentration (Integer.valueOf (editTxtCon.getText ().toString ().trim ()));
                newprintUtil.printTextBold (bold);
                newprintUtil.printLine (1);
//                newprintUtil.printText(mEditTextIn.getText().toString());

                newprintUtil.printText (align_mode.Get () + 1,fontsize , bold, line, mEditTextIn.getText ().toString ());
                newprintUtil.printLine (1);
                if ("1".equals (mPageType)) {
                    newprintUtil.printGoToNextMark ();
                } else {
                    newprintUtil.printLine (4);
                    newprintUtil.start ();
                }

            }

        } catch (Exception e) {
            e.printStackTrace ();
        }
    }
}