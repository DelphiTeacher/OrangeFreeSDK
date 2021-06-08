package com.supoin.scantest_jar;

import android.annotation.SuppressLint;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.view.KeyEvent;
import android.view.MotionEvent;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.CompoundButton;
import android.widget.EditText;
import android.widget.ListView;
import android.widget.Switch;

import com.android.scanner.impl.ReaderManager;

import static com.supoin.scantest_jar.broadcast.SystemBroadCast.SCN_CUST_ACTION_SCODE;
import static com.supoin.scantest_jar.broadcast.SystemBroadCast.SCN_CUST_EX_SCODE;

public class MainActivity extends AppCompatActivity {

    private Button btnScan;
    private Button btnClear;
    private EditText etScan;
    private ListView scanList;
    private ArrayAdapter<Object> arrayAdapter;
    private ReaderManager readerManager;
    private boolean isActive;
    private Switch powerSwitch;
    private int outPutMode;
    private int endCharMode;
    private boolean enableScankey;
    private Switch pauseSwitch;
    static boolean isScan = true;

    @SuppressLint("ClickableViewAccessibility")
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        initView();
        Log.d("ScanTest", "-------ScannerService----------onCreate");
        // Register receiver
        IntentFilter intentFilter = new IntentFilter(SCN_CUST_ACTION_SCODE);
        registerReceiver(scanDataReceiver, intentFilter);

        // Initialize the array adapter for the conversation thread
        arrayAdapter = new ArrayAdapter<>(this, R.layout.message);
        scanList.setAdapter(arrayAdapter);
        //readerManager getInstance
        readerManager = ReaderManager.getInstance();
        Log.d("ScanTest", "-------ScannerService----------onCreate----enableScankey-------" + readerManager);
        //Initialize scanner configuration
        initScanner();

        btnScan.setOnTouchListener(new View.OnTouchListener() {
            @Override
            public boolean onTouch(View v, MotionEvent event) {
                if (event.getAction() == MotionEvent.ACTION_DOWN){
                    if (outPutMode != 2) {
                        readerManager.setOutPutMode(2);
                        Log.d("btnScan", "-------ScannerService-----------------setOutPutMode(2)--------");
                    }
                    readerManager.beginScanAndDeocde();
                }else if (event.getAction() == MotionEvent.ACTION_UP){
                    try {
                        Thread.sleep(150);
                    } catch (InterruptedException e) {
                        e.printStackTrace();
                    }
                    readerManager.stopScanAndDecode();
                }
                return false;
            }
        });
        btnClear.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                arrayAdapter.clear();
                etScan.setText("");
            }
        });

    }


    @Override
    protected void onPause() {
        super.onPause();
    }


    private void initScanner() {
        //1.Check whether turn on scan engine
        // Return value
        // false : scan and decode is disable, not work
        //true: scan and decode is enable
        isActive = readerManager.GetActive();
        if (!isActive) {
            readerManager.SetActive(true);
            powerSwitch.setChecked(true);
        }

        //2.The physical scanning key work or not
        // Return value isOn
        //true Scan key can to start scan
        //false Scan key can not to start scan
        enableScankey = readerManager.isEnableScankey();
        Log.d("ScanTest", "-------ScannerService----------enableScankey---" + enableScankey);
        if (!enableScankey) {
            readerManager.setEnableScankey(true);
            pauseSwitch.setChecked(true);
            Log.d("ScanTest", "-------ScannerService----------isEnableScankey---" + readerManager.isEnableScankey());
        }

        //3.Get current data output mode:0 means Copy and Paste,1 means Key Emulation，2 means API.
        outPutMode = readerManager.getOutPutMode();
        //If the mode is not API, please configure it as mode API，and restore to original mode when destroying activity.
        if (outPutMode != 2) {
            readerManager.setOutPutMode(2);
        }
        //4. Set up End character:
        // 0 the end of code add "\n"
        //1 the end of code add " "
        //2 the end of code add "\t"
        //3 NULL
        if (endCharMode != 3) {
            //null, no character
            readerManager.setEndCharMode(3);
        }
    }

    private void initView() {
        btnScan = findViewById(R.id.btn_scan);
        btnClear = findViewById(R.id.btn_clear);
        etScan = findViewById(R.id.et_scan);
        scanList = findViewById(R.id.scanList);
        powerSwitch = findViewById(R.id.powerSwitch);
        pauseSwitch = findViewById(R.id.pauseSwitch);
        //Turn on scan engine
        powerSwitch.setOnCheckedChangeListener(new CompoundButton.OnCheckedChangeListener() {
            @Override
            public void onCheckedChanged(CompoundButton buttonView, boolean isChecked) {
                boolean powerSwitchChecked = powerSwitch.isChecked();
                if (powerSwitchChecked) {
                    readerManager.SetActive(true);
                } else {
                    readerManager.SetActive(false);
                }
            }
        });

        //Configure whether the physical scanning key work
        pauseSwitch.setOnCheckedChangeListener(new CompoundButton.OnCheckedChangeListener() {
            @Override
            public void onCheckedChanged(CompoundButton buttonView, boolean isChecked) {
                final boolean powerSwitchChecked = pauseSwitch.isChecked();
                if (powerSwitchChecked) {
                    readerManager.setEnableScankey(true);
                    Log.d("ScanTest", "-------ScannerService----------enableScankey--true---" + readerManager.isEnableScankey());
                } else {
                    readerManager.setEnableScankey(false);
                    Log.d("ScanTest", "-------ScannerService----------enableScankey---false---" + readerManager.isEnableScankey());
                }
            }
        });
    }

    //The broadcast about transmit scanning data information
    private BroadcastReceiver scanDataReceiver = new BroadcastReceiver() {
        @Override
        public void onReceive(Context context, Intent intent) {
            if (intent.getAction().equals(SCN_CUST_ACTION_SCODE)) {
                try {
                    String message = "";
                    message = intent.getStringExtra();
                    Log.d("ScanTest", "-------ScannerService----------message = " + message);
                    arrayAdapter.add(message);
                    readerManager.stopScanAndDecode();
                    isScan = true;
                } catch (Exception e) {
                    e.printStackTrace();
                    Log.e("ScannerService", e.toString());
                }
            }
        }
    };


    @Override
    protected void onRestart() {
        super.onRestart();
    }

    @Override
    protected void onResume() {
        super.onResume();
        //Initialize scanner's configurations
        initScanner();
    }

    @Override
    protected void onDestroy() {
        super.onDestroy();
        Log.d("ScanTest", "-------ScannerService----------onDestroy");
        //Release resource
        readerManager.Release();
        readerManager = null;
    }

    @Override
    public boolean onKeyDown(int keyCode, KeyEvent event) {
        if (keyCode == KeyEvent.KEYCODE_BACK && event.getRepeatCount() == 0) {
            Log.d("ScanTest", "-------ScannerService--------------onKeyDown----back======");
            //Cancel register boardcast
            unregisterReceiver(scanDataReceiver);
            //
            readerManager.setOutPutMode(outPutMode);
            readerManager.setEndCharMode(endCharMode);//Set up the mode as system configured mode
            readerManager.setEnableScankey(enableScankey); //Whether forbid physical scanning key.
            readerManager.SetActive(isActive);  //Restore to system configured state of scan engine.

        }
        return super.onKeyDown(keyCode, event);
    }

}
