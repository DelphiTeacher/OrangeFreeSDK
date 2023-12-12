package com.lckj.printsdk.label_ui;

import android.bld.PrintManager;
import android.bld.print.aidl.PrinterBinderListener;
import android.bld.print.configuration.PrintConfig;
import android.content.Intent;
import android.graphics.Paint;
import android.graphics.Typeface;
import android.os.Bundle;
import android.text.SpannableString;
import android.text.TextUtils;
import android.text.style.AbsoluteSizeSpan;
import android.util.Log;
import android.util.TypedValue;
import android.view.View;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.EditText;
import android.widget.RadioGroup;
import android.widget.Toast;

import com.example.lc_print_sdk.PrintUtil;
import com.lckj.printsdk.BaseActivity;
import com.lckj.printsdk.R;
import com.lckj.printsdk.navigatorBar.LineEditext;


public class LabelTextActivity extends BaseActivity implements RadioGroup.OnCheckedChangeListener, View.OnClickListener, PrintUtil.PrinterBinderListener {

    private RadioGroup mRgAlign, rgFont;
    private CheckBox mCbBold, mCbLine;
    private LineEditext mEditTextIn;
    private AbsoluteSizeSpan ass;
    private Button mBtnPrintText;
    private int align_mode=PrintConfig.Align.ALIGN_LEFT;
    private int mode_enlarge=PrintConfig.FontSize.TOP_FONT_SIZE_MIDDLE;
    private boolean bold=false;
    private boolean underline=false;
    private String mPageType;

    private EditText mEditCon, mEditDistance;
    private EditText edit_return;
    PrintUtil printUtil;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate (savedInstanceState);
        setContentLayout (R.layout.activity_text);
        Intent intent=getIntent ();
        mPageType=intent.getStringExtra ("TYPE");
        if ("1".equals (mPageType)) {
            setTitle (getString (R.string.btn_label_TXT1));//设置标题
            findViewById (R.id.ll_distance).setVisibility (View.VISIBLE);
            findViewById (R.id.ll_return_paper).setVisibility (View.VISIBLE);
        } else {
            setTitle (getString (R.string.btn_NO_label_TXT1));//设置标题
            findViewById (R.id.ll_distance).setVisibility (View.GONE);
            findViewById (R.id.ll_return_paper).setVisibility (View.GONE);
        }
        setBackArrow ();//设置返回按钮和点击事件

        printUtil=PrintUtil.getInstance (this);
        printUtil.setPrintEventListener (this);



        if ("1".equals (mPageType)) {
            printUtil.printEnableMark (true);

        } else {
            printUtil.printEnableMark (false);

        }
        mEditCon=findViewById (R.id.edit_con);
        mEditDistance=findViewById (R.id.edit_distance);
        mRgAlign=findViewById (R.id.rg_align);
        rgFont=findViewById (R.id.rg_font);
        mRgAlign.setOnCheckedChangeListener (this);
        rgFont.setOnCheckedChangeListener (this);

        mCbBold=findViewById (R.id.cb_bold);
        mCbLine=findViewById (R.id.cb_under_line);
        mEditTextIn=findViewById (R.id.edit_text_in);
        mBtnPrintText=findViewById (R.id.btn_print_text);
        mBtnPrintText.setOnClickListener (this);

        edit_return=findViewById (R.id.edit_return);


        SpannableString ss=new SpannableString (getString (R.string.in_txt));//定义hint的值

        mCbBold.setOnCheckedChangeListener ((compoundButton, b) -> {
            if (b) {
                mEditTextIn.setTypeface (Typeface.create (mEditTextIn.getTypeface (), Typeface.BOLD), Typeface.NORMAL);
                mEditTextIn.invalidate ();
                bold=true;
            } else {
                mEditTextIn.setTypeface (Typeface.create (mEditTextIn.getTypeface (), Typeface.NORMAL), Typeface.NORMAL);
                mEditTextIn.invalidate ();
                bold=false;
            }
        });
        mCbLine.setOnCheckedChangeListener ((compoundButton, b) -> {
            if (b) {
                underline=true;
                mEditTextIn.isLine (true);
                mEditTextIn.getPaint ().setFlags (Paint.UNDERLINE_TEXT_FLAG);
            } else {
                underline=false;
                mEditTextIn.isLine (false);
                mEditTextIn.getPaint ().setFlags (0);
            }
        });

        int unwindPaperLen=PrintUtil.getUnwindPaperLen ();
        edit_return.setText (unwindPaperLen + "");
    }

    @Override
    public void onCheckedChanged(RadioGroup radioGroup, int checkedId) {
        switch (checkedId) {
            case R.id.rb_align_left:
                align_mode=PrintConfig.Align.ALIGN_LEFT;
                break;
            case R.id.rb_align_center:
                align_mode=PrintConfig.Align.ALIGN_CENTER;
                break;
            case R.id.rb_align_right:
                align_mode=PrintConfig.Align.ALIGN_RIGHT;
                break;
            case R.id.rb_small:
                mEditTextIn.setTextSize (TypedValue.COMPLEX_UNIT_SP, 14);
                mode_enlarge=PrintConfig.FontSize.TOP_FONT_SIZE_MIDDLE;
                break;
            case R.id.rb_double_width:
                mEditTextIn.setTextSize (TypedValue.COMPLEX_UNIT_SP, 20);
                mode_enlarge=PrintConfig.FontSize.TOP_FONT_SIZE_LARGE;
                break;
            case R.id.rb_double_height:
                mEditTextIn.setTextSize (TypedValue.COMPLEX_UNIT_SP, 25);
                mode_enlarge=PrintConfig.FontSize.TOP_FONT_SIZE_XLARGE;
                break;
        }
    }

    @Override
    public void onClick(View view) {
        switch (view.getId ()) {
            case R.id.btn_print_text:
                canBack=false;

                if (TextUtils.isEmpty (mEditTextIn.getText ().toString ())) {
                    Toast.makeText (this, getString (R.string.toast_no_data), Toast.LENGTH_SHORT).show ();
                    canBack=true;
                    return;
                }
                if (TextUtils.isEmpty (mEditCon.getText ().toString ().trim ())) {
                    Toast.makeText (this, getString (R.string.toast_density), Toast.LENGTH_SHORT).show ();
                    canBack=true;
                    return;
                }
                int concentration=Integer.valueOf (mEditCon.getText ().toString ().trim ());
                if (concentration > 39 || concentration < 1) {
                    Toast.makeText (this, getString (R.string.toast_density_outofrange), Toast.LENGTH_SHORT).show ();
                    canBack=true;
                    return;
                }
                if (mEditDistance.getText ().toString ().trim ().length () == 0) {
                    Toast.makeText (this, getString (R.string.toast_distance_invalid), Toast.LENGTH_SHORT).show ();
                    canBack=true;
                    return;
                }
                int distance=Integer.valueOf (mEditDistance.getText ().toString ().trim ());
                if (distance <= 0) {
                    Toast.makeText (this, getString (R.string.toast_distance_invalid), Toast.LENGTH_SHORT).show ();
                    canBack=true;
                    return;
                }
                if (edit_return.getText ().toString ().trim ().length () == 0) {
                    Toast.makeText (this, getString (R.string.toast_rerurn_distance_invalid), Toast.LENGTH_SHORT).show ();
                    canBack=true;
                    return;
                }
                int return_distance=Integer.valueOf (edit_return.getText ().toString ().trim ());
                if (return_distance <= 0) {
                    Toast.makeText (this, getString (R.string.toast_rerurn_distance_invalid), Toast.LENGTH_SHORT).show ();
                    canBack=true;
                    return;
                }

                String strContent=mEditTextIn.getText ().toString ();
//                printUtil.printConcentration (concentration);

                if ("1".equals (mPageType)) {
                    //标签模式下生效
                    printUtil.setFeedPaperSpace (distance);

                    printUtil.setUnwindPaperLen (return_distance);
                }
                printUtil.printText (align_mode, mode_enlarge, bold, underline, strContent);
                if ("2".equals (mPageType)) {
                    printUtil.printLine (5);

                }
                printUtil.start ();

                break;
            default:
                canBack=true;
                break;
        }
    }

    @Override
    protected void onDestroy() {
        super.onDestroy ();
        printUtil.removePrintListener (this);
//        printUtil.close ();

    }

    @Override
    public void onPrintCallback(int state) {
        Log.e ("testtest", "  state:" + state);

        canBack=true;
        if (PrintConfig.IErrorCode.ERROR_NO_ERROR == state) {
            //打印成功
            showToast (getString (R.string.toast_print_success));
        } else if (PrintConfig.IErrorCode.ERROR_PRINT_NOPAPER == state) {
            showToast (getString (R.string.toast_no_paper));
        } else if (PrintConfig.IErrorCode.ERROR_DATA_INPUT == state) {
            showToast (getString (R.string.toast_input_parameter_error));
        } else if (PrintConfig.IErrorCode.ERROR_CMD == state) {
            showToast (getString (R.string.toast_Instruction_error));
        } else if (PrintConfig.IErrorCode.ERROR_DATA_INVALID == state) {
            showToast (getString (R.string.toast_data_is_invalid));
        } else if (PrintConfig.IErrorCode.ERROR_DEV_BMARK == state) {
            showToast (getString (R.string.toast_abnormal_black_mark_detection));
        } else if (PrintConfig.IErrorCode.ERROR_DEV_FEED == state) {
            showToast (getString (R.string.toast_moving_paper));
        } else if (PrintConfig.IErrorCode.ERROR_DEV_IS_BUSY == state) {
            showToast (getString (R.string.toast_device_busy));
        } else if (PrintConfig.IErrorCode.ERROR_DEV_NOT_OPEN == state) {
            showToast (getString (R.string.toast_device_is_not_turned_on));
        } else if (PrintConfig.IErrorCode.ERROR_DEV_NO_BATTERY == state) {
            showToast (getString (R.string.toast_low_electricity));
        } else if (PrintConfig.IErrorCode.ERROR_DEV_PRINT == state) {
            showToast (getString (R.string.toast_print_now));
        } else if (PrintConfig.IErrorCode.ERROR_GRAY_INVALID == state) {
            showToast (getString (R.string.toast_illegal_concentrationr));
        } else if (PrintConfig.IErrorCode.ERROR_NO_DATA == state) {
            showToast (getString (R.string.toast_no_data));
        } else if (PrintConfig.IErrorCode.ERROR_PRINT_BARCODE == state) {
            showToast (getString (R.string.toast_error_printing_barcode));
        } else if (PrintConfig.IErrorCode.ERROR_PRINT_BITMAP == state) {
            showToast (getString (R.string.toast_error_printing_bitmap));
        } else if (PrintConfig.IErrorCode.ERROR_PRINT_BITMAP_WIDTH_OVERFLOW == state) {
            showToast (getString (R.string.toast_print_bitmap_width_overflow));
        } else if (PrintConfig.IErrorCode.ERROR_PRINT_DATA_MAC == state) {
            showToast (getString (R.string.toast_mac_check_error));
        } else if (PrintConfig.IErrorCode.ERROR_PRINT_HOT == state) {
            showToast (getString (R.string.toast_high_temperature));
        } else if (PrintConfig.IErrorCode.ERROR_PRINT_ILLEGAL_ARGUMENT == state) {
            showToast (getString (R.string.toast_parameter_error));
        } else if (PrintConfig.IErrorCode.ERROR_PRINT_QRCODE == state) {
            showToast (getString (R.string.toast_error_printing_qrcode));
        } else if (PrintConfig.IErrorCode.ERROR_PRINT_TEXT == state) {
            showToast (getString (R.string.toast_print_text_error));
        } else if (PrintConfig.IErrorCode.ERROR_PRINT_UNKNOWN == state) {
            showToast (getString (R.string.toast_unknown_error));
        } else if (PrintConfig.IErrorCode.ERROR_RESULT_EXIST == state) {
            showToast (getString (R.string.toast_result_already_exists));
        } else if (PrintConfig.IErrorCode.ERROR_TIME_OUT == state) {
            showToast (getString (R.string.toast_overtime));
        } else {
            showToast ("Printer error. state=" + state);
        }
    }

    @Override
    public void onVersion(String s) {

    }

    private boolean canBack=true;

    @Override
    protected boolean titleCanBack() {
        return canBack;
    }

    @Override
    public void onBackPressed() {
        if (!canBack) {
            return;
        }
        super.onBackPressed ();
    }


}