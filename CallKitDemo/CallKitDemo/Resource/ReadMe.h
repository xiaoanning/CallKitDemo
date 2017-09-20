
tips:
    1.要想调起原生打电话界面需要在plist文件里加入以下配置 否则不能调起
    <key>UIBackgroundModes</key>
    <array>
    <string>audio</string>
    <string>voip</string>
    </array>


1、CXCall：电话信息基类，有一个唯一识别符UUID，是系统用以区分一个唯一来电信息的东西、通过这个ID可以地位到特定时刻的特定号码的来电信息。

2、CXCallUpdate：通话过程就是信息和状态的变化过程，CallKit的作用只是在于将通话状态和信息在系统接听界面和应用之间传递 ，通过provider请求进行处理；

3、CXAction/CXCallAction：电话操作载体类，细分包括（电话开始:CXStartCallAction、 接听:CXAnswerCallAction、暂停：CXSetHeldCallAction、静音：CXSetMutedCallAction、群组电话CXSetGroupCallAction、双频多音功能：CXPlayDTMFCallAction、挂断或拒接：CXEndCallAction  ）。

4、CXTransaction：操作执行类；CXCallController：话务控制器，每种action在配置好CXTransaction后都需要控制器CXCallController去向系统发起请求来响应操作：- (void)requestTransaction:(CXTransaction *)transaction completion:(void (^)(NSError *_Nullable error))completion;

5、CXProvider／CXProviderDelegate：使用CallKit代接收来电状态的VoIP应用都需要一个初始化一个CXProvider，比如有来电时通过provider告知系统帮我接听、要呼出电话时告知系统这条电话的基本信息、以及各种操作和状态的更新信息会通过协议代理传回应用；并需要设置一个代理类来接受处理CXProviderDelegate 代理任务操作（各种CXAction：接听、挂断、DTMF、免提等本地操作）。使用之前，通过 CXProviderConfiguration来配置app的具体信息（你的VoIP 自己的显示名称、是否要支持视频通话、最大会话分组数、logo、来电提示音等信息），以便在系统通话界面显示。

6、CXCallObserver可以设置一个代理来随时捕获电话信息的更新；



