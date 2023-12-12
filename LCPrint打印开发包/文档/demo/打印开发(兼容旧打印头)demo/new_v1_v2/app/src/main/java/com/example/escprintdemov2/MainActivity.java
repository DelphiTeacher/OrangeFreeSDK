package com.example.escprintdemov2;

import androidx.appcompat.app.AppCompatActivity;
import androidx.fragment.app.FragmentManager;
import androidx.fragment.app.FragmentTransaction;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;

import com.example.escprintdemov2.fragment.LabelFragment;
import com.example.escprintdemov2.fragment.NoLabelFragment;

public class MainActivity extends AppCompatActivity implements View.OnClickListener {

    private Button mBtnLabel, mBtnNoLabel;

    FragmentManager fm;

    private LabelFragment labelFragment;
    private NoLabelFragment noLabelFragment;

    private Boolean b_sub_square = false;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        mBtnLabel = findViewById(R.id.btn_label);
        mBtnNoLabel = findViewById(R.id.btn_no_label);
        TextView btnAbout = findViewById(R.id.btn_about);

        mBtnLabel.setOnClickListener(this);
        mBtnNoLabel.setOnClickListener(this);
        btnAbout.setOnClickListener(this);

        fm = getSupportFragmentManager();
        setTabSelection(0);
        mBtnLabel.setActivated(true);
    }


    int flag = 0;

    @Override
    public void onClick(View view) {
        switch (view.getId()) {
            case R.id.btn_label:
                mBtnLabel.setActivated(true);
                mBtnNoLabel.setActivated(false);
                setTabSelection(0);
                break;
            case R.id.btn_no_label:
                mBtnLabel.setActivated(false);
                mBtnNoLabel.setActivated(true);
                setTabSelection(1);
                break;
            case R.id.btn_about:
                Intent intent = new Intent(this, AboutActivity.class);
                startActivity(intent);
                break;
        }
    }

    private void setTabSelection(int index) {
        FragmentTransaction ft = fm.beginTransaction();
        hideFragment(ft);
        switch (index) {
            case 0:
                if (labelFragment == null) {
                    labelFragment = new LabelFragment();
                    ft.add(R.id.fl, labelFragment);
                } else {
                    ft.show(labelFragment);
                }
                ft.setCustomAnimations(R.anim.slide_left_in,
                        R.anim.slide_right_out,
                        R.anim.slide_right_in,
                        R.anim.slide_left_out).replace(R.id.fl, labelFragment);
                break;
            case 1:
                if (noLabelFragment == null) {
                    noLabelFragment = new NoLabelFragment();
                    ft.add(R.id.fl, noLabelFragment);
                }
                ft.setCustomAnimations(R.anim.slide_right_in,
                        R.anim.slide_left_out,
                        R.anim.slide_left_in,
                        R.anim.slide_right_out).replace(R.id.fl, noLabelFragment);
                ft.show(noLabelFragment);
                break;
        }
        ft.commit();
    }

    //用于隐藏fragment
    private void hideFragment(FragmentTransaction ft) {
        if (labelFragment != null) {
            ft.hide(labelFragment);
        }
        if (noLabelFragment != null) {
            ft.hide(noLabelFragment);
        }
    }


}