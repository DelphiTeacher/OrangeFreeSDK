// IDynamicInstall.aidl
package com.huawei.hms.feature.dynamic;

// Declare any non-default types here with import statements
import com.huawei.hms.feature.dynamic.IObjectWrapper;
import android.os.Bundle;

interface IDynamicInstall {

    //Non-on-demand installation of dynamic modules
    Bundle install(IObjectWrapper context, in Bundle moduleInfo);
}
