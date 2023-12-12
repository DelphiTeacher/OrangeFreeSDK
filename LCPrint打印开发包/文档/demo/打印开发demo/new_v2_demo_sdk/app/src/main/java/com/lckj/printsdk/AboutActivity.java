package com.lckj.printsdk;



import android.bld.print.configuration.PrintConfig;
import android.os.Bundle;
import android.text.TextUtils;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;


import com.example.lc_print_sdk.PrintUtil;
import com.lckj.printsdk.utils.CommonUtils;
import com.lckj.printsdk.utils.SPUtils;

import java.text.SimpleDateFormat;

public class AboutActivity extends BaseActivity implements PrintUtil.PrinterBinderListener {

    private PrintUtil printUtil = null;
    private SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMdd");
    EditText mEditCon;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentLayout(R.layout.activity_about);
        setTitle(getString(R.string.app_set_about));//设置标题
        setBackArrow();//设置返回按钮和点击事件

        printUtil =PrintUtil.getInstance (this);
        printUtil.setPrintEventListener (this);
        int getsupportprint=printUtil.getsupportprint ();
        Log.d ("TAG", "onCreate: getsupportprint"+getsupportprint);

        int density=(int) SPUtils.get (AboutActivity.this, "density", 25);


        Button btnPrintCheck = findViewById(R.id.btn_print_check);
        Button btnSetDef = findViewById(R.id.btn_set_def);

        TextView txt_version = findViewById(R.id.txt_version);
        txt_version.setText(CommonUtils.getPackageName(this));

        Button btn_density=findViewById (R.id.btn_density);

        mEditCon=findViewById (R.id.edit_con);
        mEditCon.setText (density+"");

        btn_density.setOnClickListener (new View.OnClickListener () {
            @Override
            public void onClick(View v) {
                if (TextUtils.isEmpty (mEditCon.getText ().toString ().trim ())) {
                    Toast.makeText (AboutActivity.this, getString (R.string.toast_density), Toast.LENGTH_SHORT).show ();
                    canBack=true;
                    return;
                }
                int density=Integer.valueOf (mEditCon.getText ().toString ().trim ());
                if (density > 39 || density < 1) {
                    Toast.makeText (AboutActivity.this, getString (R.string.toast_density_outofrange), Toast.LENGTH_SHORT).show ();
                    canBack=true;
                    return;
                }
                printUtil.printConcentration (density);
                SPUtils.put (AboutActivity.this,"density",density);
                Toast.makeText (AboutActivity.this, "保存成功", Toast.LENGTH_SHORT).show ();
            }
        });


        btnPrintCheck.setOnClickListener(view -> {
            canBack = false;
            try {
                String strVersion = printUtil.getVersion ();
                printUtil.printEnableMark(false);
                printUtil.printText(PrintConfig.Align.ALIGN_LEFT, PrintConfig.FontSize.TOP_FONT_SIZE_LARGE, true, false,"\nSDK Version: " + strVersion + "\n");
                printUtil.printLine(10);
                printUtil.start();
                return;
            } catch (Exception e) {
                e.printStackTrace();
            }
            canBack = true;
        });

        btnSetDef.setOnClickListener(view -> {
            try {
                printUtil.resetPrint ();
                printUtil.setUnwindPaperLen (60);
                mEditCon.setText (25+"");
                showToast(getString(R.string.reset_completed));
            } catch (Exception e) {
                e.printStackTrace();
            }
        });
    }

    @Override
    protected void onDestroy() {
        super.onDestroy();
        if (printUtil!=null){
            printUtil.removePrintListener (this);

        }
    }

    @Override
    public void onPrintCallback(int state) {
        canBack = true;
        if (PrintConfig.IErrorCode.ERROR_NO_ERROR == state) {
            //打印成功
            showToast(getString(R.string.toast_print_success));
        } else if (PrintConfig.IErrorCode.ERROR_PRINT_NOPAPER == state) {
            showToast(getString(R.string.toast_no_paper));
        } else if ( PrintConfig.IErrorCode.ERROR_DATA_INPUT==state ) {
            showToast(getString(R.string.toast_input_parameter_error));
        } else if ( PrintConfig.IErrorCode.ERROR_CMD==state) {
            showToast(getString(R.string.toast_Instruction_error));
        } else if ( PrintConfig.IErrorCode.ERROR_DATA_INVALID==state) {
            showToast(getString(R.string.toast_data_is_invalid));
        } else if ( PrintConfig.IErrorCode.ERROR_DEV_BMARK==state) {
            showToast(getString(R.string.toast_abnormal_black_mark_detection));
        }else if ( PrintConfig.IErrorCode.ERROR_DEV_FEED==state) {
            showToast(getString(R.string.toast_moving_paper));
        }else if ( PrintConfig.IErrorCode.ERROR_DEV_IS_BUSY==state) {
            showToast(getString(R.string.toast_device_busy));
        }else if ( PrintConfig.IErrorCode.ERROR_DEV_NOT_OPEN==state) {
            showToast(getString(R.string.toast_device_is_not_turned_on));
        }else if ( PrintConfig.IErrorCode.ERROR_DEV_NO_BATTERY==state) {
            showToast(getString(R.string.toast_low_electricity));
        }else if ( PrintConfig.IErrorCode.ERROR_DEV_PRINT==state) {
            showToast(getString(R.string.toast_print_now));
        }else if ( PrintConfig.IErrorCode.ERROR_GRAY_INVALID==state) {
            showToast(getString(R.string.toast_illegal_concentrationr));
        }else if ( PrintConfig.IErrorCode.ERROR_NO_DATA==state) {
            showToast(getString (R.string.toast_no_data));
        }else if ( PrintConfig.IErrorCode.ERROR_PRINT_BARCODE==state) {
            showToast(getString(R.string.toast_error_printing_barcode));
        }else if ( PrintConfig.IErrorCode.ERROR_PRINT_BITMAP==state) {
            showToast(getString(R.string.toast_error_printing_bitmap));
        }else if ( PrintConfig.IErrorCode.ERROR_PRINT_BITMAP_WIDTH_OVERFLOW==state) {
            showToast(getString(R.string.toast_print_bitmap_width_overflow));
        }else if ( PrintConfig.IErrorCode.ERROR_PRINT_DATA_MAC==state) {
            showToast(getString(R.string.toast_mac_check_error));
        }else if ( PrintConfig.IErrorCode.ERROR_PRINT_HOT==state) {
            showToast(getString (R.string.toast_high_temperature));
        }else if ( PrintConfig.IErrorCode.ERROR_PRINT_ILLEGAL_ARGUMENT==state) {
            showToast(getString(R.string.toast_parameter_error));
        }else if ( PrintConfig.IErrorCode.ERROR_PRINT_QRCODE==state) {
            showToast(getString(R.string.toast_error_printing_qrcode));
        }else if ( PrintConfig.IErrorCode.ERROR_PRINT_TEXT==state) {
            showToast(getString(R.string.toast_print_text_error));
        }else if ( PrintConfig.IErrorCode.ERROR_PRINT_UNKNOWN==state) {
            showToast(getString(R.string.toast_unknown_error));
        }else if ( PrintConfig.IErrorCode.ERROR_RESULT_EXIST==state) {
            showToast(getString(R.string.toast_result_already_exists));
        }else if ( PrintConfig.IErrorCode.ERROR_TIME_OUT==state) {
            showToast(getString(R.string.toast_overtime));
        }else {
            showToast("Printer error. state=" + state);
        }
    }

    @Override
    public void onVersion(String s) {

    }

    private boolean canBack = true;
    @Override
    protected boolean titleCanBack() {
        return canBack;
    }
    @Override
    public void onBackPressed() {
        if (!canBack){
            return;
        }
        super.onBackPressed ();
    }

}
