package com.allinpay.calmonpos;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Spinner;
import android.widget.Toast;
import android.widget.ToggleButton;

import com.allinpay.manager.service.SerialPortHelper;
import com.allinpay.manager.util.Manager_PropertiesUtil;

import android_serialport_api.SerialPortFinder;



public class SettingsActivity extends Activity {

    EditText appname, papers, timeout, printPath;
    ToggleButton toggleButtonCOM;
    Spinner SpinnerCOM, SpinnerBaudRate;
    Button setup, exit;
    SerialPortFinder mSerialPortFinder;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_settings);

        setControls();
    }

    private void setControls() {

        appname = (EditText) findViewById(R.id.appname);
        papers = (EditText) findViewById(R.id.papers);
        timeout = (EditText) findViewById(R.id.timeout);
        printPath = (EditText) findViewById(R.id.printPath);

        SpinnerCOM = (Spinner) findViewById(R.id.SpinnerCOM);
        SpinnerBaudRate = (Spinner) findViewById(R.id.SpinnerBaudRate);

        toggleButtonCOM = (ToggleButton) findViewById(R.id.ButtonCOM);

        setup = (Button) findViewById(R.id.setup);
        exit = (Button) findViewById(R.id.exit);

        //串口
        mSerialPortFinder = new SerialPortFinder();
        String[] entryValues = mSerialPortFinder.getAllDevicesPath();
        List<String> allDevices = new ArrayList<String>();
        for (int i = 0; i < entryValues.length; i++) {
            allDevices.add(entryValues[i]);
        }
        ArrayAdapter<String> aspnDevices = new ArrayAdapter<String>(this,
                android.R.layout.simple_spinner_item, allDevices);
        aspnDevices.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
        SpinnerCOM.setAdapter(aspnDevices);

        //串口速率
        ArrayAdapter<CharSequence> adapter = ArrayAdapter.createFromResource(this,
                R.array.baudrates_value, android.R.layout.simple_spinner_item);
        adapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
        SpinnerBaudRate.setAdapter(adapter);
        SpinnerBaudRate.setSelection(12);


        //初始化控件设值
        appname.setText("MIS");
        papers.setText("2");
        timeout.setText("60");
        printPath.setText("/ALLINPAY/Print.txt");

        setup.setOnClickListener(new ButtonClickEvent());
        exit.setOnClickListener(new ButtonClickEvent());
        toggleButtonCOM.setOnClickListener(new ToggleButtonCheckedChangeEvent());
    }

    private Map<String, String> buildMapData() {
        Map<String, String> map = new HashMap<String, String>();

        map.put("appname", appname.getText().toString());
        map.put("papers", papers.getText().toString());
        map.put("timeout", timeout.getText().toString());
        map.put("printpath", printPath.getText().toString());
        map.put("comport", SpinnerCOM.getSelectedItem().toString());
        map.put("commrate", SpinnerBaudRate.getSelectedItem().toString());
        return map;
    }


    class ButtonClickEvent implements View.OnClickListener {
        public void onClick(View v) {
            switch (v.getId()) {
                case R.id.setup: {
                    Map<String, String> map = buildMapData();
                    Manager_PropertiesUtil.storeProperties(map);
                    Toast.makeText(getApplicationContext(), "设置完成", Toast.LENGTH_SHORT).show();

                    break;
                }


                case R.id.exit: {
                    Intent mIntent = new Intent();
                    mIntent.setClass(getApplicationContext(), MainActivity.class);
                    mIntent.setFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP);
                    //发出退出程序指示
                    mIntent.putExtra("flag", 0x0001);
                    startActivity(mIntent);
                    break;
                }

                default:
                    break;
            }
        }
    }

    //串口打开关闭
    class ToggleButtonCheckedChangeEvent implements ToggleButton.OnClickListener {

        @Override
        public void onClick(View view) {

            //串口通讯类实例化
            SerialPortHelper sph = SerialPortHelper.getInstance();
            //设置串口节点名称、波特率
            sph.setiBaudRate(Integer.parseInt(SpinnerBaudRate.getSelectedItem().toString()));
            sph.setsPort(SpinnerCOM.getSelectedItem().toString());

            if (toggleButtonCOM.isChecked()) {
                //建立连接
                sph.connect();

                if (sph.isOpen()) {
                    toggleButtonCOM.setChecked(true);
                    Toast.makeText(SettingsActivity.this, "Open Com Succeed!", Toast.LENGTH_SHORT).show();
                    sph.disConnect();
                } else {
                    toggleButtonCOM.setChecked(false);
                    Toast.makeText(SettingsActivity.this, "Open Failed:permission denied to write!", Toast.LENGTH_SHORT).show();
                }

            } else {
                sph.disConnect();
                toggleButtonCOM.setChecked(false);
            }
        }
    }
}
