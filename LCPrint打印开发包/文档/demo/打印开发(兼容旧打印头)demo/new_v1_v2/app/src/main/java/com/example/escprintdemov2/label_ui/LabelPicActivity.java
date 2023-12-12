package com.example.escprintdemov2.label_ui;

import android.Manifest;
import android.annotation.TargetApi;
import android.content.ContentUris;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.database.Cursor;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.media.ThumbnailUtils;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.os.Environment;
import android.os.Handler;
import android.os.Message;
import android.provider.DocumentsContract;
import android.provider.MediaStore;
import android.text.TextUtils;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.Toast;

import com.example.escprintdemov2.App;
import com.example.escprintdemov2.BaseActivity;
import com.example.escprintdemov2.R;
import com.example.escprintdemov2.utils.BitmapUtils;
import com.example.escprintdemov2.utils.SPUtils;
import com.example.print_sdk.PrintUtil;
import com.example.print_sdk.enums.ALIGN_MODE;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import androidx.annotation.NonNull;
import androidx.core.app.ActivityCompat;
import androidx.core.content.ContextCompat;
import androidx.core.content.FileProvider;

public class LabelPicActivity extends BaseActivity implements View.OnClickListener {

    private Uri imageUri;
    private ImageView mImgPicture;
    private EditText editPicCon;
    private final int REQUEST_CAMERA = 101;
    private final int REQUEST_PHOTO = 102;
    private List<String> permissionList = new ArrayList<>();
    private LinearLayout mBtnPhoto, mBtnCamera;
    private Button mBtnPicPrint;
    private PrintUtil printUtil;
    private String mPageType;
    private Bitmap mBitmap;
    private String[] strArray = new String[]{
            Manifest.permission.CAMERA,
            Manifest.permission.WRITE_EXTERNAL_STORAGE,
            Manifest.permission.READ_EXTERNAL_STORAGE

    };

    int getsupportprint;
    com.example.lc_print_sdk.PrintUtil newprintUtil;

    private Handler handler = new Handler() {
        @Override
        public void handleMessage(@NonNull Message msg) {
            super.handleMessage(msg);
            switch (msg.what) {
                case 0:
                    App.getLoadProgressDialog(LabelPicActivity.this).show();
                    break;
            }
        }
    };

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentLayout(R.layout.activity_label_pic);
        Intent intent = getIntent();
        mPageType = intent.getStringExtra("TYPE");
        if ("1".equals (mPageType)) {
            setTitle (getString (R.string.btn_label_TXT3));//设置标题
        } else {
            setTitle (getString (R.string.btn_NO_label_TXT3));//设置标题
        }
        setBackArrow();//设置返回按钮和点击事件

        getsupportprint=(int) SPUtils.get (LabelPicActivity.this, "getsupportprint", 0);
        if (getsupportprint == 0){
            printUtil = App.getPrint();
            //初始化调用一次即可。设置开启/关闭黑标检测
            if ("1".equals(mPageType)) {
                printUtil.printEnableMark(true);
            } else {
                printUtil.printEnableMark(false);
            }
        }else {
            newprintUtil=App.getnewPrint ();
            if ("1".equals(mPageType)) {
                newprintUtil.printEnableMark(true);
            } else {
                newprintUtil.printEnableMark(false);
            }
        }

        editPicCon = findViewById(R.id.edit_pic_con);
        mBtnPhoto = findViewById(R.id.btn_photo);
        mBtnCamera = findViewById(R.id.btn_cameta);
        mBtnPicPrint = findViewById(R.id.btn_pic_print);
        mImgPicture = findViewById(R.id.img_picture);
        mBtnPhoto.setOnClickListener(this);
        mBtnCamera.setOnClickListener(this);
        mBtnPicPrint.setOnClickListener(this);
    }


    @Override
    public void onClick(View view) {
        switch (view.getId()) {
            case R.id.btn_photo:
                startPhoto();
                break;
            case R.id.btn_cameta:
                if (Build.VERSION.SDK_INT >= 23) {
                    permissionList.clear();
                    for (int j = 0; j < strArray.length; j++) {
                        if (ContextCompat.checkSelfPermission(LabelPicActivity.this, strArray[j]) != PackageManager.PERMISSION_GRANTED) {
                            permissionList.add(strArray[j]);
                        }
                        if (permissionList.isEmpty()) {
                            startCamera();
                        } else {
                            String[] permission = permissionList.toArray(new String[permissionList.size()]);
                            ActivityCompat.requestPermissions(LabelPicActivity.this, permission, 1);
                        }
                    }
                } else {
                    //imageUri=Uri.fromFile (getImageFile ());
                    startCamera();
                }
                break;
            case R.id.btn_pic_print:
                try {
                    if (TextUtils.isEmpty(editPicCon.getText().toString().trim())) {
                        Toast.makeText(this, getString(R.string.toast_density), Toast.LENGTH_SHORT).show();
                        return;
                    }
                    if (mBitmap != null) {
                        handler.sendEmptyMessage(0);

                        if (getsupportprint == 0){
                            Bitmap BlackWhiteBitmap = convertToBlackWhite(mBitmap);
                            if ("1".equals(mPageType)) {
                                BlackWhiteBitmap = BitmapUtils.compressPic(BlackWhiteBitmap, 200, 200);
                            } else {
                                BlackWhiteBitmap = BitmapUtils.compressPic(BlackWhiteBitmap, 200, 200);
                            }
                            printUtil.printStartNumber(App.number);
                            printUtil.printState();
                            printUtil.printConcentration(Integer.valueOf(editPicCon.getText().toString().trim()));
                            printUtil.printAlignment(ALIGN_MODE.ALIGN_CENTER);
                            printUtil.printLine();
                            printUtil.printBitmap2(BlackWhiteBitmap);
                            printUtil.printLine();
                            if ("1".equals(mPageType)) {
                                printUtil.printGoToNextMark();
                            } else {
                                printUtil.printLine(6);
                            }
                            printUtil.printEndNumber();
                        }else {
                            Bitmap BlackWhiteBitmap = convertToBlackWhite(mBitmap);
                            if ("1".equals(mPageType)) {
                                BlackWhiteBitmap = BitmapUtils.compressPic(BlackWhiteBitmap, 200, 200);
                            } else {
                                BlackWhiteBitmap = BitmapUtils.compressPic(BlackWhiteBitmap, 200, 200);
                            }

                            newprintUtil.printConcentration(Integer.valueOf(editPicCon.getText().toString().trim()));

                            newprintUtil.printLine(1);
                            newprintUtil.printBitmap(BlackWhiteBitmap);
                            newprintUtil.printLine(1);
                            if ("1".equals(mPageType)) {
                                newprintUtil.printGoToNextMark();
                            } else {
                                newprintUtil.printLine(6);
                                newprintUtil.start();
                            }

                        }

                    } else {
                        if (getsupportprint == 0){
                            Bitmap bitmap2 = BitmapFactory.decodeResource(this.getResources(), R.drawable.c); //R.drawable.test1);
                            bitmap2 = BitmapUtils.compressPic(bitmap2, 380, 625, 80);
                            printUtil.printStartNumber(App.number);
                            printUtil.printState();
                            printUtil.printConcentration(Integer.valueOf(editPicCon.getText().toString().trim()));
                            printUtil.printLine (1);
                            printUtil.printAlignment (ALIGN_MODE.ALIGN_CENTER);
                            printUtil.printBitmap2(bitmap2);
                            if ("1".equals(mPageType)) {
                                printUtil.printGoToNextMark();
                            } else {
                                printUtil.printLine(6);
                            }
                            printUtil.printEndNumber();
                        }else {
                            Bitmap bitmap2 = BitmapFactory.decodeResource(this.getResources(), R.drawable.c); //R.drawable.test1);
                            bitmap2 = BitmapUtils.compressPic(bitmap2, 380, 625, 80);
                            newprintUtil.printConcentration(Integer.valueOf(editPicCon.getText().toString().trim()));
                            newprintUtil.printLine (1);
                            newprintUtil.printBitmap(bitmap2);
                            if ("1".equals(mPageType)) {
                                newprintUtil.printGoToNextMark();
                            } else {
                                newprintUtil.printLine(6);
                                newprintUtil.start();
                            }
                        }

                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
                break;
        }
    }

    public static Bitmap convertToBlackWhite(Bitmap bmp) {
        int width = bmp.getWidth(); // 获取位图的宽
        int height = bmp.getHeight(); // 获取位图的高
        int[] pixels = new int[width * height]; // 通过位图的大小创建像素点数组

        bmp.getPixels(pixels, 0, width, 0, 0, width, height);
        int alpha = 0xFF << 24;
        for (int i = 0; i < height; i++) {
            for (int j = 0; j < width; j++) {
                int grey = pixels[width * i + j];

                int red = ((grey & 0x00FF0000) >> 16);
                int green = ((grey & 0x0000FF00) >> 8);
                int blue = (grey & 0x000000FF);

                grey = (int) (red * 0.3 + green * 0.59 + blue * 0.11);
                grey = alpha | (grey << 16) | (grey << 8) | grey;
                pixels[width * i + j] = grey;
            }
        }
        Bitmap newBmp = Bitmap.createBitmap(width, height, Bitmap.Config.RGB_565);

        newBmp.setPixels(pixels, 0, width, 0, 0, width, height);

        Bitmap resizeBmp = ThumbnailUtils.extractThumbnail(newBmp, 460, 460);
        return resizeBmp;
    }

    public void startCamera() {
        // ACTION_GET_CONTENT
        Intent intent = new Intent(MediaStore.ACTION_IMAGE_CAPTURE);
        intent.addFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP);
        dispatchTakePictureIntent(intent);
    }

    public static final String STR_IMAGE = "image/*";

    public void startPhoto() {

        Intent intent = new Intent(Intent.ACTION_PICK, null);
        intent.setDataAndType(MediaStore.Images.Media.EXTERNAL_CONTENT_URI, STR_IMAGE);
        startActivityForResult(intent, REQUEST_PHOTO);
    }

    // 获取文件对象，保存图片
    public File getImageFile() {
        String timeStamp = new SimpleDateFormat("yyyyMMDD_HHmmss").format(new Date());
        String imageFileName = "test_" + timeStamp + ".jpg";
        String cameraPath = Environment.getExternalStorageDirectory() + File.separator + Environment.DIRECTORY_DCIM + File.separator + "Camera" + File.separator;
        //File storageDir = getExternalFilesDir(Environment.DIRECTORY_PICTURES);
        File storageDir = Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_DCIM);

        File file = new File(cameraPath, imageFileName);
        if (file.exists()) {
            file.delete();
        }

        return file;
    }

    private File mTmpFile;

    private void dispatchTakePictureIntent(Intent intent) {
        if (intent.resolveActivity(getPackageManager()) == null) {
            return;
        }
        File imageFile = null;
        imageFile = getImageFile();
        mTmpFile = imageFile;
        if (imageFile != null) {
            if (Build.VERSION.SDK_INT >= 24) {
                imageUri = FileProvider.getUriForFile(LabelPicActivity.this, "com.example.escprintdemov2.label_ui.fileprovider", getImageFile());
            } else {
                imageUri = Uri.fromFile(getImageFile());
            }
            intent.putExtra(MediaStore.EXTRA_OUTPUT, imageUri);
            startActivityForResult(intent, REQUEST_CAMERA);
        }
    }

    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        switch (requestCode) {
            case REQUEST_CAMERA:
                if (requestCode != RESULT_OK) {
                    if (data != null) {
                        if (data.getExtras() != null) {
                            Log.e("WangJ", "result-Extras: " + data.getExtras());
                            mBitmap = (Bitmap) data.getParcelableExtra("data");
                            mImgPicture.setBackground(bitmapDrawable(mBitmap));
                        } else {
                            Log.e("WangJ", "无intent extra返回");
                        }
                    } else {
                        Log.e("TAG", "onActivityResult: " + imageUri);
                        try {
                            mBitmap = getBitmapByUri(imageUri);
                            mImgPicture.setBackground(bitmapDrawable(mBitmap));
                            /* 以下代码的作用是通知系统相册刷新目标位置，这样即可在相册中显示该图片，
                             * 如果不想在相册中显示，可以不发送次广播即可 */
                            Intent intent = new Intent(Intent.ACTION_MEDIA_SCANNER_SCAN_FILE);
                            intent.setData(imageUri);
                            sendBroadcast(intent);

                        } catch (Exception e) {
                            e.printStackTrace();
                        }

                    }
                }
                break;
            case REQUEST_PHOTO:
                Log.e("WangJ", "onActivityResult: ***");
                if (resultCode == RESULT_OK && data != null) {
                    if (Build.VERSION.SDK_INT >= 19) {
                        Log.e("WangJ", "onActivityResult: ***");
                        // 4.4及以上系统使用
                        handleImageOnKitKat(data);
                    } else {
                        // 4.4 以下系统使用
                        handleImageBeforeKitKat(data);
                    }
                }
                break;
            default:
                break;
        }


    }

    private Drawable bitmapDrawable(Bitmap bitmap) {
        Bitmap bitmap1 = convertToBlackWhite(bitmap);
        return new BitmapDrawable(bitmap1);
    }

    private Bitmap getBitmapByUri(Uri picuUi) {
        Bitmap bitmap = null;
        try {
            InputStream in = getContentResolver().openInputStream(picuUi);
            bitmap = BitmapFactory.decodeStream(in);
            Log.e("WangJ", "从流中获取的原始大小： " + bitmap.getWidth() * bitmap.getHeight());
            bitmap = ThumbnailUtils.extractThumbnail(bitmap, 800, 1280);
            Log.e("WangJ", "压缩后大小： " + bitmap.getWidth() * bitmap.getHeight());
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }
        return bitmap;
    }


    @TargetApi(19)
    private void handleImageOnKitKat(Intent data) {
        String imagePath = null;
        Uri uri = data.getData();
        Log.d("handleImageBeforeKitKat", "Intent " + uri.getAuthority() + " " + uri.getScheme());
        if (DocumentsContract.isDocumentUri(this, uri)) {
            // 如果是document类型的uri，则通过document id处理
            String docid = DocumentsContract.getDocumentId(uri);
            if ("com.android.providers.media.documents".equals(uri.getAuthority())) {
                String id = docid.split(":")[1];
                String selection = MediaStore.Images.Media._ID + "=" + id;
                imagePath = getImagePath(MediaStore.Images.Media.EXTERNAL_CONTENT_URI, selection);
            } else if ("com.android.providers.downloads.documents".equals(uri.getAuthority())) {
                Uri contentUri = ContentUris.withAppendedId(Uri.parse("content://downloads/public_downloads"), Long.valueOf(docid));
                imagePath = getImagePath(contentUri, null);
            }
        } else if ("content".equalsIgnoreCase(uri.getScheme())) {
            // 如果是content类型，则用普通方式处理
            imagePath = getImagePath(uri, null);
        } else if ("file".equalsIgnoreCase(uri.getScheme())) {
            // 如果是file则直接获取图片路径
            imagePath = uri.getPath();
        }
        disPlayImage(imagePath);
    }

    /**
     * @param data
     */
    private void handleImageBeforeKitKat(Intent data) {
        Uri uri = data.getData();
        Log.d("handleImageBeforeKitKat", "uri1 " + uri);
        String imagePath = getImagePath(uri, null);
        disPlayImage(imagePath);
    }

    /**
     * 图片展示
     *
     * @param imagePath
     */
    private void disPlayImage(String imagePath) {
        if (imagePath != null) {
            Bitmap bitmap = BitmapFactory.decodeFile(imagePath);
            mBitmap = bitmap;
            mImgPicture.setBackground(bitmapDrawable(bitmap));
        } else {
            Toast.makeText(this, getString(R.string.toast_no_img), Toast.LENGTH_SHORT).show();
        }
    }

    // 获取图片路径
    private String getImagePath(Uri uri, String selection) {
        String path = null;
        // 通过uri和selection来获取真实路径
        Cursor cursor = getContentResolver().query(uri, null, selection, null, null);
        if (cursor != null) {
            if (cursor.moveToFirst()) {
                path = cursor.getString(cursor.getColumnIndex(MediaStore.Images.Media.DATA));
            }
            cursor.close();
        }
        return path;
    }

    @Override
    public void onRequestPermissionsResult(int requestCode, @NonNull String[] permissions, @NonNull int[] grantResults) {
        switch (requestCode) {
            case 1:
                for (int i = 0; i < grantResults.length; i++) {
                    if (grantResults[i] != PackageManager.PERMISSION_GRANTED) {
                        boolean showRequestPermission = ActivityCompat.shouldShowRequestPermissionRationale(LabelPicActivity.this, permissions[i]);
                        if (showRequestPermission) {
                            Toast.makeText(this, "没有权限", Toast.LENGTH_SHORT).show();
                        } else {
                            Toast.makeText(this, "已权限1", Toast.LENGTH_SHORT).show();
                        }
                    }
                }
                break;
            default:
                break;
        }
        super.onRequestPermissionsResult(requestCode, permissions, grantResults);
    }
}