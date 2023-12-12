package com.lckj.printsdk.label_ui;


import android.content.Intent;
import android.os.Bundle;
import android.text.TextUtils;
import android.util.Log;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;


import com.example.lc_print_sdk.PrintConfig;
import com.example.lc_print_sdk.PrintUtil;
import com.lckj.printsdk.BaseActivity;
import com.lckj.printsdk.R;


public class LabelTemplateActivity extends BaseActivity implements PrintUtil.PrinterBinderListener {

 
    private String mPageType;
    private EditText mEditCon, mEditDistance;
    private EditText edit_return;
    PrintUtil printUtil;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
     
        setContentLayout (R.layout.activity_label_template);
        setTitle(getString(R.string.btn_label_TXT4));//设置标题
        setBackArrow ();//设置返回按钮和点击事件

        Intent intent = getIntent();
        mPageType = intent.getStringExtra("TYPE");


        printUtil=PrintUtil.getInstance (LabelTemplateActivity.this);
        printUtil.setPrintEventListener (this);
        printUtil.setLineSpacing (1);


        mEditCon = findViewById(R.id.edit_con);
        mEditDistance = findViewById(R.id.edit_distance);
        Button mBtnTemplatePrint = findViewById(R.id.btn_template_print);
        edit_return=findViewById (R.id.edit_return);

        int unwindPaperLen=printUtil.getUnwindPaperLen ();
        edit_return.setText (unwindPaperLen+"");
        mBtnTemplatePrint.setOnClickListener(view -> {
            canBack = false;
            if (TextUtils.isEmpty(mEditCon.getText().toString().trim())) {
                Toast.makeText(LabelTemplateActivity.this, getString(R.string.toast_density), Toast.LENGTH_SHORT).show();
                canBack = true;
                return;
            }
            int concentration = Integer.valueOf(mEditCon.getText().toString().trim());
            if( concentration > 39 || concentration < 1){
                Toast.makeText(this, getString(R.string.toast_density_outofrange), Toast.LENGTH_SHORT).show();
                canBack = true;
                return;
            }
            if (mEditDistance.getText().toString().trim().length() == 0) {
                Toast.makeText(this, getString(R.string.toast_distance_invalid), Toast.LENGTH_SHORT).show();
                canBack = true;
                return;
            }
            int distance = Integer.valueOf(mEditDistance.getText().toString().trim());
            if (distance <= 0) {
                Toast.makeText(this, getString(R.string.toast_distance_invalid), Toast.LENGTH_SHORT).show();
                canBack = true;
                return;
            }
            if (edit_return.getText().toString().trim().length() == 0) {
                Toast.makeText(this, getString(R.string.toast_rerurn_distance_invalid), Toast.LENGTH_SHORT).show();
                canBack = true;
                return;
            }
            int return_distance = Integer.valueOf(edit_return.getText().toString().trim());
            if (return_distance <= 0) {
                Toast.makeText(this, getString(R.string.toast_rerurn_distance_invalid), Toast.LENGTH_SHORT).show();
                canBack = true;
                return;
            }

            printUtil.setUnwindPaperLen (return_distance);
            printLabel(concentration, distance);
        });

    }

    @Override
    protected boolean titleCanBack() {
        return canBack;
    }

    @Override
    protected void onDestroy() {
        super.onDestroy();

    }

    public void printLabel(int concentration, int distance) {
        try {
            printUtil.printEnableMark (true);
            printUtil.printLine (2);
            printUtil.printText (PrintConfig.Align.ALIGN_LEFT, PrintConfig.FontSize.TOP_FONT_SIZE_MIDDLE, false, false,getString(R.string.Label_test1) + "1\n");
            printUtil.printText (PrintConfig.Align.ALIGN_LEFT, PrintConfig.FontSize.TOP_FONT_SIZE_MIDDLE, false, false,getString(R.string.Label_test2) + "2\n");
            printUtil.printText (PrintConfig.Align.ALIGN_LEFT, PrintConfig.FontSize.TOP_FONT_SIZE_MIDDLE, false, true,getString(R.string.Label_test3) + "3\n");
            printUtil.printGoToNextMark (distance);
        } catch (Exception e) {
            canBack = true;
            e.printStackTrace();
        }
    }

    @Override
    public void onPrintCallback(int state) {
        Log.e ("testtest", "  state:"+state);
        canBack = true;

    }

    @Override
    public void onVersion(String s) {

    }


    private boolean canBack = true;

    @Override
    public void onBackPressed() {
        if (!canBack){
            return;
        }
        super.onBackPressed ();
    }

}