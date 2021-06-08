package com.allinpay.calmonpos;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.EditText;
import android.widget.Toast;


import com.allinpay.aipmis.allinpay.model.RequestData;
import com.allinpay.aipmis.allinpay.model.ResponseData;
import com.allinpay.aipmis.allinpay.service.MisPos;
import com.allinpay.manager.listener.IMessageListener;
import com.allinpay.manager.model.MessageBean;

public class MainActivity extends Activity implements OnClickListener {

    //输入
    EditText amount, traceNo, referenceNo, transDate;
    //输出
    EditText tips, total, balanceAmount, posTraceNumber, expireDate, batchNumber,
            merchantNumber, merchantName, terminalNumber, authNumber, rejCode, issNumber,
            issName, cardNumber, transTime, memo, transId, orderNumber, rejCodeExplain, oldTraceNumber, hostSerialNumber, TransDate;
    //返回结果
    private ResponseData response;

    //消息处理
    private Handler handler = new Handler() {
        public void handleMessage(Message msg) {
            Toast.makeText(getApplicationContext(), msg.obj + "", Toast.LENGTH_SHORT).show();
        }

        ;
    };

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_calmonpos_main);
        init();

    }

    //初始化操作
    private void init() {
        //输入
        amount = (EditText) findViewById(R.id.amount);
        traceNo = (EditText) findViewById(R.id.oldTraceNumber);
        referenceNo = (EditText) findViewById(R.id.hostSerialNumber);
        transDate = (EditText) findViewById(R.id.transDate);

        //输出
        tips = (EditText) findViewById(R.id.tips);
        total = (EditText) findViewById(R.id.total);
        balanceAmount = (EditText) findViewById(R.id.balanceAmount);
        posTraceNumber = (EditText) findViewById(R.id.posTraceNumber);
        expireDate = (EditText) findViewById(R.id.expireDate);
        batchNumber = (EditText) findViewById(R.id.batchNumber);
        merchantNumber = (EditText) findViewById(R.id.merchantNumber);
        merchantName = (EditText) findViewById(R.id.merchantName);
        terminalNumber = (EditText) findViewById(R.id.terminalNumber);
        authNumber = (EditText) findViewById(R.id.authNumber);
        rejCode = (EditText) findViewById(R.id.rejCode);
        issNumber = (EditText) findViewById(R.id.issNumber);
        issName = (EditText) findViewById(R.id.issName);
        cardNumber = (EditText) findViewById(R.id.cardNumber);
        transTime = (EditText) findViewById(R.id.transTime);
        memo = (EditText) findViewById(R.id.memo);
        transId = (EditText) findViewById(R.id.transId);
        orderNumber = (EditText) findViewById(R.id.orderNumber);
        rejCodeExplain = (EditText) findViewById(R.id.rejCodeExplain);
        hostSerialNumber = (EditText) findViewById(R.id.hostSerialNumber);
        oldTraceNumber = (EditText) findViewById(R.id.oldTraceNumber);
        transDate = (EditText) findViewById(R.id.transDate);

        //注册事件
        this.findViewById(R.id.register).setOnClickListener(this);
        this.findViewById(R.id.consume).setOnClickListener(this);
        this.findViewById(R.id.cancel).setOnClickListener(this);
        this.findViewById(R.id.reject).setOnClickListener(this);
        this.findViewById(R.id.rePrint).setOnClickListener(this);
        this.findViewById(R.id.settle).setOnClickListener(this);

        this.findViewById(R.id.scan_pay).setOnClickListener(this);
        this.findViewById(R.id.scan_void).setOnClickListener(this);
        this.findViewById(R.id.scan_refund).setOnClickListener(this);
        this.findViewById(R.id.scan_inquiry).setOnClickListener(this);

        this.findViewById(R.id.scanOrder).setOnClickListener(this);
        this.findViewById(R.id.scanorderQuery).setOnClickListener(this);
        this.findViewById(R.id.orderQuery).setOnClickListener(this);
        this.findViewById(R.id.onlineInit).setOnClickListener(this);

        this.findViewById(R.id.bankAuth).setOnClickListener(this);
        this.findViewById(R.id.bankAuthCm).setOnClickListener(this);
        this.findViewById(R.id.bankAuthVoid).setOnClickListener(this);
        this.findViewById(R.id.bankOrder).setOnClickListener(this);

        //设置参数
        this.findViewById(R.id.setup).setOnClickListener(this);
        this.findViewById(R.id.btn_clear).setOnClickListener(this);


    }

    //点击事件
    @Override
    public void onClick(View view) {


        switch (view.getId()) {
            //签到
            case R.id.register: {
                resetControls();
                MisPos compos = new MisPos(this);
                //设置自定义监听器（可省略，使用系统默认监听器）
                compos.setOnMessageListener((IMessageListener) new MessageListenerImpl());
                RequestData reqData = buildRequestData();
                reqData.PutValue("TransType", "1");
                response = new ResponseData();
                compos.TransProcess(reqData, response);
                handleResponseData();
                break;
            }
            //消费
            case R.id.consume: {
//				resetControls();
                MisPos compos = new MisPos(this);
                compos.setOnMessageListener(new MessageListenerImpl());
                RequestData reqData = buildRequestData();
                reqData.PutValue("TransType", "2");
                response = new ResponseData();
                compos.TransProcess(reqData, response);
                handleResponseData();
                break;
            }
            //撤销
            case R.id.cancel: {
//				resetControls();
                MisPos compos = new MisPos(this);
                compos.setOnMessageListener(new MessageListenerImpl());
                RequestData reqData = buildRequestData();
                reqData.PutValue("TransType", "3");
                response = new ResponseData();
                compos.TransProcess(reqData, response);
                handleResponseData();
                break;
            }
            //退款
            case R.id.reject: {
//				resetControls();
                MisPos compos = new MisPos(this);
                compos.setOnMessageListener(new MessageListenerImpl());
                RequestData reqData = buildRequestData();
                reqData.PutValue("TransType", "4");
                response = new ResponseData();
                compos.TransProcess(reqData, response);

                handleResponseData();
                break;
            }
            //银行卡订单支付
            case R.id.bankOrder: {
//				resetControls();
                MisPos compos = new MisPos(this);
                compos.setOnMessageListener(new MessageListenerImpl());
                RequestData reqData = buildRequestData();
                reqData.PutValue("TransType", "23");
                reqData.PutValue("OrderNumber", orderNumber.getText().toString().trim());
                response = new ResponseData();
                compos.TransProcess(reqData, response);

                handleResponseData();
                break;
            }
            //扫码订单支付
            case R.id.scanOrder: {
//				resetControls();
                MisPos compos = new MisPos(this);
                compos.setOnMessageListener(new MessageListenerImpl());
                RequestData reqData = buildRequestData();
                reqData.PutValue("CardType", "100");
                reqData.PutValue("TransType", "5");
                reqData.PutValue("CardNumber", cardNumber.getText().toString().trim());
                reqData.PutValue("OrderNumber", orderNumber.getText().toString().trim());
                response = new ResponseData();
                compos.TransProcess(reqData, response);

                handleResponseData();
                break;
            }
            //银行卡预授权
            case R.id.bankAuth: {
//				resetControls();
                MisPos compos = new MisPos(this);
                compos.setOnMessageListener(new MessageListenerImpl());
                RequestData reqData = buildRequestData();
                reqData.PutValue("TransType", "6");
                response = new ResponseData();
                compos.TransProcess(reqData, response);

                handleResponseData();
                break;
            }
            //银行卡预授权撤销
            case R.id.bankAuthVoid: {
//				resetControls();
                MisPos compos = new MisPos(this);
                compos.setOnMessageListener(new MessageListenerImpl());
                RequestData reqData = buildRequestData();
                reqData.PutValue("TransType", "7");
                reqData.PutValue("AuthNumber", authNumber.getText().toString().trim());
                reqData.PutValue("TransDate", transDate.getText().toString().trim());
                response = new ResponseData();
                compos.TransProcess(reqData, response);

                handleResponseData();
                break;
            }
            //银行卡预授权完成
            case R.id.bankAuthCm: {
//				resetControls();
                MisPos compos = new MisPos(this);
                compos.setOnMessageListener(new MessageListenerImpl());
                RequestData reqData = buildRequestData();
                reqData.PutValue("TransType", "8");
                reqData.PutValue("AuthNumber", authNumber.getText().toString().trim());
                reqData.PutValue("TransDate", transDate.getText().toString().trim());
                response = new ResponseData();
                compos.TransProcess(reqData, response);

                handleResponseData();
                break;
            }
            //联机初始化
            case R.id.onlineInit: {
                resetControls();
                MisPos compos = new MisPos(this);
                compos.setOnMessageListener(new MessageListenerImpl());
                RequestData reqData = buildRequestData();
                reqData.PutValue("TransType", "48");
                response = new ResponseData();
                compos.TransProcess(reqData, response);

                handleResponseData();
                break;
            }
            //银行卡订单支付结果查询
            case R.id.orderQuery: {
//				resetControls();
                MisPos compos = new MisPos(this);
                compos.setOnMessageListener(new MessageListenerImpl());
                RequestData reqData = buildRequestData();
                reqData.PutValue("TransType", "55");
                reqData.PutValue("OrderNumber", orderNumber.getText().toString().trim());
                response = new ResponseData();
                compos.TransProcess(reqData, response);
                handleResponseData();
                break;
            }
            //扫码订单支付结果查询
            case R.id.scanorderQuery: {
//				resetControls();
                MisPos compos = new MisPos(this);
                compos.setOnMessageListener(new MessageListenerImpl());
                RequestData reqData = buildRequestData();
                reqData.PutValue("CardType", "100");
                reqData.PutValue("TransType", "12");
                reqData.PutValue("OrderNumber", orderNumber.getText().toString().trim());
                response = new ResponseData();
                compos.TransProcess(reqData, response);
                handleResponseData();
                break;
            }
            //结算
            case R.id.settle: {
                resetControls();
                MisPos compos = new MisPos(this);
                compos.setOnMessageListener(new MessageListenerImpl());
                RequestData reqData = buildRequestData();
                reqData.PutValue("TransType", "14");
                response = new ResponseData();
                compos.TransProcess(reqData, response);
                handleResponseData();
                break;
            }
            //重打印
            case R.id.rePrint: {
                resetControls();
                MisPos compos = new MisPos(this);
                compos.setOnMessageListener(new MessageListenerImpl());
                RequestData reqData = buildRequestData();
                reqData.PutValue("TransType", "16");
                response = new ResponseData();
                compos.TransProcess(reqData, response);
                handleResponseData();
                break;
            }
            //扫码支付
            case R.id.scan_pay: {
                MisPos compos = new MisPos(this);
                compos.setOnMessageListener(new MessageListenerImpl());
                RequestData reqData = new RequestData();
                reqData.PutValue("CardType", "100");
                reqData.PutValue("TransType", "2");
                reqData.PutValue("Amount", amount.getText().toString());
                reqData.PutValue("CardNumber", cardNumber.getText().toString());
                response = new ResponseData();
                compos.TransProcess(reqData, response);

                handleResponseData();
                break;
            }
            //扫码撤销
            case R.id.scan_void: {
                MisPos compos = new MisPos(this);
                compos.setOnMessageListener(new MessageListenerImpl());
                RequestData reqData = new RequestData();
                reqData.PutValue("CardType", "100");
                reqData.PutValue("TransType", "3");
                reqData.PutValue("Amount", amount.getText().toString());
                reqData.PutValue("TransId", transId.getText().toString());
                reqData.PutValue("OldTraceNumber", traceNo.getText().toString());
                response = new ResponseData();
                compos.TransProcess(reqData, response);

                handleResponseData();
                break;
            }
            //扫码退货
            case R.id.scan_refund: {
                MisPos compos = new MisPos(this);
                compos.setOnMessageListener(new MessageListenerImpl());
                RequestData reqData = new RequestData();
                reqData.PutValue("CardType", "100");
                reqData.PutValue("TransType", "4");
                reqData.PutValue("Amount", amount.getText().toString());
                reqData.PutValue("HostSerialNumber", referenceNo.getText().toString());
                reqData.PutValue("TransDate", transDate.getText().toString());
                reqData.PutValue("TransId", transId.getText().toString());
                response = new ResponseData();
                compos.TransProcess(reqData, response);
                handleResponseData();
                break;
            }
            //扫码末笔查询
            case R.id.scan_inquiry: {
                MisPos compos = new MisPos(this);
                compos.setOnMessageListener(new MessageListenerImpl());
                RequestData reqData = new RequestData();
                reqData.PutValue("CardType", "100");
                reqData.PutValue("TransType", "50");
                response = new ResponseData();
                compos.TransProcess(reqData, response);
                handleResponseData();
                break;
            }
            //设置参数
            case R.id.setup: {
                Intent intent = new Intent();
                intent.setClass(MainActivity.this, SettingsActivity.class);
                startActivity(intent);
                break;
            }
            //清空测试界面，便于测试
            case R.id.btn_clear: {
                clearView();
                break;
            }

            default:
                break;
        }

    }

    //初始化requestData
    private RequestData buildRequestData() {
        RequestData reqData = new RequestData();
        reqData.PutValue("CardType", "01");
//		reqData.PutValue("appname", "DEBUG");
        reqData.PutValue("Amount", amount.getText().toString());
        reqData.PutValue("OldTraceNumber", traceNo.getText().toString());
        reqData.PutValue("HostSerialNumber", referenceNo.getText().toString());
        //日期输入格式MMDD如1227
        reqData.PutValue("TransDate", transDate.getText().toString());
        return reqData;
    }

    //初期化控件设置为空值
    private void resetControls() {
        tips.setText("");
        total.setText("");
        balanceAmount.setText("");
        posTraceNumber.setText("");
        expireDate.setText("");

        batchNumber.setText("");
        merchantNumber.setText("");
        merchantName.setText("");
        terminalNumber.setText("");
        authNumber.setText("");

        rejCode.setText("");
        issNumber.setText("");
        issName.setText("");
        cardNumber.setText("");
        transTime.setText("");
        memo.setText("");

    }

    //初期化控件设置为空值
    private void clearView() {
        tips.setText("");
        total.setText("");
        balanceAmount.setText("");
        posTraceNumber.setText("");
        expireDate.setText("");

        batchNumber.setText("");
        merchantNumber.setText("");
        merchantName.setText("");
        terminalNumber.setText("");
        authNumber.setText("");

        rejCode.setText("");
        rejCodeExplain.setText("");
        hostSerialNumber.setText("");
        oldTraceNumber.setText("");
        orderNumber.setText("");
        transId.setText("");
        transDate.setText("");
        issNumber.setText("");
        issName.setText("");
        cardNumber.setText("");
        transTime.setText("");
        memo.setText("");

    }

    //处理response
    private void handleResponseData() {
        tips.setText(response.GetValue("Tips"));
        total.setText(response.GetValue("Total"));
        balanceAmount.setText(response.GetValue("BalanceAmount"));
        posTraceNumber.setText(response.GetValue("PosTraceNumber"));
        expireDate.setText(response.GetValue("ExpireDate"));
        batchNumber.setText(response.GetValue("BatchNumber"));
        merchantNumber.setText(response.GetValue("MerchantNumber"));
        merchantName.setText(response.GetValue("MerchantName"));
        terminalNumber.setText(response.GetValue("TerminalNumber"));
        authNumber.setText(response.GetValue("AuthNumber"));
        rejCode.setText(response.GetValue("RejCode"));
        rejCodeExplain.setText(response.GetValue("RejCodeExplain"));
        transId.setText(response.GetValue("Transid"));
        orderNumber.setText(response.GetValue("OrderNumber"));
        issNumber.setText(response.GetValue("IssNumber"));
        issName.setText(response.GetValue("IssName"));
        cardNumber.setText(response.GetValue("CardNumber"));
        transTime.setText(response.GetValue("TransTime"));
        memo.setText(response.GetValue("memo"));
        traceNo.setText(response.GetValue("OldTraceNumber"));
        referenceNo.setText(response.GetValue("HostSerialNumber"));
        transDate.setText(response.GetValue("TransDate"));

    }

    //自定义消息回调函数
    class MessageListenerImpl implements IMessageListener {

        private MessageBean msg;

        public MessageBean getMsg() {
            return msg;
        }

        public void setMsg(MessageBean msg) {
            this.msg = msg;
        }

        @Override
        public void showMessage() {

            new Thread(new Runnable() {

                @Override
                public void run() {
                    //非UI线程调用UI线程，消息队列初始化
                    Looper.prepare();
                    //获取消息对象
                    Message message = handler.obtainMessage();

                    message.obj = msg.info;
//					if(0x01 == msg.type){
//						message.obj = "自定义消息体";
//					}else{
//						message.obj = msg.info;
//					}
                    handler.handleMessage(message);
                    //消息队列poll信息并执行
                    Looper.loop();
                }
            }).start();

        }
    }

}
