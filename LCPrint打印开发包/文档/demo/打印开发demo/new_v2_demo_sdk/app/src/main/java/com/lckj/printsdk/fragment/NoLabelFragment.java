package com.lckj.printsdk.fragment;

import android.content.Context;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;


import com.lckj.printsdk.R;
import com.lckj.printsdk.label_ui.LabelBarcodeActivity;
import com.lckj.printsdk.label_ui.LabelPicActivity;
import com.lckj.printsdk.label_ui.LabelTextActivity;
import com.lckj.printsdk.navigatorBar.CustomNavigatorBar;
import com.lckj.printsdk.no_label_ui.NoLabelTemplateActivity;
import com.lckj.printsdk.utils.IntentUtil;

import androidx.annotation.NonNull;
import androidx.fragment.app.Fragment;

/**
 * A fragment representing a list of Items.
 */
public class NoLabelFragment extends Fragment implements View.OnClickListener {

    // TODO: Customize parameter argument names
    private static final String ARG_COLUMN_COUNT="column-count";
    // TODO: Customize parameters
    private int mColumnCount=1;
    private CustomNavigatorBar mBtnNoLabelText, mBtnNoLabelBarcode, mBtnNoLabelPic, mBtnNoLabelTemp;

    private Context mContext;
    /**
     * Mandatory empty constructor for the fragment manager to instantiate the
     * fragment (e.g. upon screen orientation changes).
     */
    public NoLabelFragment() {
    }

    // TODO: Customize parameter initialization
    @SuppressWarnings("unused")
    public static NoLabelFragment newInstance(int columnCount) {
        NoLabelFragment fragment=new NoLabelFragment ();
        Bundle args=new Bundle ();
        args.putInt (ARG_COLUMN_COUNT, columnCount);
        fragment.setArguments (args);
        return fragment;
    }

    @Override
    public void onAttach(@NonNull Context context) {
        super.onAttach (context);
        mContext = context;
    }

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate (savedInstanceState);

        if (getArguments () != null) {
            mColumnCount=getArguments ().getInt (ARG_COLUMN_COUNT);
        }
    }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        View view=inflater.inflate (R.layout.fragment_no_label, container, false);

        mBtnNoLabelText=view.findViewById (R.id.btn_no_label_text);
        mBtnNoLabelBarcode=view.findViewById (R.id.btn_no_label_barcode);
        mBtnNoLabelPic=view.findViewById (R.id.btn_no_label_pic);
        mBtnNoLabelTemp=view.findViewById (R.id.btn_no_label_temp);
        mBtnNoLabelText.setOnClickListener (this);
        mBtnNoLabelBarcode.setOnClickListener (this);
        mBtnNoLabelPic.setOnClickListener (this);
        mBtnNoLabelTemp.setOnClickListener (this);
        return view;
    }

    private long lastTime= 0;
    public boolean isButtonFastClick() {
        boolean flag = false;
        long mCurTime = System.currentTimeMillis();
        if ((mCurTime - lastTime) < 1000) {
            flag = true;
        }

        lastTime= mCurTime;
        return flag;
    }

    @Override
    public void onClick(View view) {
        if (isButtonFastClick()){
            return;
        }

        switch (view.getId ()) {
            case R.id.btn_no_label_text:
                IntentUtil.go (mContext, LabelTextActivity.class, "TYPE","2");
                break;
            case R.id.btn_no_label_barcode:
                IntentUtil.go (mContext, LabelBarcodeActivity.class, "TYPE","2");
                break;
            case R.id.btn_no_label_pic:
                IntentUtil.go (mContext, LabelPicActivity.class, "TYPE","2");
                break;
            case R.id.btn_no_label_temp:
                IntentUtil.go (mContext, NoLabelTemplateActivity.class, "TYPE","2");
                break;
        }
    }

}