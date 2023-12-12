package com.example.escprintdemov2.utils;

import android.content.Context;
import android.content.SharedPreferences;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.util.Base64;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.Map;

public class SPUtils
{
	public SPUtils()
	{
		/* cannot be instantiated */
		throw new UnsupportedOperationException ("cannot be instantiated");
	}

	/**
	 * 保存在手机里面的文件名
	 * File name saved in the phone
	 */
	public static final String FILE_NAME = "share_data";

	/**
	 * 保存数据的方法，我们需要拿到保存数据的具体类型，然后根据类型调用不同的保存方法
	 * To save the data, we need to get the specific type of the saved data, and then call different save methods according to the type.
	 * @param context
	 * @param key
	 * @param object
	 */
	public static void put(Context context, String key, Object object)
	{

		SharedPreferences sp = context.getSharedPreferences(FILE_NAME, Context.MODE_PRIVATE);
		SharedPreferences.Editor editor = sp.edit();

		if (object instanceof String)
		{
			editor.putString(key, (String) object);
		} else if (object instanceof Integer)
		{
			editor.putInt(key, (Integer) object);
		} else if (object instanceof Boolean)
		{
			editor.putBoolean(key, (Boolean) object);
		} else if (object instanceof Float)
		{
			editor.putFloat(key, (Float) object);
		} else if (object instanceof Long)
		{
			editor.putLong(key, (Long) object);
		} else
		{
			editor.putString(key, object.toString());
		}

		SharedPreferencesCompat.apply(editor);
	}

	/**
	 * 得到保存数据的方法，我们根据默认值得到保存的数据的具体类型，然后调用相对于的方法获取值
	 * To get the method of saving the data, we get the specific type of the saved data according
	 * to the default value, and then call the method relative to the method to get the value.
	 * @param context
	 * @param key
	 * @param defaultObject
	 * @return
	 */
	public static Object get(Context context, String key, Object defaultObject)
	{
		SharedPreferences sp = context.getSharedPreferences(FILE_NAME,
				Context.MODE_PRIVATE);

		if (defaultObject instanceof String)
		{
			return sp.getString(key, (String) defaultObject);
		} else if (defaultObject instanceof Integer)
		{
			return sp.getInt(key, (Integer) defaultObject);
		} else if (defaultObject instanceof Boolean)
		{
			return sp.getBoolean(key, (Boolean) defaultObject);
		} else if (defaultObject instanceof Float)
		{
			return sp.getFloat(key, (Float) defaultObject);
		} else if (defaultObject instanceof Long)
		{
			return sp.getLong(key, (Long) defaultObject);
		}

		return null;
	}

	/**
	 * 移除某个key值已经对应的值
	 * Remove the value that a key value already corresponds to
	 * @param context
	 * @param key
	 */
	public static void remove(Context context, String key)
	{
		SharedPreferences sp = context.getSharedPreferences(FILE_NAME,
				Context.MODE_PRIVATE);
		SharedPreferences.Editor editor = sp.edit();
		editor.remove(key);
		SharedPreferencesCompat.apply(editor);
	}

	/**
	 * 清除所有数据
	 * clear all data
	 * @param context
	 */
	public static void clear(Context context)
	{
		SharedPreferences sp = context.getSharedPreferences(FILE_NAME,
				Context.MODE_PRIVATE);
		SharedPreferences.Editor editor = sp.edit();
		editor.clear();
		SharedPreferencesCompat.apply(editor);
	}

	/**
	 * 查询某个key是否已经存在
	 * Query if a key already exists
	 * @param context
	 * @param key
	 * @return
	 */
	public static boolean contains(Context context, String key)
	{
		SharedPreferences sp = context.getSharedPreferences(FILE_NAME,
				Context.MODE_PRIVATE);
		return sp.contains(key);
	}

	/**
	 * 返回所有的键值对
	 * Return all key-value pairs
	 * @param context
	 * @return
	 */
	public static Map<String, ?> getAll(Context context)
	{
		SharedPreferences sp = context.getSharedPreferences(FILE_NAME,
				Context.MODE_PRIVATE);
		return sp.getAll();
	}

	/**
	 * 创建一个解决SharedPreferencesCompat.apply方法的一个兼容类
	 * Create a compatibility class that resolves the SharedPreferencesCompat.apply method
	 * @author zhy
	 * 
	 */
	private static class SharedPreferencesCompat
	{
		private static final Method sApplyMethod = findApplyMethod();

		/**
		 * 反射查找apply的方法
		 * Reflection method for finding apply
		 * @return
		 */
		@SuppressWarnings({ "unchecked", "rawtypes" })
		private static Method findApplyMethod()
		{
			try
			{
				Class clz = SharedPreferences.Editor.class;
				return clz.getMethod("apply");
			} catch (NoSuchMethodException e)
			{
			}

			return null;
		}

		/**
		 * 如果找到则使用apply执行，否则使用commit
		 * If you find it, use apply, otherwise use commit
		 * @param editor
		 */
		public static void apply(SharedPreferences.Editor editor)
		{
			try
			{
				if (sApplyMethod != null)
				{
					sApplyMethod.invoke(editor);
					return;
				}
			} catch (IllegalArgumentException e)
			{
			} catch (IllegalAccessException e)
			{
			} catch (InvocationTargetException e)
			{
			}
			editor.commit();
		}
	}

	/**
	 * 将Bitmap转换成字符串保存至SharedPreferences
	 * Convert Bitmap to a string and save it to SharedPreferences
	 *
	 * 注意: 在压缩图片至输出流时,不要选择CompressFormat.JPEG而该是PNG,否则会造成图片有黑色背景.
	 * Note: When compressing the image to the output stream, do not select CompressFormat.
	 * JPEG and this is PNG, otherwise the image will have a black background.
	 */
	public static void saveBitmapToSharedPreferences(Context context, String key, Bitmap bitmap) {
		SharedPreferences sp = context.getSharedPreferences(FILE_NAME,
				Context.MODE_PRIVATE);
		SharedPreferences.Editor editor = sp.edit();
		// 第一步:将Bitmap压缩至字节数组输出流ByteArrayOutputStream
		// The first step: compress Bitmap to byte array output stream ByteArrayOutputStream
		ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream ();
		bitmap.compress(Bitmap.CompressFormat.PNG, 80, byteArrayOutputStream);
		// 第二步:利用Base64将字节数组输出流中的数据转换成字符串String
		// Step 2: Convert the data in the byte array output stream to a string using Base64
		byte[] byteArray = byteArrayOutputStream.toByteArray();
		String imageString = new String (Base64.encodeToString(byteArray, Base64.DEFAULT));
		// 第三步:将String保持至SharedPreferences
		// Step 3: Keep the String to SharedPreferences
		editor.putString(key, imageString);
		SharedPreferencesCompat.apply(editor);
	}

	/**
	 * 从SharedPreferences中取出Bitmap
	 * Remove the Bitmap from the SharedPreferences
	 */
	public static Bitmap getBitmapFromSharedPreferences(Context context, String key) {
		SharedPreferences sp = context.getSharedPreferences(FILE_NAME,
				Context.MODE_PRIVATE);
		// 第一步:取出字符串形式的Bitmap
		// Step 1: Take out the Bitmap in string form
		String imageString = sp.getString(key, "");
		// 第二步:利用Base64将字符串转换为ByteArrayInputStream
		// Step 2: Convert the string to a ByteArrayInputStream using Base64
		byte[] byteArray = Base64.decode(imageString, Base64.DEFAULT);
		ByteArrayInputStream byteArrayInputStream = new ByteArrayInputStream (
				byteArray);
		// 第三步:利用ByteArrayInputStream生成Bitmap
		// Step 3: Generate a Bitmap using ByteArrayInputStream
		Bitmap bitmap = BitmapFactory.decodeStream(byteArrayInputStream);
		return bitmap;

	}

}