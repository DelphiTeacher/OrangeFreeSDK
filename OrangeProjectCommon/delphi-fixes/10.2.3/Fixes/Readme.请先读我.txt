注意，如果您以前使用过旧版本的 fix code ，请检查新版本是不是少了一些文件，因为这些文件不再需要 fix 了。请您也删错对应的 fix 保留您自己的 fix 。

他们复制到其他目录，例如您的工程目录，也可以放到统一的目录，您所有的工程都从这个统一的目录加载这些文件。

将这些文件中您需要的文件【加入】到您的工程中。

本压缩包内，有一部分 pas 是没有修改过的，带上他们，是为了解决 E2051 错误。
但是，如果依然提示 E2051 错误，说明还需要继续带上提示的文件。
E2051 Unit XXX was complied with a different version of YYY .
说明 XXX 需要从官方源码中复制到 YYY 所在目录。


FireDAC 的修改 需要复制 FireDAC.inc 到你的 这个目录。
或者不复制其他文件，最好是将 安装目录下的
\source\data\firedac
这个目录加入到你的工程搜索路径中，可以方便编译。

如果 存在 FMX.Controls.o.Readme.txt
请读一下。

QDac 收集的 代码补丁。
https://github.com/chinawsb/fmxfixes