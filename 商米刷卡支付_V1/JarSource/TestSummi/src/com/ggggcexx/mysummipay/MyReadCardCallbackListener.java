package com.ggggcexx.mysummipay;

import com.sunmi.payservice.hardware.aidl.bean.PayCardInfo;

public abstract interface MyReadCardCallbackListener
{

  public abstract void onCardDetected (PayCardInfo cardInfo);

  public abstract void onError(int code, String message);

  public abstract void onStartCheckCard ();

}

