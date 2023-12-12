package com.lckj.printsdk.fragment;

import android.content.Context;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;


import com.lckj.printsdk.R;
import com.lckj.printsdk.label_ui.LabelBarcodeActivity;
import com.lckj.printsdk.label_ui.LabelPicActivity;
import com.lckj.printsdk.label_ui.LabelTemplateActivity;
import com.lckj.printsdk.label_ui.LabelTextActivity;
import com.lckj.printsdk.navigatorBar.CustomNavigatorBar;
import com.lckj.printsdk.utils.IntentUtil;

import androidx.annotation.NonNull;
import androidx.fragment.app.Fragment;

/**
 * A fragment representing a list of Items.
 */
public class LabelFragment extends Fragment implements View.OnClickListener {

    // TODO: Customize parameter argument names
    private static final String ARG_COLUMN_COUNT="column-count";
    // TODO: Customize parameters
    private int mColumnCount=1;
    private CustomNavigatorBar mBtnLabelText, mBtnLabelBarcode;
    private CustomNavigatorBar mBtnLabelpic, mBtnLabelTemplate;
    private Context mContext;

    /**
     * Mandatory empty constructor for the fragment manager to instantiate the
     * fragment (e.g. upon screen orientation changes).
     */
    public LabelFragment() {
    }

    @Override
    public void onAttach(@NonNull Context context) {
        super.onAttach (context);
        mContext=context;
    }

    // TODO: Customize parameter initialization
    @SuppressWarnings("unused")
    public static LabelFragment newInstance(int columnCount) {
        LabelFragment fragment=new LabelFragment ();
        Bundle args=new Bundle ();
        args.putInt (ARG_COLUMN_COUNT, columnCount);
        fragment.setArguments (args);
        return fragment;
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
        View view=inflater.inflate (R.layout.fragment_label, container, false);

        mBtnLabelText=view.findViewById (R.id.btn_label_text);
        mBtnLabelBarcode=view.findViewById (R.id.btn_label_barcode);
        mBtnLabelpic=view.findViewById (R.id.btn_label_pic);
        mBtnLabelTemplate=view.findViewById (R.id.btn_label_template);
        mBtnLabelText.setOnClickListener (this);
        mBtnLabelBarcode.setOnClickListener (this);
        mBtnLabelpic.setOnClickListener (this);
        mBtnLabelTemplate.setOnClickListener (this);
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
            case R.id.btn_label_text:
                IntentUtil.go (mContext, LabelTextActivity.class, "TYPE", "1");
                break;
            case R.id.btn_label_barcode:
                IntentUtil.go (mContext, LabelBarcodeActivity.class, "TYPE", "1");
                break;
            case R.id.btn_label_pic:
                IntentUtil.go (mContext, LabelPicActivity.class, "TYPE", "1");
                break;
            case R.id.btn_label_template:
                IntentUtil.go (mContext, LabelTemplateActivity.class, "TYPE", "1");
                break;
        }
    }
}