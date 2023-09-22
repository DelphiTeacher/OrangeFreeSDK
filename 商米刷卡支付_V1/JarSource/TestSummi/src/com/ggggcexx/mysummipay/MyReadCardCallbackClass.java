package com.ggggcexx.mysummipay;

import com.sunmi.payservice.hardware.aidl.bean.PayCardInfo;

import android.os.RemoteException;

import com.sunmi.payservice.hardware.aidl.ReadCardCallback;


public class MyReadCardCallbackClass extends ReadCardCallback.Stub{
	
	private MyReadCardCallbackListener FMyReadCardCallbackListener =null;
	
	public void setMyReadCardCallbackListener(MyReadCardCallbackListener AMyReadCardCallbackListener) {
		FMyReadCardCallbackListener = AMyReadCardCallbackListener;
	}
		
    @Override
    public void onCardDetected (PayCardInfo cardInfo) throws RemoteException {
    	if (FMyReadCardCallbackListener!=null) {
    		FMyReadCardCallbackListener.onCardDetected(cardInfo);
    	}
    }
    
    @Override
    public void onError(int code, String message) throws RemoteException {
    	if (FMyReadCardCallbackListener!=null) {
    		FMyReadCardCallbackListener.onError(code, message);
    	}    	
    } 
    
    @Override
    public void onStartCheckCard () throws RemoteException {
    	if (FMyReadCardCallbackListener!=null) {
    		FMyReadCardCallbackListener.onStartCheckCard();
    	}
    }

}
