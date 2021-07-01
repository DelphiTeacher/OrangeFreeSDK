NFC explicit scan example - Brian Long (http://blong.com)
=========================

This project demonstrates how to use Android's NFC support and have your app auto-launched when a tag is scanned.

This requires some steps, which have been done already in this sample

Add intent filters to the activity
----------------------------------

This is done in the Android manifest template, AndroidManifest.template.xml in the project directory, which is generated on first compile,

Within the activity element add in some extra intent filter elements:

		<intent-filter>
			<action android:name="android.nfc.action.NDEF_DISCOVERED"/>
		</intent-filter>

		<intent-filter>
			<action android:name="android.nfc.action.TECH_DISCOVERED" />
		</intent-filter>
		<meta-data
			android:name="android.nfc.action.TECH_DISCOVERED"
			android:resource="@xml/nfc_tech_discovered_filter">
		</meta-data>

		<intent-filter>
			<action android:name="android.nfc.action.TAG_DISCOVERED"/>
		</intent-filter>

When a tag is scanned, if it an NDEF tag, then it will be handled by any apps that have registered an NDEF_DISCOVERED intent filter.

If it is another known NFC technology, it will be handled by any apps that have registered a TECH_DISCOVERED intent filter. This requires an accompanying file, stored in the res\xml project subdirectory, which defines the NFC technology permutations that a scanned NFC tag may have that you wish to handle.

If nothing has handled it then Android will seek out apps that have registered a TAG_DISCOVERED intent filter.

Indicate the need for NFC hardware:
----------------------------------

This helps Google Play Store filter your app out for devices with no NFC hardware.

This has already been done for this demo. It involves the following:

 - Open the Android manifest template, AndroidManifest.template.xml, which is generated on first compile, from the project directory
 - Below the activity element add this extra element:
 
	<uses-feature android:name="android.hardware.nfc" android:required="true" />

If your app uses NFC as an optional feature then this will not be necessary.

Add in the XML resource file and deploy it
------------------------------------------

In one of the intent filters above you referred to an XML file. This file has been added into this demo project directory structure.

It has also been added into the project's deployment manager, to be deployed to a suitable directory in the built application package.

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

