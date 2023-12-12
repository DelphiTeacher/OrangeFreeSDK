package com.lckj.printsdk.label_ui;

import android.bld.PrintManager;
import android.bld.print.aidl.PrinterBinderListener;
import android.bld.print.configuration.PrintConfig;
import android.content.Intent;
import android.graphics.Bitmap;
import android.os.Bundle;
import android.text.InputFilter;
import android.text.InputType;
import android.text.TextUtils;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.RadioGroup;
import android.widget.TextView;
import android.widget.Toast;


import com.example.lc_print_sdk.PrintUtil;
import com.google.zxing.BarcodeFormat;
import com.lckj.printsdk.BaseActivity;
import com.lckj.printsdk.R;
import com.lckj.printsdk.navigatorBar.RadioGroupEx;
import com.lckj.printsdk.utils.BitmapUtils;

import java.io.UnsupportedEncodingException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class LabelBarcodeActivity extends BaseActivity implements RadioGroup.OnCheckedChangeListener, View.OnClickListener, PrintUtil.PrinterBinderListener {

    private RadioGroupEx mRadioGroupBar;
    private TextView mTxtBarcodetype, mTxtBarcodeInfo;
    private Button mBtnBarcodePrint, mBtnBarcodeCreate;
    private EditText mEditCodebarIn;
    private ImageView mIamgBarcode;
    private BarcodeFormat barcodeFormat;
    private int mBarcode1DType;

    private String mPageType;
    private String barContent="12345678";
    private EditText mEditCon, mEditDistance;
    private Bitmap bitmap;
    private EditText edit_return;
    private int return_distance;
    PrintUtil printUtil;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate (savedInstanceState);
        setContentLayout (R.layout.activity_label_barcode);
        Intent intent=getIntent ();
        mPageType=intent.getStringExtra ("TYPE");
        if ("1".equals (mPageType)) {
            setTitle (getString (R.string.btn_label_TXT2));//设置标题
            findViewById (R.id.ll_distance).setVisibility (View.VISIBLE);
        } else {
            setTitle (getString (R.string.btn_NO_label_TXT2));//设置标题
            findViewById (R.id.ll_distance).setVisibility (View.GONE);
        }
        setBackArrow ();//设置返回按钮和点击事件

        printUtil=PrintUtil.getInstance (this);
        printUtil.setPrintEventListener (this);



        if ("1".equals (mPageType)) {

            printUtil.printEnableMark (true);
            findViewById (R.id.ll_return_paper).setVisibility (View.VISIBLE);
        } else {

            printUtil.printEnableMark (false);
            findViewById (R.id.ll_return_paper).setVisibility (View.GONE);
        }

        mEditCon=findViewById (R.id.edit_con);
        mEditDistance=findViewById (R.id.edit_distance);
        mRadioGroupBar=findViewById (R.id.radiogroup);
        mRadioGroupBar.setOnCheckedChangeListener (this);

        mBtnBarcodeCreate=findViewById (R.id.btn_barcode_create);
        mBtnBarcodePrint=findViewById (R.id.btn_barcode_print);
        mBtnBarcodePrint.setOnClickListener (this);
        mBtnBarcodeCreate.setOnClickListener (this);
        mIamgBarcode=findViewById (R.id.iamg_barcode);
        mEditCodebarIn=findViewById (R.id.edit_codebar_in);
        mTxtBarcodetype=findViewById (R.id.txt_barcode_type);
        mTxtBarcodeInfo=findViewById (R.id.txt_barcaode_info);
        edit_return=findViewById (R.id.edit_return);
        createBarcode (barContent, BarcodeFormat.CODE_128, 360, 90);
        barcodeFormat=BarcodeFormat.CODE_128;
        mBarcode1DType=PrintConfig.BarCodeType.TOP_TYPE_CODE128;
        int unwindPaperLen=PrintUtil.getUnwindPaperLen ();

        edit_return.setText (unwindPaperLen + "");
    }

    @Override
    protected void onDestroy() {
        super.onDestroy ();
        printUtil.removePrintListener (this);
//        printUtil.close ();
    }

    @Override
    public void onClick(View view) {
        try {
            switch (view.getId ()) {
                case R.id.btn_barcode_create:
                    if (!TextUtils.isEmpty (mEditCodebarIn.getText ().toString ())) {
                        barContent=mEditCodebarIn.getText ().toString ();
                    } else {
                        Toast.makeText (this, getString (R.string.toast_content), Toast.LENGTH_SHORT).show ();
                        return;
                    }
                    switch (barcodeFormat) {
                        case UPC_A:
                            if (!isNumeric (barContent)) {
                                Toast.makeText (this, getString (R.string.toast_number_check), Toast.LENGTH_SHORT).show ();
                                return;
                            }
                            createBarcode (barContent, BarcodeFormat.UPC_A, 360, 90);
                            barcodeFormat=BarcodeFormat.UPC_A;
                            mBarcode1DType=PrintConfig.BarCodeType.TOP_TYPE_UPCA;
                            break;
                        case EAN_8:
                            if (!isNumeric (barContent)) {
                                Toast.makeText (this, getString (R.string.toast_number_check), Toast.LENGTH_SHORT).show ();
                                return;
                            }
                            createBarcode (barContent, BarcodeFormat.EAN_8, 360, 90);
                            barcodeFormat=BarcodeFormat.EAN_8;
                            mBarcode1DType=PrintConfig.BarCodeType.TOP_TYPE_EAN8;
                            break;
                        case EAN_13:
                            if (!isNumeric (barContent)) {
                                Toast.makeText (this, getString (R.string.toast_number_check), Toast.LENGTH_SHORT).show ();
                                return;
                            }
                            createBarcode (barContent, BarcodeFormat.EAN_13, 360, 90);
                            barcodeFormat=BarcodeFormat.EAN_13;
                            mBarcode1DType=PrintConfig.BarCodeType.TOP_TYPE_EAN13;
                            break;
                        case CODE_39:
                            if (barContent.length () > 24) {
                                Toast.makeText (this, getString (R.string.toast_str), Toast.LENGTH_SHORT).show ();
                                return;
                            }
                            createBarcode (barContent, BarcodeFormat.CODE_39, 400, 100);
                            barcodeFormat=BarcodeFormat.CODE_39;
                            mBarcode1DType=PrintConfig.BarCodeType.TOP_TYPE_CODE39;
                            break;
                        case ITF:
                            if (!isNumeric (barContent)) {
                                Toast.makeText (this, getString (R.string.toast_number_check), Toast.LENGTH_SHORT).show ();
                                return;
                            }
                            createBarcode (barContent, BarcodeFormat.ITF, 360, 90);
                            barcodeFormat=BarcodeFormat.ITF;
                            mBarcode1DType=PrintConfig.BarCodeType.TOP_TYPE_ITF;
                            break;
                        case CODE_128:
                            if (barContent.length () > 30) {
                                Toast.makeText (this, getString (R.string.toast_str), Toast.LENGTH_SHORT).show ();
                                return;
                            }
                            createBarcode (barContent, BarcodeFormat.CODE_128, 360, 90);
                            barcodeFormat=BarcodeFormat.CODE_128;
                            mBarcode1DType=PrintConfig.BarCodeType.TOP_TYPE_CODE128;
                            break;
                        case QR_CODE:
                            createBarcode (barContent, BarcodeFormat.QR_CODE, 200, 200);
                            barcodeFormat=BarcodeFormat.QR_CODE;
                            break;
                    }
                    break;
                case R.id.btn_barcode_print:
                    canBack=false;
                    if (TextUtils.isEmpty (mEditCon.getText ().toString ().trim ())) {
                        Toast.makeText (this, getString (R.string.toast_density), Toast.LENGTH_SHORT).show ();
                        canBack=true;
                        return;
                    }
                    int density=Integer.valueOf (mEditCon.getText ().toString ().trim ());
                    if (density > 39 || density < 1) {
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
                    return_distance=Integer.valueOf (edit_return.getText ().toString ().trim ());
                    if (return_distance <= 0) {
                        Toast.makeText (this, getString (R.string.toast_rerurn_distance_invalid), Toast.LENGTH_SHORT).show ();
                        canBack=true;
                        return;
                    }
                    switch (barcodeFormat) {
                        case UPC_A:
                        case EAN_8:
                        case EAN_13:
                        case ITF:
                            printBarcode (barContent);
                            break;
                        case CODE_39:
                            if (barContent.length () > 24) {
                                Toast.makeText (this, getString (R.string.toast_str), Toast.LENGTH_SHORT).show ();
                                return;
                            }
                            if (!checkBarcodeFormat (barContent, barcodeFormat)) {
                                showToast (getString (R.string.toast_barcode_error));
                                return;
                            }
                            printBarcode (barContent);
                            break;
                        case CODE_128:
                            if (barContent.length () > 30) {
                                Toast.makeText (this, getString (R.string.toast_str), Toast.LENGTH_SHORT).show ();
                                return;
                            }
                            if (!checkBarcodeFormat (barContent, barcodeFormat)) {
                                showToast (getString (R.string.toast_barcode_error));
                                return;
                            }
                            printBarcode (barContent);
                            break;
                        case QR_CODE:
                            if (bitmap != null) {
                                printQR (barContent);
                            }
                            break;
                        default:
                            canBack=true;
                            break;
                    }
                    break;
            }
        } catch (IllegalArgumentException e) {
            Toast.makeText (this, "" + e.getMessage (), Toast.LENGTH_SHORT).show ();
        } catch (NullPointerException e) {
        }
    }

    public static boolean isNumeric(String str) {
        String regEx="^-?[0-9]+$";
        Pattern pat=Pattern.compile (regEx);
        Matcher mat=pat.matcher (str);
        if (mat.find ()) {
            return true;
        } else {
            return false;
        }
    }

    private boolean checkBarcodeFormat(String barcode, BarcodeFormat barcodeFormat) {

        if (barcodeFormat == BarcodeFormat.CODE_128) {
            return (isChinese (barcode) == false);
        }
        if (barcodeFormat == BarcodeFormat.CODE_39) {
            String strReg="^[0-9A-Z-. *$/%+]{1,24}$";
            return Pattern.matches (strReg, barcode);
        }
        return true;
    }

    // 判断一个字符是否是中文字符
    public boolean isChinese(char c) {
        return c >= 0x4E00 && c <= 0x9FA5;// 根据字节码判断
    }

    // 判断一个字符串是否含有中文
    public boolean isChinese(String str) {
        if (str == null)
            return false;
        for (char c : str.toCharArray ()) {
            if (isChinese (c))
                return true;// 有一个中文字符就返回
        }
        return false;
    }

    public void printBarcode(String barContent) {
        try {
            int concentration=Integer.valueOf (mEditCon.getText ().toString ().trim ());
            int distance=Integer.valueOf (mEditDistance.getText ().toString ().trim ());

//            printUtil.printConcentration (concentration);
            if ("1".equals (mPageType)) {

                printUtil.setFeedPaperSpace (distance);
                printUtil.setUnwindPaperLen (return_distance);

            }
            printUtil.printBarcode (PrintConfig.Align.ALIGN_CENTER, 100, barContent, mBarcode1DType, PrintConfig.HRIPosition.POSITION_BELOW);

            if ("2".equals (mPageType)) {

                printUtil.printLine (6);
            }
            printUtil.start ();

        } catch (Exception e) {
            e.printStackTrace ();
        }
    }

    public void printQR(String barContent) {
        try {
            int concentration=Integer.valueOf (mEditCon.getText ().toString ().trim ());
            int distance=Integer.valueOf (mEditDistance.getText ().toString ().trim ());
//            printUtil.printConcentration (concentration);

            if ("1".equals (mPageType)) {
                //标签模式下生效
                printUtil.setFeedPaperSpace (distance);
                printUtil.setUnwindPaperLen (return_distance);

            }
            printUtil.printQR (PrintConfig.Align.ALIGN_CENTER, 384, barContent);

            if ("2".equals (mPageType)) {

                printUtil.printLine (6);
            }

            printUtil.start ();
        } catch (Exception e) {
            e.printStackTrace ();
        }
    }

    @Override
    public void onCheckedChanged(RadioGroup radioGroup, int checkedId) {
        switch (checkedId) {
            case R.id.rb_upca:
                barContent="12345678911";
                mTxtBarcodetype.setText (getString (R.string.preview) + ": " + getString (R.string.upca));
                mTxtBarcodeInfo.setText (getString (R.string.upca_prompt));
                mEditCodebarIn.setInputType (InputType.TYPE_CLASS_NUMBER);
                mEditCodebarIn.setFilters (new InputFilter[]{new InputFilter.LengthFilter (12)});
                mEditCodebarIn.setText (barContent);
                mEditCodebarIn.setSingleLine (true);
                createBarcode (barContent, BarcodeFormat.UPC_A, 360, 90);
                barcodeFormat=BarcodeFormat.UPC_A;
                mBarcode1DType=PrintConfig.BarCodeType.TOP_TYPE_UPCA;
                break;
            case R.id.rb_ean8:
                barContent="12345670";
                mTxtBarcodetype.setText (getString (R.string.preview) + ": " + getString (R.string.ean8));
                mTxtBarcodeInfo.setText (getString (R.string.ean8_prompt));
                mEditCodebarIn.setInputType (InputType.TYPE_CLASS_NUMBER);
                mEditCodebarIn.setFilters (new InputFilter[]{new InputFilter.LengthFilter (8)});
                mEditCodebarIn.setText (barContent);
                mEditCodebarIn.setSingleLine (true);
                createBarcode (barContent, BarcodeFormat.EAN_8, 360, 90);
                barcodeFormat=BarcodeFormat.EAN_8;
                mBarcode1DType=PrintConfig.BarCodeType.TOP_TYPE_EAN8;
                break;
            case R.id.rb_ean13:
                barContent="6922266445033";
                mTxtBarcodetype.setText (getString (R.string.preview) + ": " + getString (R.string.ean13));
                mTxtBarcodeInfo.setText (getString (R.string.ean13_prompt));
                mEditCodebarIn.setInputType (InputType.TYPE_CLASS_NUMBER);
                mEditCodebarIn.setFilters (new InputFilter[]{new InputFilter.LengthFilter (13)});
                mEditCodebarIn.setText (barContent);
                mEditCodebarIn.setSingleLine (true);
                createBarcode (barContent, BarcodeFormat.EAN_13, 360, 90);
                barcodeFormat=BarcodeFormat.EAN_13;
                mBarcode1DType=PrintConfig.BarCodeType.TOP_TYPE_EAN13;
                break;
            case R.id.rb_code39:
                barContent="123456789ABC";
                mTxtBarcodetype.setText (getString (R.string.preview) + ": " + getString (R.string.code39));
                mTxtBarcodeInfo.setText (getString (R.string.code39_prompt));
                mEditCodebarIn.setInputType (InputType.TYPE_CLASS_TEXT);
                mEditCodebarIn.setFilters (new InputFilter[]{new InputFilter.LengthFilter (24)});
                mEditCodebarIn.setText (barContent);
                mEditCodebarIn.setSingleLine (true);
                createBarcode (barContent, BarcodeFormat.CODE_39, 400, 100);
                barcodeFormat=BarcodeFormat.CODE_39;
                mBarcode1DType=PrintConfig.BarCodeType.TOP_TYPE_CODE39;
                break;
            case R.id.rb_itf:
                barContent="1234567891";
                mTxtBarcodetype.setText (getString (R.string.preview) + ": " + getString (R.string.itf));
                mTxtBarcodeInfo.setText (getString (R.string.itf_prompt));
                mEditCodebarIn.setInputType (InputType.TYPE_CLASS_NUMBER);
                mEditCodebarIn.setFilters (new InputFilter[]{new InputFilter.LengthFilter (24)});
                mEditCodebarIn.setText (barContent);
                mEditCodebarIn.setSingleLine (true);
                createBarcode (barContent, BarcodeFormat.ITF, 360, 90);
                barcodeFormat=BarcodeFormat.ITF;
                mBarcode1DType=PrintConfig.BarCodeType.TOP_TYPE_ITF;
                break;
            case R.id.rb_code128:
                barContent="123456789ABC";
                mTxtBarcodetype.setText (getString (R.string.preview) + ": " + getString (R.string.code128));
                mTxtBarcodeInfo.setText (getString (R.string.code128_prompt));
                mEditCodebarIn.setInputType (InputType.TYPE_CLASS_TEXT);
                mEditCodebarIn.setFilters (new InputFilter[]{new InputFilter.LengthFilter (30)});
                mEditCodebarIn.setText (barContent);
                mEditCodebarIn.setSingleLine (true);
                createBarcode (barContent, BarcodeFormat.CODE_128, 360, 90);
                barcodeFormat=BarcodeFormat.CODE_128;
                mBarcode1DType=PrintConfig.BarCodeType.TOP_TYPE_CODE128;
                break;
            case R.id.rb_qr:
                barContent="123456789ABC";
                mTxtBarcodetype.setText (getString (R.string.preview) + ": " + getString (R.string.qr));
                mTxtBarcodeInfo.setText (getString (R.string.qr_prompt));
                mEditCodebarIn.setInputType (InputType.TYPE_CLASS_TEXT);
                mEditCodebarIn.setFilters (new InputFilter[]{new InputFilter.LengthFilter (300)});
                mEditCodebarIn.setText (barContent);
                mEditCodebarIn.setSingleLine (false);
                createBarcode (barContent, BarcodeFormat.QR_CODE, 300, 300);
                barcodeFormat=BarcodeFormat.QR_CODE;
                break;
        }
    }

    public void createBarcode(String content, BarcodeFormat barcodeFormat, Integer width, Integer height) {
        try {
            String s_gbk=new String (content.getBytes (), "utf-8");
            bitmap=BitmapUtils.encode2dAsBitmap (s_gbk, barcodeFormat, width, height);
            mIamgBarcode.setImageBitmap (bitmap);
        } catch (UnsupportedEncodingException e) {

        }
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