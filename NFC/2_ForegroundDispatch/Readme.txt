NFC explicit scan example - Brian Long (http://blong.com)
=========================

This project demonstrates how to use Android's NFC support to scan tags on demand.

Indicate the need for NFC hardware:
----------------------------------

This helps Google Play Store filter your app out for devices with no NFC hardware.

This has already been done for this demo. It involves the following:

 - Open the Android manifest template, AndroidManifest.template.xml, which is generated on first compile, from the project directory
 - Below the activity element add this extra element:
 
	<uses-feature android:name="android.hardware.nfc" android:required="true" />

If your app uses NFC as an optional feature then this will not be necessary.

Build the Delphi Android application library:
--------------------------------------------

In the IDE choose Project | Compile NFC_Sample (or press Ctrl+F9)

Deploy the library to an Android application package (.apk):
-----------------------------------------------------------

In the IDE choose Project | Deploy libNFC_Sample.so

Install the app on the device:
-----------------------------

In the IDE choose Run | Run Without Debugging (or press Ctrl+Shift+F9) or Run | Run (or press F9)
This will implicitly do the compile and deploy steps above, so they are actually optional.

This step will re-install the app if already installed, which leaves any data intact (e.g. shared preferences).

If you want the app uninstalled (to clean it out entirely) and then reinstalled, choose Run | Parameters and set the Parameters field to:

  -cleaninstall

