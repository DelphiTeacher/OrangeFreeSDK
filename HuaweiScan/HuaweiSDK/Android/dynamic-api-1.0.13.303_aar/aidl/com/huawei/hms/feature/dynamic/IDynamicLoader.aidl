// IDynamicLoader.aidl
package com.huawei.hms.feature.dynamic;

// Declare any non-default types here with import statements
import com.huawei.hms.feature.dynamic.IObjectWrapper;

interface IDynamicLoader {

    IObjectWrapper load(IObjectWrapper context, String moduleName, int moduleVersion, IObjectWrapper bundle);
}
