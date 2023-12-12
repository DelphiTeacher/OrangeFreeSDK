package com.example.escprintdemov2.fragment;

import android.content.Context;
import android.os.Bundle;

import androidx.annotation.NonNull;
import androidx.fragment.app.Fragment;

import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

import com.example.escprintdemov2.label_ui.LabelTemplateActivity;
import com.example.escprintdemov2.navigatorBar.CustomNavigatorBar;
import com.example.escprintdemov2.R;
import com.example.escprintdemov2.label_ui.LabelBarcodeActivity;
import com.example.escprintdemov2.label_ui.LabelPicActivity;
import com.example.escprintdemov2.label_ui.LabelTextActivity;
import com.example.escprintdemov2.utils.IntentUtil;

import java.util.HashMap;
import java.util.Map;

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

    @Override
    public void onClick(View view) {
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