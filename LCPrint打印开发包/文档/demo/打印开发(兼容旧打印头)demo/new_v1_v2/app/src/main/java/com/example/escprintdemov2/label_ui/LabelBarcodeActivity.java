package com.example.escprintdemov2.label_ui;

import android.content.Intent;
import android.graphics.Bitmap;
import android.os.Bundle;
import android.text.InputFilter;
import android.text.InputType;
import android.text.TextUtils;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.RadioGroup;
import android.widget.TextView;
import android.widget.Toast;

import com.example.escprintdemov2.App;
import com.example.escprintdemov2.BaseActivity;
import com.example.escprintdemov2.R;
import com.example.escprintdemov2.navigatorBar.RadioGroupEx;
import com.example.escprintdemov2.utils.BitmapUtils;
import com.example.escprintdemov2.utils.SPUtils;
import com.example.print_sdk.PrintUtil;
import com.example.print_sdk.enums.ALIGN_MODE;
import com.example.print_sdk.enums.BARCODE_1D_TYPE;
import com.google.zxing.BarcodeFormat;

import java.io.UnsupportedEncodingException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class LabelBarcodeActivity extends BaseActivity implements RadioGroup.OnCheckedChangeListener, View.OnClickListener {

    private RadioGroupEx mRadioGroupBar;
    private TextView txtBarcodeType, txtBarcodeInfo;
    private Button mBtnBarcodePrint, mBtnBarcodeCreate;
    private EditText etBarcodeContent;
    private ImageView ivBarcode;
    private BarcodeFormat mBarcodeFormat;
    private BARCODE_1D_TYPE mBarcode1DType;
    private PrintUtil printUtil;
    private String mPageType;
    private String barContent = "12345678";
    private EditText mEditBarCon;
    private Bitmap bitmap;
    private int number = 1000000001;
    int getsupportprint;
    com.example.lc_print_sdk.PrintUtil newprintUtil;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentLayout(R.layout.activity_label_barcode);
        Intent intent = getIntent();
        mPageType = intent.getStringExtra("TYPE");
        if ("1".equals(mPageType)) {
            setTitle(getString(R.string.btn_label_TXT2));//设置标题
        } else {
            setTitle(getString(R.string.btn_NO_label_TXT2));//设置标题
        }
        setBackArrow();//设置返回按钮和点击事件
        getsupportprint=(int) SPUtils.get (LabelBarcodeActivity.this, "getsupportprint", 0);
        if (getsupportprint == 0){
            printUtil = App.getPrint();
            //初始化调用一次即可。设置开启/关闭黑标检测
            if ("1".equals(mPageType)) {
                printUtil.printEnableMark(true);
            } else {
                printUtil.printEnableMark(false);
            }
        }else {
            newprintUtil=App.getnewPrint ();
            if ("1".equals(mPageType)) {
                newprintUtil.printEnableMark(true);
            } else {
                newprintUtil.printEnableMark(false);
            }
        }

        mEditBarCon = findViewById(R.id.edit_bar_con);
        mRadioGroupBar = findViewById(R.id.radiogroup);
        mRadioGroupBar.setOnCheckedChangeListener(this);

        mBtnBarcodeCreate = findViewById(R.id.btn_barcode_create);
        mBtnBarcodePrint = findViewById(R.id.btn_barcode_print);
        mBtnBarcodePrint.setOnClickListener(this);
        mBtnBarcodeCreate.setOnClickListener(this);

        ivBarcode = findViewById(R.id.iamg_barcode);
        etBarcodeContent = findViewById(R.id.edit_codebar_in);
        txtBarcodeType = findViewById(R.id.txt_barcode_type);
        txtBarcodeInfo = findViewById(R.id.txt_barcaode_info);

        createBarcode(barContent, BarcodeFormat.CODE_128, 360, 90);
        mBarcodeFormat = BarcodeFormat.CODE_128;
        mBarcode1DType = BARCODE_1D_TYPE.CODE128;
    }

    @Override
    public void onClick(View view) {
        if (TextUtils.isEmpty(mEditBarCon.getText().toString().trim())) {
            Toast.makeText(this, getString(R.string.toast_density), Toast.LENGTH_SHORT).show();
            return;
        }
        try {
            switch (view.getId()) {
                case R.id.btn_barcode_create:
                    if (!TextUtils.isEmpty(etBarcodeContent.getText().toString())) {
                        barContent = etBarcodeContent.getText().toString();
                    } else {
                        Toast.makeText(this, getString(R.string.toast_content), Toast.LENGTH_SHORT).show();
                        return;
                    }
                    switch (mBarcodeFormat) {
                        case UPC_A:
                            if (!isNumeric(barContent)) {
                                Toast.makeText(this, getString(R.string.toast_number_check), Toast.LENGTH_SHORT).show();
                                return;
                            }
                            createBarcode(barContent, BarcodeFormat.UPC_A, 360, 90);
                            mBarcodeFormat = BarcodeFormat.UPC_A;
                            mBarcode1DType = BARCODE_1D_TYPE.UPCA;
                            break;
                        case EAN_8:
                            if (!isNumeric(barContent)) {
                                Toast.makeText(this, getString(R.string.toast_number_check), Toast.LENGTH_SHORT).show();
                                return;
                            }
                            createBarcode(barContent, BarcodeFormat.EAN_8, 360, 90);
                            mBarcodeFormat = BarcodeFormat.EAN_8;
                            mBarcode1DType = BARCODE_1D_TYPE.EAN8;
                            break;
                        case EAN_13:
                            if (!isNumeric(barContent)) {
                                Toast.makeText(this, getString(R.string.toast_number_check), Toast.LENGTH_SHORT).show();
                                return;
                            }
                            createBarcode(barContent, BarcodeFormat.EAN_13, 360, 90);
                            mBarcodeFormat = BarcodeFormat.EAN_13;
                            mBarcode1DType = BARCODE_1D_TYPE.EAN13;
                            break;
                        case CODE_39:
                            if (barContent.length() > 24) {
                                Toast.makeText(this, getString(R.string.toast_str), Toast.LENGTH_SHORT).show();
                                return;
                            }
                            createBarcode(barContent, BarcodeFormat.CODE_39, 400, 100);
                            mBarcodeFormat = BarcodeFormat.CODE_39;
                            mBarcode1DType = BARCODE_1D_TYPE.CODE39;
                            break;
                        case ITF:
                            if (!isNumeric(barContent)) {
                                Toast.makeText(this, getString(R.string.toast_number_check), Toast.LENGTH_SHORT).show();
                                return;
                            }
                            createBarcode(barContent, BarcodeFormat.ITF, 360, 90);
                            mBarcodeFormat = BarcodeFormat.ITF;
                            mBarcode1DType = BARCODE_1D_TYPE.ITF25;
                            break;
                        case CODE_128:
                            if (barContent.length() > 30) {
                                Toast.makeText(this, getString(R.string.toast_str), Toast.LENGTH_SHORT).show();
                                return;
                            }
                            createBarcode(barContent, BarcodeFormat.CODE_128, 360, 90);
                            mBarcodeFormat = BarcodeFormat.CODE_128;
                            mBarcode1DType = BARCODE_1D_TYPE.CODE128;
                            break;
                        case QR_CODE:
                            createBarcode(barContent, BarcodeFormat.QR_CODE, 200, 200);
                            mBarcodeFormat = BarcodeFormat.QR_CODE;
                            break;
                    }
                    break;
                case R.id.btn_barcode_print:
                    if (TextUtils.isEmpty(mEditBarCon.getText().toString().trim())) {
                        Toast.makeText(this, getString(R.string.toast_density), Toast.LENGTH_SHORT).show();
                        return;
                    }
                    int density = Integer.valueOf(mEditBarCon.getText().toString().trim());
                    if (density > 35 || density < 1) {
                        Toast.makeText(this, getString(R.string.toast_density_outofrange), Toast.LENGTH_SHORT).show();
                        return;
                    }
                    switch (mBarcodeFormat) {
                        case UPC_A:
                        case ITF:
                        case EAN_8:
                        case EAN_13:
                            printBarcode(barContent);
                            break;
                        case CODE_39:
                            if (barContent.length() > 24) {
                                Toast.makeText(this, getString(R.string.toast_str), Toast.LENGTH_SHORT).show();
                                return;
                            }
                            if (!checkBarcodeFormat(barContent, mBarcodeFormat)) {
                                Toast.makeText(this, getString(R.string.toast_barcode_error), Toast.LENGTH_SHORT).show();
                                return;
                            }
                            printBarcode(barContent);
                            break;
                        case CODE_128:
                            if (barContent.length() > 30) {
                                Toast.makeText(this, getString(R.string.toast_str), Toast.LENGTH_SHORT).show();
                                return;
                            }
                            if (!checkBarcodeFormat(barContent, mBarcodeFormat)) {
                                Toast.makeText(this, getString(R.string.toast_barcode_error), Toast.LENGTH_SHORT).show();
                                return;
                            }
                            printBarcode(barContent);
                            break;
                        case QR_CODE:
                            if (bitmap != null) {
                                printQR(barContent);
                            }
                            break;
                    }
                    break;
            }
        } catch (IllegalArgumentException e) {
            Toast.makeText(this, "" + e.getMessage(), Toast.LENGTH_SHORT).show();
        } catch (NullPointerException e) {
        }
    }

    public static boolean isNumeric(String str) {
        String regEx = "^-?[0-9]+$";
        Pattern pat = Pattern.compile(regEx);
        Matcher mat = pat.matcher(str);
        if (mat.find()) {
            return true;
        } else {
            return false;
        }
    }

    /**
     * 检查条码内容是否合规
     * @param barcode
     * @param barcodeFormat
     * @return
     */
    private boolean checkBarcodeFormat(String barcode, BarcodeFormat barcodeFormat) {

        if (barcodeFormat == BarcodeFormat.CODE_128) {
            return (isChinese(barcode) == false);
        }
        if (barcodeFormat == BarcodeFormat.CODE_39) {
            String strReg = "^[0-9A-Z-. *$/%+]{1,24}$";
            return Pattern.matches(strReg, barcode);
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
        for (char c : str.toCharArray()) {
            if (isChinese(c))
                return true;// 有一个中文字符就返回
        }
        return false;
    }

    /**
     * 打印一维条码
     * @param barContent 条码内容
     */
    public void printBarcode(String barContent) {
        if (getsupportprint== 0){
            try {
                printUtil.printStartNumber(number);
                printUtil.printState();
                printUtil.printConcentration(Integer.valueOf(mEditBarCon.getText().toString().trim()));
                printUtil.printAlignment(ALIGN_MODE.ALIGN_CENTER);
                printUtil.printLine(1);
                if (barContent.length() > 12) {
                    printUtil.printBarcode(barContent, mBarcode1DType, 80, 1);
                } else {
                    printUtil.printBarcode(barContent, mBarcode1DType, 80, 2);
                }
                if ("1".equals(mPageType)) {
                    printUtil.printGoToNextMark();
                } else {
                    printUtil.printLine(3);
                }
                printUtil.printEndNumber();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }else {
            newprintUtil.printConcentration(Integer.valueOf(mEditBarCon.getText().toString().trim()));
            newprintUtil.printLine(1);
            if (barContent.length() > 12) {
                newprintUtil.printBarcode( 80,barContent, mBarcode1DType.Get ());
            } else {
                newprintUtil.printBarcode(80,barContent,  mBarcode1DType.Get ());
            }
            if ("1".equals(mPageType)) {
                newprintUtil.printGoToNextMark();
            } else {
                newprintUtil.printLine(6);
                newprintUtil.start();
            }

        }

    }

    /**
     * 打印QR码
     * @param barContent
     */
    public void printQR(String barContent) {
        if (getsupportprint== 0){
            try {
                printUtil.printStartNumber(number);
                printUtil.printState();
                printUtil.printAlignment(ALIGN_MODE.ALIGN_CENTER);
                printUtil.printLine();
                printUtil.printBitmap2(bitmap);
                printUtil.printLine();
                if ("1".equals(mPageType)) {
                    printUtil.printGoToNextMark();
                } else {
                    printUtil.printLine(3);
                }
                printUtil.printEndNumber();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }else {
            newprintUtil.printLine(1);
            newprintUtil.printBitmap(bitmap);
            newprintUtil.printLine(1);
            if ("1".equals(mPageType)) {
                newprintUtil.printGoToNextMark();
            } else {
                newprintUtil.printLine(3);
                newprintUtil.start();
            }

        }

    }

    @Override
    public void onCheckedChanged(RadioGroup radioGroup, int checkedId) {
        switch (checkedId) {
            case R.id.rb_upca:
                barContent = "12345678911";
                txtBarcodeType.setText(getString(R.string.preview) + ": " + getString(R.string.upca));
                txtBarcodeInfo.setText(getString(R.string.upca_prompt));
                etBarcodeContent.setInputType(InputType.TYPE_CLASS_NUMBER);
                etBarcodeContent.setFilters(new InputFilter[]{new InputFilter.LengthFilter(12)});
                etBarcodeContent.setText(barContent);
                etBarcodeContent.setSingleLine(true);
                createBarcode(barContent, BarcodeFormat.UPC_A, 360, 90);
                mBarcodeFormat = BarcodeFormat.UPC_A;
                mBarcode1DType = BARCODE_1D_TYPE.UPCA;
                break;
            case R.id.rb_ean8:
                barContent = "12345670";
                txtBarcodeType.setText(getString(R.string.preview) + ": " + getString(R.string.ean8));
                txtBarcodeInfo.setText(getString(R.string.ean8_prompt));
                etBarcodeContent.setInputType(InputType.TYPE_CLASS_NUMBER);
                etBarcodeContent.setFilters(new InputFilter[]{new InputFilter.LengthFilter(8)});
                etBarcodeContent.setText(barContent);
                etBarcodeContent.setSingleLine(true);
                createBarcode(barContent, BarcodeFormat.EAN_8, 360, 90);
                mBarcodeFormat = BarcodeFormat.EAN_8;
                mBarcode1DType = BARCODE_1D_TYPE.EAN8;
                break;
            case R.id.rb_ean13:
                barContent = "6922266445033";
                txtBarcodeType.setText(getString(R.string.preview) + ": " + getString(R.string.ean13));
                txtBarcodeInfo.setText(getString(R.string.ean13_prompt));
                etBarcodeContent.setInputType(InputType.TYPE_CLASS_NUMBER);
                etBarcodeContent.setFilters(new InputFilter[]{new InputFilter.LengthFilter(13)});
                etBarcodeContent.setText(barContent);
                etBarcodeContent.setSingleLine(true);
                createBarcode(barContent, BarcodeFormat.EAN_13, 360, 90);
                mBarcodeFormat = BarcodeFormat.EAN_13;
                mBarcode1DType = BARCODE_1D_TYPE.EAN13;
                break;
            case R.id.rb_code39:
                barContent = "123456789ABC";
                txtBarcodeType.setText(getString(R.string.preview) + ": " + getString(R.string.code39));
                txtBarcodeInfo.setText(getString(R.string.code39_prompt));
                etBarcodeContent.setInputType(InputType.TYPE_CLASS_TEXT);
                etBarcodeContent.setFilters(new InputFilter[]{new InputFilter.LengthFilter(24)});
                etBarcodeContent.setText(barContent);
                etBarcodeContent.setSingleLine(true);
                createBarcode(barContent, BarcodeFormat.CODE_39, 400, 100);
                mBarcodeFormat = BarcodeFormat.CODE_39;
                mBarcode1DType = BARCODE_1D_TYPE.CODE39;
                break;
            case R.id.rb_itf:
                barContent = "1234567891";
                txtBarcodeType.setText(getString(R.string.preview) + ": " + getString(R.string.itf));
                txtBarcodeInfo.setText(getString(R.string.itf_prompt));
                etBarcodeContent.setInputType(InputType.TYPE_CLASS_NUMBER);
                etBarcodeContent.setFilters(new InputFilter[]{new InputFilter.LengthFilter(24)});
                etBarcodeContent.setText(barContent);
                etBarcodeContent.setSingleLine(true);
                createBarcode(barContent, BarcodeFormat.ITF, 360, 90);
                mBarcodeFormat = BarcodeFormat.ITF;
                mBarcode1DType = BARCODE_1D_TYPE.ITF25;
                break;
            case R.id.rb_code128:
                barContent = "123456789ABC";
                txtBarcodeType.setText(getString(R.string.preview) + ": " + getString(R.string.code128));
                txtBarcodeInfo.setText(getString(R.string.code128_prompt));
                etBarcodeContent.setInputType(InputType.TYPE_CLASS_TEXT);
                etBarcodeContent.setFilters(new InputFilter[]{new InputFilter.LengthFilter(30)});
                etBarcodeContent.setText(barContent);
                etBarcodeContent.setSingleLine(true);
                createBarcode(barContent, BarcodeFormat.CODE_128, 360, 90);
                mBarcodeFormat = BarcodeFormat.CODE_128;
                mBarcode1DType = BARCODE_1D_TYPE.CODE128;
                break;
            case R.id.rb_qr:
                barContent = "123456789ABC";
                txtBarcodeType.setText(getString(R.string.preview) + ": " + getString(R.string.qr));
                txtBarcodeInfo.setText(getString(R.string.qr_prompt));
                etBarcodeContent.setInputType(InputType.TYPE_CLASS_TEXT);
                etBarcodeContent.setFilters(new InputFilter[]{new InputFilter.LengthFilter(300)});
                etBarcodeContent.setText(barContent);
                etBarcodeContent.setSingleLine(false);
                createBarcode(barContent, BarcodeFormat.QR_CODE, 300, 300);
                mBarcodeFormat = BarcodeFormat.QR_CODE;
                break;
        }
    }

    public void createBarcode(String content, BarcodeFormat barcodeFormat, Integer width, Integer height) {
        try {
            String s_gbk = new String(content.getBytes(), "utf-8");
            bitmap = BitmapUtils.encode2dAsBitmap(s_gbk, barcodeFormat, width, height);
            ivBarcode.setImageBitmap(bitmap);
        } catch (UnsupportedEncodingException e) {

        }
    }
}