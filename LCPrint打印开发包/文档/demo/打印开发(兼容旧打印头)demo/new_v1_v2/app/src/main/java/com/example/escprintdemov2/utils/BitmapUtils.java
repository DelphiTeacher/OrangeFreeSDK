package com.example.escprintdemov2.utils;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Matrix;
import android.graphics.Paint;
import android.graphics.PointF;
import android.graphics.Rect;
import android.view.Gravity;
import android.view.View;
import android.widget.LinearLayout;
import android.widget.TextView;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.EncodeHintType;
import com.google.zxing.MultiFormatWriter;
import com.google.zxing.WriterException;
import com.google.zxing.common.BitMatrix;

import java.io.ByteArrayOutputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.util.HashMap;

/**
 * Created by moxiaomo
 * on 2020/4/1
 */
public class BitmapUtils {

    /**
     */
    private static int marginW = 20;
    /**
     */
    public static BarcodeFormat barcodeFormat = BarcodeFormat.CODE_128;

    public static Bitmap createBarcode(Context context, String contents, int desiredWidth, int desiredHeight, boolean displayCode, int barType) {
        Bitmap ruseltBitmap = null;
        if (barType == 1) {
            barcodeFormat = BarcodeFormat.CODE_128;
        } else if (barType == 2) {
            barcodeFormat = BarcodeFormat.QR_CODE;
        }
        if (displayCode) {
            Bitmap barcodeBitmap = null;
            try {
                barcodeBitmap = encodeAsBitmap(contents, barcodeFormat, desiredWidth, desiredHeight);
            } catch (WriterException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
            Bitmap codeBitmap = createCodeBitmap(contents, desiredWidth, desiredHeight, context);
            ruseltBitmap = mixtureBitmap(barcodeBitmap, codeBitmap, new PointF (0, desiredHeight));
        } else {
            try {
                ruseltBitmap = encodeAsBitmap(contents, barcodeFormat, desiredWidth, desiredHeight);
            } catch (WriterException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }

        return ruseltBitmap;
    }

    public static Bitmap createCodeBitmap(String contents, int width, int height, Context context) {
        TextView tv = new TextView (context);
        LinearLayout.LayoutParams layoutParams = new LinearLayout.LayoutParams(width, height);
        tv.setLayoutParams(layoutParams);
        tv.setText(contents);
        //tv.setHeight(48);
        tv.setTextSize(18);
        tv.setGravity(Gravity.CENTER_HORIZONTAL);
        tv.setWidth(width);
        tv.setDrawingCacheEnabled(true);
        tv.setTextColor(Color.BLACK);
        tv.setBackgroundColor(Color.WHITE);
        tv.measure(View.MeasureSpec.makeMeasureSpec(0, View.MeasureSpec.UNSPECIFIED), View.MeasureSpec.makeMeasureSpec(0, View.MeasureSpec.UNSPECIFIED));
        tv.layout(0, 0, tv.getMeasuredWidth(), tv.getMeasuredHeight());

        tv.buildDrawingCache();
        Bitmap bitmapCode = tv.getDrawingCache();
        return bitmapCode;
    }

    public static Bitmap encode2dAsBitmap(String contents, BarcodeFormat barcodeFormat,int desiredWidth, int desiredHeight) {
        Bitmap barcodeBitmap = null;
        try {
            barcodeBitmap = encodeAsBitmap(contents, barcodeFormat, desiredWidth, desiredHeight);
        } catch (WriterException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return barcodeBitmap;
    }

    public static Bitmap mixtureBitmap(Bitmap first, Bitmap second, PointF fromPoint) {
        if (first == null || second == null || fromPoint == null) {
            return null;
        }

        Bitmap newBitmap = Bitmap.createBitmap(first.getWidth(), first.getHeight() + second.getHeight(), Bitmap.Config.ARGB_4444);
        Canvas cv = new Canvas (newBitmap);
        cv.drawBitmap(first, 0, 0, null);
        cv.drawBitmap(second, fromPoint.x, fromPoint.y, null);
        cv.save();
        cv.restore();

        return newBitmap;
    }

    public static Bitmap encodeAsBitmap(String contents, BarcodeFormat format, int desiredWidth, int desiredHeight) throws WriterException {
        final int WHITE = 0xFFFFFFFF;
        final int BLACK = 0xFF000000;

        HashMap<EncodeHintType, String> hints = null;
        String encoding = guessAppropriateEncoding(contents);
        if (encoding != null) {
            hints = new HashMap<EncodeHintType, String> (2);
            hints.put(EncodeHintType.CHARACTER_SET, encoding);
        }
        MultiFormatWriter writer = new MultiFormatWriter ();
        BitMatrix result = writer.encode(contents, format, desiredWidth, desiredHeight, hints);
        int width = result.getWidth();
        int height = result.getHeight();
        int[] pixels = new int[width * height];
        // All are 0, or black, by default
        for (int y = 0; y < height; y++) {
            int offset = y * width;
            for (int x = 0; x < width; x++) {
                pixels[offset + x] = result.get(x, y) ? BLACK : WHITE;
            }
        }

        Bitmap bitmap = Bitmap.createBitmap(width, height, Bitmap.Config.ARGB_8888);
        bitmap.setPixels(pixels, 0, width, 0, 0, width, height);
        return bitmap;
    }

    public static String guessAppropriateEncoding(CharSequence contents) {
        // Very crude at the moment
        for (int i = 0; i < contents.length(); i++) {
            if (contents.charAt(i) > 0xFF) {
                return "UTF-8";
            }
        }
        return null;
    }


    /**
     * 图片加上配文后生成的新图片
     */
    private static Bitmap newBitmap;
    /**
     * 配文的颜色
     */
    private int textColor = Color.BLACK;
    /**
     * 配文的字体大小
     */
    private static float textSize = 18;
    /**
     * 图片的宽度
     */
    private static int bitmapWidth;
    /**
     * 图片的高度
     */
    private static int bitmapHeight;
    /**
     * 画图片的画笔
     */
    private static Paint bitmapPaint;
    /**
     * 画文字的画笔
     */
    private static Paint textPaint;
    /**
     * 配文与图片间的距离
     */
    private static float padding = 15;
    /**
     * 配文行与行之间的距离
     */
    private static float linePadding = 5;

    /**
     * 把带logo的二维码下面加上文字
     *
     * @param image
     * @param words
     * @return
     */
    public static Bitmap insertWords(Bitmap image, String words) {

        bitmapWidth = image.getWidth();
        bitmapHeight = image.getHeight();

        // 一行可以显示文字的个数
        int lineTextCount = (int) ((image.getWidth() - 50) / textSize);
        // 一共要把文字分为几行
        int line = (int) Math.ceil(Double.valueOf(words.length()) / Double.valueOf(lineTextCount));
        //新创建一个新图片比源图片多出一部分，后续用来与文字叠加用
        newBitmap = Bitmap.createBitmap(bitmapWidth, (int) (bitmapHeight + padding + textSize * line + linePadding * line), Bitmap.Config.ARGB_8888);

        Canvas canvas = new Canvas (newBitmap);

        bitmapPaint = new Paint ();
        textPaint = new Paint ();

        // 把图片画上来
        canvas.drawBitmap(image, 0, 0, bitmapPaint);
        textPaint.setColor(Color.WHITE);
        canvas.drawRect(0, image.getHeight(), image.getWidth(), image.getHeight() + padding + textSize * line + linePadding * line, textPaint);
        // 抗锯齿
        textPaint.setAntiAlias(true);
        // 防抖动
        textPaint.setDither(true);
        textPaint.setTextSize(20); // 调字体大小调这个数值即可
        textPaint.setColor(Color.parseColor("#000000"));
        Rect bounds = new Rect ();
        // 开启循环直到画完所有行的文字
        for (int i = 0; i < line; i++) {
            String s;
            if (i == line - 1) {//如果是最后一行，则结束位置就是文字的长度，别下标越界哦
                s = words.substring(i * lineTextCount, words.length());
            } else {// 不是最后一行
                s = words.substring(i * lineTextCount, (i + 1) * lineTextCount);
            }
            //获取文字的字宽高以便把文字与图片中心对齐
            textPaint.getTextBounds(s, 0, s.length(), bounds);
            //画文字的时候高度需要注意文字大小以及文字行间距
            canvas.drawText(s, image.getWidth() / 2 - bounds.width() / 2,
                    image.getHeight() + padding + i * textSize + i * linePadding + bounds.height() / 2, textPaint);
        }
        // canvas.save(Canvas.ALL_SAVE_FLAG);
        canvas.save();
        canvas.restore();
        return newBitmap;
    }

    public static boolean saveBitmap2file(Bitmap bmp, String filename) {
        Bitmap.CompressFormat format = Bitmap.CompressFormat.JPEG;
        int quality = 100;
        OutputStream stream = null;
        try {
            stream = new FileOutputStream ("/sdcard/" + filename);
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }
        return bmp.compress(format, quality, stream);
    }

    /**
     * @param bm
     * @param orientationDegree 旋转角度
     * @return
     */
    public static Bitmap adjustPhotoRotation(Bitmap bm, final int orientationDegree) {
        Matrix m=new Matrix ();
        m.setRotate (orientationDegree, (float) bm.getWidth () / 2, (float) bm.getHeight () / 2);
        float targetX, targetY;
        if (orientationDegree == 90) {
            targetX=bm.getHeight ();
            targetY=0;
        } else {
            targetX=bm.getHeight ();
            targetY=bm.getWidth ();
        }

        final float[] values=new float[9];
        m.getValues (values);

        float x1=values[Matrix.MTRANS_X];
        float y1=values[Matrix.MTRANS_Y];

        m.postTranslate (targetX - x1, targetY - y1);

        Bitmap bm1=Bitmap.createBitmap (bm.getHeight (), bm.getWidth (), Bitmap.Config.ARGB_8888);

        Paint paint=new Paint ();
        Canvas canvas=new Canvas (bm1);
        canvas.drawBitmap (bm, m, paint);
        return bm1;
    }

    /**
     *
     * 转黑白图 Turn black and white
     * @param bmp 原图 bitmap
     * @param w   转换后的宽 convert to width
     * @param h   转换后的高 convert to height
     * @return
     */
    public static Bitmap convertToBMW(Bitmap bmp, int w, int h, int tmp) {
        int width=bmp.getWidth (); // 获取位图的宽. Get the width of the bitmap.
        int height=bmp.getHeight (); // 获取位图的高. Get the height of the bitmap.
        int[] pixels=new int[width * height]; // 通过位图的大小创建像素点数组. Create an array of pixels by the size of the bitmap.
        // 设定二值化的域值，默认值为100. Set the binarized field value. The default value is 100.
        //tmp = 180;
        bmp.getPixels (pixels, 0, width, 0, 0, width, height);
        int alpha=0xFF << 24;
        for (int i=0; i < height; i++) {
            for (int j=0; j < width; j++) {
                int grey=pixels[width * i + j];
                // 分离三原色 Separating the three primary colors.
                alpha=((grey & 0xFF000000) >> 24);
                int red=((grey & 0x00FF0000) >> 16);
                int green=((grey & 0x0000FF00) >> 8);
                int blue=(grey & 0x000000FF);
                if (red > tmp) {
                    red=255;
                } else {
                    red=0;
                }
                if (blue > tmp) {
                    blue=255;
                } else {
                    blue=0;
                }
                if (green > tmp) {
                    green=255;
                } else {
                    green=0;
                }
                pixels[width * i + j]=alpha << 24 | red << 16 | green << 8| blue;
                if (pixels[width * i + j] == -1) {
                    pixels[width * i + j]=-1;
                } else {
                    pixels[width * i + j]=-16777216;
                }
            }
        }
        // 新建图片 create new bitmap.
        Bitmap newBmp=Bitmap.createBitmap (width, height, Bitmap.Config.ARGB_8888);
        // 设置图片数据 setting bitmap data.
        newBmp.setPixels (pixels, 0, width, 0, 0, width, height);
        // Bitmap resizeBmp = ThumbnailUtils.extractThumbnail(newBmp, w, h);
        return newBmp;
    }

    /**
     * 缩放图片 Zoom picture
     *
     * @param bm
     * @param newWidth
     * @param newHeight
     * @return Bitmap
     */
    public Bitmap stretch(Bitmap bm, int newWidth, int newHeight) {
        if (bm == null) {
            return null;
        }
        int width=bm.getWidth ();
        int height=bm.getHeight ();
        float scaleWidth=((float) newWidth) / width;
        float scaleHeight=((float) newHeight) / height;
        Matrix matrix=new Matrix ();
        matrix.postScale (scaleWidth, scaleHeight);
        Bitmap newbm=Bitmap.createBitmap (bm, 0, 0, width, height, matrix, true);
        if (bm != null & !bm.isRecycled ()) {
            bm.recycle ();// recycle bitmap
            bm=null;
        }
        return newbm;
    }

    public final static int WIDTH_PIXEL=384;
    public final static int IMAGE_SIZE=300;

    /**
     * 对图片进行压缩（去除透明度）
     *
     * @param bitmapOrg
     */
    public static Bitmap compressPic(Bitmap bitmapOrg, int Width, int Height) {
        // 获取这个图片的宽和高
        int width=bitmapOrg.getWidth ();
        int height=bitmapOrg.getHeight ();
        // 定义预转换成的图片的宽度和高度
        int newWidth=Width;
        int newHeight=Height;
        Bitmap targetBmp=Bitmap.createBitmap (newWidth, newHeight, Bitmap.Config.ARGB_8888);
        Canvas targetCanvas=new Canvas (targetBmp);
        targetCanvas.drawColor (0xffffffff);
        targetCanvas.drawBitmap (bitmapOrg, new Rect (0, 0, width, height), new Rect (0, 0, newWidth, newHeight), null);
        return targetBmp;
    }

    /**
     * 对图片进行压缩（去除透明度）
     *
     * @param bitmapOrg
     */
    public static Bitmap compressPic(Bitmap bitmapOrg, int Width, int Height, int quality) {
        // 获取这个图片的宽和高
        int width=bitmapOrg.getWidth ();
        int height=bitmapOrg.getHeight ();
        // 定义预转换成的图片的宽度和高度
        int newWidth=Width;
        int newHeight=Height;
        Bitmap targetBmp=Bitmap.createBitmap (newWidth, newHeight, Bitmap.Config.ARGB_8888);
        Canvas targetCanvas=new Canvas (targetBmp);
        targetCanvas.drawColor (0xffffffff);
        targetCanvas.drawBitmap (bitmapOrg, new Rect (0, 0, width, height), new Rect (0, 0, newWidth, newHeight), null);

        ByteArrayOutputStream bos = new ByteArrayOutputStream();
        targetBmp.compress(Bitmap.CompressFormat.JPEG, quality, bos);

        return targetBmp;
    }
}
