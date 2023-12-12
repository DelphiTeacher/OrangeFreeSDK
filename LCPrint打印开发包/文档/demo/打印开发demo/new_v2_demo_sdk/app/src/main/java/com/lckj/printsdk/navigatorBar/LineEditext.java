package com.lckj.printsdk.navigatorBar;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.text.TextPaint;
import android.util.AttributeSet;
import android.widget.EditText;

/**
 * Created by moxiaomo
 * on 2021/2/27
 */
public class LineEditext extends EditText {

    // 画笔 用来画下划线
    private Paint paint;
    private boolean bools = false;

    public LineEditext(Context context, AttributeSet attrs) {
        super(context, attrs);
        paint = new Paint();
        paint.setStyle(Paint.Style.STROKE);
        paint.setColor(Color.RED);
        // 开启抗锯齿 较耗内存
        paint.setAntiAlias(true);
    }

    @Override
    protected void onDraw(Canvas canvas) {
        super.onDraw(canvas);
        // 得到总行数
        int lineCount = getLineCount();
        // 得到每行的高度
        int lineHeight = getLineHeight();
        // 获取EditText中文字的物理长度
        TextPaint mTextPaint = getPaint();

        //Log.e ("TAG", "onDraw: " + getText ().toString ());
        float textWidth = mTextPaint.measureText(getText().toString());
        if (bools) {
            // 根据行数循环画线
            for (int i = 0; i < lineCount; i++) {
                int lineY = (i + 1) * lineHeight;
                canvas.drawLine(0, lineY, textWidth, lineY, paint);
            }
        }

    }


    public void isLine(boolean bool) {
        bools = bool;
    }

}