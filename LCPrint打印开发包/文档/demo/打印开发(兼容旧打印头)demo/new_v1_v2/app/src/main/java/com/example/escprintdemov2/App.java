package com.example.escprintdemov2;

import android.app.Application;
import android.content.Context;
import android.text.TextUtils;
import android.util.Log;
import android.widget.Toast;

import com.example.escprintdemov2.utils.LoadProgressDialog;
import com.example.escprintdemov2.utils.SPUtils;
import com.example.lc_print_sdk.PrintUtil;

import com.example.print_sdk.interfaces.OnPrintEventListener;

/**
 * Created by moxiaomo
 * on 2021/2/26
 */
public class App extends Application {


    private Context mContext;
    public static int number=1000000001; // 初始化票据流水号 Initial bill serial number
    private static com.example.print_sdk.PrintUtil pUtil;
    private static LoadProgressDialog loadProgressDialog;
    private static com.example.lc_print_sdk.PrintUtil newprintUtil;

    @Override
    public void onCreate() {
        super.onCreate ();
        mContext=getApplicationContext ();
        try {
            int getsupportprint=PrintUtil.getsupportprint ();
            if (getsupportprint == 1) {
                newprintUtil=PrintUtil.getInstance (this);
                newprintUtil.setUnwindPaperLen (60);
                Log.d ("TAG", "onCreate:getsupportprint " + getsupportprint);
                SPUtils.put (getApplicationContext (), "getsupportprint", getsupportprint);
                newprintUtil.setPrintEventListener (new PrintUtil.PrinterBinderListener () {
                    @Override
                    public void onPrintCallback(int i) {
                        Log.e ("TAG", "onPrintStatus: " + i);
                        switch (i) {
                            case 0:
                                if (loadProgressDialog != null) {
                                    if (loadProgressDialog.isShowing ()) {
                                        loadProgressDialog.cancel ();
                                    }
                                }
                                Toast.makeText (mContext, getString (R.string.toast_print_success), Toast.LENGTH_SHORT).show ();
                                break;
                            case 1:
                            case 3:
                                Toast.makeText (mContext, getString (R.string.toast_no_paper), Toast.LENGTH_SHORT).show ();
                                break;
                            case 2:
                                Toast.makeText (mContext, getString (R.string.toast_print_error), Toast.LENGTH_SHORT).show ();
                                break;
                        }
                    }

                    @Override
                    public void onVersion(String s) {

                    }
                });
            } else {
                pUtil=com.example.print_sdk.PrintUtil.getInstance ();
                pUtil.printEnableCertificate (true);
                pUtil.printEnableMark (true);
                pUtil.printAutoEnableMark (false);
                pUtil.printLanguage (15);
                pUtil.printEncode (3);
                pUtil.setPrintDefLineSpacing ();
                SPUtils.put (getApplicationContext (), "getsupportprint", 0);
                pUtil.setPrintEventListener (new OnPrintEventListener () {
                    @Override
                    public void onPrintStatus(int state) {
                        Log.e ("TAG", "onPrintStatus: " + state);
                        switch (state) {
                            case 0:
                                if (loadProgressDialog != null) {
                                    if (loadProgressDialog.isShowing ()) {
                                        loadProgressDialog.cancel ();
                                    }
                                }
                                number+=1; // 流水号自加1 Serial number plus 1
                                Toast.makeText (mContext, getString (R.string.toast_print_success), Toast.LENGTH_SHORT).show ();
                                break;
                            case 1:
                            case 3:
                                Toast.makeText (mContext, getString (R.string.toast_no_paper), Toast.LENGTH_SHORT).show ();
                                break;
                            case 2:
                                Toast.makeText (mContext, getString (R.string.toast_print_error), Toast.LENGTH_SHORT).show ();
                                break;
                        }
                    }

                    @Override
                    public void onVersion(String version) {


                    }

                    @Override
                    public void onTemperature(String str) {
                    }
                });
            }


        } catch (Exception e) {
            Log.d ("TAG", "onCreate: " + e.getMessage ());


        }


    }


    public static com.example.print_sdk.PrintUtil getPrint() {
        return pUtil;
    }

    public static com.example.lc_print_sdk.PrintUtil getnewPrint() {
        return newprintUtil;
    }

    public static LoadProgressDialog getLoadProgressDialog(Context context) {
        loadProgressDialog=new LoadProgressDialog (context, "打印中……");
        return loadProgressDialog;
    }

}