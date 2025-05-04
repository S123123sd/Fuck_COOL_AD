#!/system/bin/sh

# 酷安去广告优化脚本
# 功能：禁用广告组件、清理广告残留文件
# 注意：需Root权限执行

AD_COMPONENTS=(
    'com.coolapk.market/com.bytedance.sdk.openadsdk.stub.server.DownloaderServerManager'
    'com.coolapk.market/com.bytedance.sdk.openadsdk.stub.activity.Stub_SingleTask_Activity_T'
    'com.coolapk.market/com.ss.android.socialbase.downloader.downloader.IndependentProcessDownloadService'
    'com.coolapk.market/com.bytedance.applog.collector.Collector'
    'com.coolapk.market/com.byted.live.lite.Activity_bytelive_singleInstance1'
    'com.coolapk.market/com.anythink.dlopt.common.service.ApkDownloadService'
    'com.coolapk.market/com.kwad.sdk.api.proxy.app.BaseFragmentActivity$ProfileVideoDetailActivity'
    'com.coolapk.market/com.tencent.android.tpush.honor.HonorMessageService'
    'com.coolapk.market/com.kwad.sdk.api.proxy.app.AdWebViewActivity'
    'com.coolapk.market/com.kwad.sdk.api.proxy.app.BaseFragmentActivity$GoodsPlayBackActivity'
    'com.coolapk.market/com.kwad.sdk.api.proxy.app.DownloadService'
    'com.coolapk.market/com.coolapk.market.view.ad.dpsdk.DrawVideoFullScreenActivity'
    'com.coolapk.market/com.ss.android.socialbase.downloader.downloader.DownloadService'
    'com.coolapk.market/com.kwad.sdk.api.proxy.app.BaseFragmentActivity$ChannelDetailActivity'
    'com.coolapk.market/com.miui.zeus.mimo.sdk.ad.reward.RewardVideoAdActivity'
    'com.coolapk.market/com.kwad.sdk.api.proxy.app.BaseFragmentActivity$FragmentActivity9'
    'com.coolapk.market/com.kwad.sdk.api.proxy.app.BaseFragmentActivity$FragmentActivity7'
    'com.coolapk.market/com.anythink.basead.ui.ATPortraitTranslucentActivity'
    'com.coolapk.market/com.kwad.sdk.api.proxy.app.BaseFragmentActivity$FragmentActivity8'
    'com.coolapk.market/com.bytedance.sdk.dp.act.DPProvider'
    'com.coolapk.market/com.tencent.android.tpush.inappmessage.InAppMessageActivity'
    'com.coolapk.market/com.byted.live.lite.ServerManager_push'
    'com.coolapk.market/com.meizu.cloud.pushsdk.MzPushSystemReceiver'
    'com.coolapk.market/com.kwad.sdk.api.proxy.app.BaseFragmentActivity$FragmentActivity5'
    'com.coolapk.market/com.bytedance.org.chromium.content.app.SandboxedProcessService2'
    'com.coolapk.market/com.kwad.sdk.api.proxy.app.BaseFragmentActivity$FragmentActivity6'
    'com.coolapk.market/com.bytedance.org.chromium.content.app.SandboxedProcessService1'
    'com.coolapk.market/com.kwad.sdk.api.proxy.app.BaseFragmentActivity$FragmentActivity3'
    'com.coolapk.market/com.bytedance.org.chromium.content.app.SandboxedProcessService0'
    'com.coolapk.market/com.kwad.sdk.api.proxy.app.BaseFragmentActivity$FragmentActivity4'
    'com.coolapk.market/com.kwad.sdk.api.proxy.app.BaseFragmentActivity$FragmentActivity1'
    'com.coolapk.market/com.bytedance.org.chromium.content.app.SandboxedProcessService6'
    'com.coolapk.market/com.kwad.sdk.api.proxy.app.BaseFragmentActivity$FragmentActivity2'
    'com.coolapk.market/com.bytedance.org.chromium.content.app.SandboxedProcessService5'
    'com.coolapk.market/com.bytedance.org.chromium.content.app.SandboxedProcessService4'
    'com.coolapk.market/com.bytedance.ug.sdk.luckycat.impl.new_pendant.timer_red_packet.TimerRedPacketActivity'
    'com.coolapk.market/com.bytedance.org.chromium.content.app.SandboxedProcessService3'
    'com.coolapk.market/com.bytedance.sdk.dp.stub.activity.Stub_SingleTop_Portrait_AppCompatActivity7'
    'com.coolapk.market/com.bytedance.ug.sdk.luckycat.impl.wxauth.WXEntryActivity'
    'com.coolapk.market/com.bytedance.sdk.dp.host.act.DPNewsDetailActivity'
    'com.coolapk.market/com.tencent.android.tpush.TpnsActivity'
    'com.coolapk.market/com.bytedance.sdk.dp.host.act.DPReportActivity'
    'com.coolapk.market/com.bytedance.sdk.dp.stub.activity.Stub_SingleTop_Portrait_AppCompatActivity1'
    'com.coolapk.market/com.bytedance.sdk.dp.stub.activity.Stub_SingleTop_Portrait_AppCompatActivity2'
    'com.coolapk.market/com.bytedance.sdk.dp.stub.activity.Stub_SingleTop_Portrait_AppCompatActivity3'
    'com.coolapk.market/com.bytedance.sdk.dp.stub.activity.Stub_SingleTop_Portrait_AppCompatActivity4'
    'com.coolapk.market/com.bytedance.ug.sdk.luckycat.impl.red.view.RedPacketDoneDialogActivity'
    'com.coolapk.market/com.bytedance.sdk.dp.stub.activity.Stub_SingleTop_Portrait_AppCompatActivity5'
    'com.coolapk.market/com.beizi.ad.internal.activity.BeiZiDownloadDialogActivity'
    'com.coolapk.market/com.bytedance.sdk.dp.stub.activity.Stub_SingleTop_Portrait_AppCompatActivity6'
    'com.coolapk.market/com.anythink.dlopt.common.NotificationBroadcaseReceiver'
    'com.coolapk.market/com.coolapk.market.view.ad.interstitial.InterstitialAdActivity'
    'com.coolapk.market/com.bytedance.sdk.openadsdk.stub.activity.Stub_Activity'
    'com.coolapk.market/com.kwad.sdk.api.proxy.app.BaseFragmentActivity$ProfileHomeActivity'
    'com.coolapk.market/com.byted.live.lite.Activity_bytelive_standard'
    'com.coolapk.market/com.alipay.sdk.app.H5PayActivity'
    'com.coolapk.market/com.beizi.ad.internal.activity.BeiZiRewardVideoActivity'
    'com.coolapk.market/com.kwad.sdk.api.proxy.app.FileDownloadService$SharedMainProcessService'
    'com.coolapk.market/com.bytedance.sdk.openadsdk.TTFileProvider'
    'com.coolapk.market/com.alipay.sdk.app.H5OpenAuthActivity'
    'com.coolapk.market/com.kwad.sdk.api.proxy.app.AdSdkFileProvider'
    'com.coolapk.market/com.qq.e.ads.PortraitADActivity'
    'com.coolapk.market/com.anythink.basead.ui.ATLandscapeTranslucentActivity'
    'com.coolapk.market/com.huawei.hms.aaid.InitProvider'
    'com.coolapk.market/com.ss.android.downloadlib.addownload.compliance.AppPrivacyPolicyActivity'
    'com.coolapk.market/com.kwad.sdk.api.proxy.app.BaseFragmentActivity$TubeProfileActivity'
    'com.coolapk.market/com.kwad.sdk.api.proxy.app.FeedDownloadActivity'
    'com.coolapk.market/com.kwad.sdk.api.proxy.app.BaseFragmentActivity$FragmentActivitySingleInstance2'
    'com.coolapk.market/com.kwad.sdk.api.proxy.app.BaseFragmentActivity$FragmentActivitySingleInstance1'
    'com.coolapk.market/com.huawei.hms.support.api.push.TransActivity'
    'com.coolapk.market/com.qq.e.comm.GDTFileProvider'
    'com.coolapk.market/com.byted.live.lite.Activity_main_singleTask2'
    'com.coolapk.market/com.byted.live.lite.Activity_main_singleTask1'
    'com.coolapk.market/com.alibaba.baichuan.trade.biz.auth.AlibcAuthActivity'
    'com.coolapk.market/com.byted.live.lite.Activity_bytelive_singleTask4'
    'com.coolapk.market/com.bytedance.novel.channel.NovelWebActivity'
    'com.coolapk.market/com.kwad.sdk.api.proxy.app.BaseFragmentActivity$RequestInstallPermissionActivity'
    'com.coolapk.market/com.byted.live.lite.Activity_main_singleTask4'
    'com.coolapk.market/com.byted.live.lite.Activity_main_singleTask3'
    'com.coolapk.market/com.miui.zeus.mimo.sdk.view.WebViewActivity'
    'com.coolapk.market/com.qq.e.ads.LandscapeADActivity'
    'com.coolapk.market/com.byted.live.lite.Activity_bytelive_singleTask1'
    'com.coolapk.market/com.byted.live.lite.Activity_bytelive_singleTask2'
    'com.coolapk.market/com.byted.live.lite.Activity_bytelive_singleTask3'
    'com.coolapk.market/com.bytedance.org.chromium.content.app.SandboxedProcessService9'
    'com.coolapk.market/com.bytedance.org.chromium.content.app.SandboxedProcessService8'
    'com.coolapk.market/com.bytedance.org.chromium.content.app.SandboxedProcessService7'
    'com.coolapk.market/com.beizi.ad.internal.activity.DownloadAppInfoActivity'
    'com.coolapk.market/com.bytedance.sdk.dp.host.act.DPSearchActivity'
    'com.coolapk.market/com.kwad.sdk.api.proxy.app.BaseFragmentActivity$EpisodeDetailActivity'
    'com.coolapk.market/com.bytedance.ies.xbridge.system.activity.GetPermissionActivity'
    'com.coolapk.market/com.bytedance.sdk.openadsdk.stub.activity.Stub_SingleTask_Activity'
    'com.coolapk.market/com.qq.e.comm.DownloadService'
    'com.coolapk.market/com.byted.live.lite.Activity_main_singleTop2'
    'com.coolapk.market/com.byted.live.lite.Activity_main_singleTop1'
    'com.coolapk.market/com.bytedance.sdk.openadsdk.multipro.TTMultiProvider'
    'com.coolapk.market/com.xunmeng.amiibo.rewardvideo.RewardVideoAdActivity'
    'com.coolapk.market/com.bytedance.android.openliveplugin.stub.activity.DouyinAuthorizeActivityProxy'
    'com.coolapk.market/com.byted.live.lite.Activity_main_singleTop6'
    'com.coolapk.market/com.byted.live.lite.Activity_main_singleTop5'
    'com.coolapk.market/com.qq.e.ads.ADActivity'
    'com.coolapk.market/com.byted.live.lite.Activity_main_singleTop4'
    'com.coolapk.market/com.byted.live.lite.Activity_main_singleTop3'
    'com.coolapk.market/com.bytedance.sdk.dp.host.act.DPHomePageActivity'
    'com.coolapk.market/com.bytedance.pangle.provider.MainProcessProviderProxy'
    'com.coolapk.market/com.bytedance.pangrowth.reward.activity.WXConfigAlertDialogActivity'
    'com.coolapk.market/com.bytedance.ug.sdk.luckycat.impl.receiver.ShortcutReceiver'
    'com.coolapk.market/com.byted.live.lite.Activity_main_singleInstance1'
    'com.coolapk.market/com.bytedance.pangrowth.reward.StubActivity$AppCompat_main_singleTop1'
    'com.coolapk.market/com.ss.android.downloadlib.activity.JumpKllkActivity'
    'com.coolapk.market/com.alibaba.alibclinkpartner.smartlink.ALPEntranceActivity'
    'com.coolapk.market/com.bytedance.ug.sdk.luckycat.impl.common_done_dialog.CommonDoneDialogActivity'
    'com.coolapk.market/com.kwad.sdk.api.proxy.app.BaseFragmentActivity$FragmentActivitySingleTop1'
    'com.coolapk.market/com.kwad.sdk.api.proxy.app.BaseFragmentActivity$FragmentActivitySingleTop2'
    'com.coolapk.market/com.alipay.sdk.app.PayResultActivity'
    'com.coolapk.market/com.byted.live.lite.Activity_bytelive_singleTop6'
    'com.coolapk.market/com.bytedance.sdk.dp.host.act.DPDrawPlayActivity'
    'com.coolapk.market/com.bytedance.sdk.dp.stub.activity.Stub_Standard_Portrait_AppCompatActivity_T'
    'com.coolapk.market/com.kwad.sdk.api.proxy.app.BaseFragmentActivity$LandscapeFragmentActivitySingleInstance2'
    'com.coolapk.market/com.kwad.sdk.api.proxy.app.BaseFragmentActivity$LandscapeFragmentActivitySingleInstance1'
    'com.coolapk.market/com.byted.live.lite.Activity_bytelive_singleTop2'
    'com.coolapk.market/com.byted.live.lite.Activity_bytelive_singleTop3'
    'com.coolapk.market/com.byted.live.lite.Activity_bytelive_singleTop4'
    'com.coolapk.market/com.ss.android.socialbase.appdownloader.RetryJobSchedulerService'
    'com.coolapk.market/com.ss.android.socialbase.downloader.downloader.SqlDownloadCacheService'
    'com.coolapk.market/com.byted.live.lite.Activity_bytelive_singleTop5'
    'com.coolapk.market/com.beizi.ad.DownloadService'
    'com.coolapk.market/com.huawei.android.hms.tpns.HWHmsMessageService'
    'com.coolapk.market/com.byted.live.lite.Activity_bytelive_singleTop1'
    'com.coolapk.market/com.tencent.tpns.baseapi.base.SettingsContentProvider'
    'com.coolapk.market/com.ss.android.socialbase.appdownloader.view.DownloadTaskDeleteActivity'
    'com.coolapk.market/com.xunmeng.pinduoduo.apm4sdk.crash.service.CrashReportIntentService'
    'com.coolapk.market/com.bytedance.ug.sdk.luckycat.impl.privacy.PrivacyDialogActivity'
    'com.coolapk.market/com.tencent.android.mipush.XMPushMessageReceiver'
    'com.coolapk.market/com.tencent.android.tpush.XGVipPushKAProvider'
    'com.coolapk.market/com.bytedance.sdk.open.douyin.ui.DouYinWebAuthorizeActivity'
    'com.coolapk.market/com.alibaba.baichuan.android.trade.ui.AlibcWebViewActivity'
    'com.coolapk.market/com.bytedance.ug.sdk.luckycat.impl.new_pendant.timer_red_packet.TimerRedPacketResultActivity'
    'com.coolapk.market/com.bytedance.sdk.openadsdk.stub.activity.Stub_Standard_Activity_T'
    'com.coolapk.market/com.anythink.dlopt.common.ApkFileProvider'
    'com.coolapk.market/com.byted.live.lite.Activity_main_standard'
    'com.coolapk.market/com.anythink.basead.ui.ATPortraitActivity'
    'com.coolapk.market/com.bytedance.sdk.dp.host.act.DPAuthor2Activity'
    'com.coolapk.market/com.anythink.core.activity.AnyThinkGdprAuthActivity'
    'com.coolapk.market/com.anythink.basead.ui.RewardExitConfirmDialogActivity'
    'com.coolapk.market/com.tencent.android.tpush.rpc.XGRemoteService'
    'com.coolapk.market/com.qq.e.ads.RewardvideoLandscapeADActivity'
    'com.coolapk.market/com.tencent.android.tpush.XGPushReceiver'
    'com.coolapk.market/com.anythink.basead.ui.ATLandscapeActivity'
    'com.coolapk.market/com.bytedance.sdk.openadsdk.stub.activity.Stub_Standard_Activity'
    'com.coolapk.market/com.alibaba.wireless.security.open.middletier.fc.ui.ContainerActivity'
    'com.coolapk.market/com.alibaba.baichuan.trade.biz.login.LoginBroadcastReceiver'
    'com.coolapk.market/com.anythink.dlopt.activity.ApkConfirmDialogActivity'
    'com.coolapk.market/com.qq.e.ads.DialogActivity'
    'com.coolapk.market/com.kwad.sdk.api.proxy.app.FileDownloadService$SeparateProcessService'
    'com.coolapk.market/com.coolapk.market.view.ad.DrawNativeExpressVideoActivity'
    'com.coolapk.market/com.tencent.android.tpush.service.XGVipPushService'
    'com.coolapk.market/com.bytedance.sdk.openadsdk.stub.activity.Stub_Standard_Portrait_Activity'
    'com.coolapk.market/com.kwad.sdk.api.proxy.app.KsFullScreenLandScapeVideoActivity'
    'com.coolapk.market/com.miui.zeus.mimo.sdk.ad.reward.RewardVideoAdActivityNew'
    'com.coolapk.market/com.bytedance.ug.sdk.luckycat.impl.browser.LuckyCatBrowserActivity'
    'com.coolapk.market/com.qq.e.ads.RewardvideoPortraitADActivity'
    'com.coolapk.market/com.ss.android.socialbase.downloader.impls.DownloadHandleService'
    'com.coolapk.market/com.bytedance.sdk.dp.stub.activity.Stub_SingleTop_Portrait_AppCompatActivity_DramaDetail'
    'com.coolapk.market/com.bytedance.pangrowth.reward.StubActivity$Activity_main_standard'
    'com.coolapk.market/com.kwad.sdk.api.proxy.app.BaseFragmentActivity$DeveloperConfigActivity'
    'com.coolapk.market/com.bytedance.novel.view.NovelReaderActivity'
    'com.coolapk.market/com.ss.android.downloadlib.addownload.compliance.AppDetailInfoActivity'
    'com.coolapk.market/com.bytedance.android.openliveplugin.process.server.LiveServerManager'
    'com.coolapk.market/com.kwad.sdk.api.proxy.app.BaseFragmentActivity$FragmentActivity10'
    'com.coolapk.market/com.huawei.hms.activity.BridgeActivity'
    'com.coolapk.market/com.kwad.sdk.api.proxy.app.BaseFragmentActivity$KsTrendsActivity'
    'com.coolapk.market/com.anythink.china.activity.TransparentActivity'
    'com.coolapk.market/com.bytedance.sdk.dp.host.act.DPBrowserActivity'
    'com.coolapk.market/com.beizi.ad.internal.activity.BeiZiInterstitialActivity'
    'com.coolapk.market/com.kwad.sdk.api.proxy.app.BaseFragmentActivity$LandscapeFragmentActivity'
    'com.coolapk.market/com.bytedance.sdk.openadsdk.stub.activity.Stub_Standard_Landscape_Activity'
    'com.coolapk.market/com.kwad.sdk.api.proxy.app.ServiceProxyRemote'
    'com.coolapk.market/com.kwad.sdk.api.proxy.app.BaseFragmentActivity$TubeDetailActivity'
    'com.coolapk.market/com.tencent.android.tpush.SettingsContentProvider'
    'com.coolapk.market/com.bytedance.sdk.openadsdk.stub.server.MainServerManager'
    'com.coolapk.market/com.ss.android.downloadlib.activity.TTDelegateActivity'
    'com.coolapk.market/com.kwad.sdk.api.proxy.app.KsFullScreenVideoActivity'
    'com.coolapk.market/com.tencent.tpns.mqttchannel.services.MqttService'
    'com.coolapk.market/com.beizi.ad.AdActivity'
    'com.coolapk.market/com.bytedance.sdk.dp.host.core.privacy.DPPrivacySettingActivity'
    'com.coolapk.market/com.bytedance.ug.sdk.luckycat.impl.browser.LuckyCatBrowserExposeActivity'
    'com.coolapk.market/com.tencent.android.tpush.XGPushProvider'
    'com.coolapk.market/com.bytedance.ug.sdk.luckycat.impl.stubproxy.LuckyCatBrowserExposeStubProxy'
    'com.coolapk.market/com.coolapk.market.view.ad.DrawECMallActivity'
    'com.coolapk.market/com.anythink.core.basead.ui.web.WebLandPageActivity'
    'com.coolapk.market/com.bytedance.sdk.dp.host.act.DPDramaDetailActivity'
    'com.coolapk.market/com.kwad.sdk.api.proxy.app.KsRewardVideoActivity'
    'com.coolapk.market/com.bytedance.applog.migrate.MigrateDetectorActivity'
    'com.coolapk.market/com.ss.android.downloadlib.core.download.DownloadReceiver'
    'com.coolapk.market/com.huawei.hms.activity.EnableServiceActivity'
    'com.coolapk.market/com.coolapk.market.view.splash.SplashAdActivity'
    'com.coolapk.market/com.ss.android.socialbase.appdownloader.view.JumpUnknownSourceActivity'
    'com.coolapk.market/com.bytedance.pangrowth.reward.StubActivity$AppCompat_main_standard'
    'com.coolapk.market/com.kwad.sdk.api.proxy.app.BaseFragmentActivity$LandscapeFragmentActivitySingleTop2'
    'com.coolapk.market/com.miui.zeus.landingpage.sdk.activity.WebViewActivity'
    'com.coolapk.market/com.kwad.sdk.api.proxy.app.BaseFragmentActivity$LandscapeFragmentActivitySingleTop1'
    'com.coolapk.market/com.bytedance.ug.sdk.luckycat.impl.withdraw.view.WithDrawResultDialogActivity'
    'com.coolapk.market/com.anythink.basead.ui.activity.ATMixSplashActivity'
    'com.coolapk.market/com.ss.android.socialbase.downloader.notification.DownloadNotificationService'
    'com.coolapk.market/com.kwad.sdk.api.proxy.app.BaseFragmentActivity$LandscapeFragmentActivitySingleTask2'
    'com.coolapk.market/com.kwad.sdk.api.proxy.app.BaseFragmentActivity$LandscapeFragmentActivitySingleTask1'
    'com.coolapk.market/com.kwad.sdk.api.proxy.app.KSRewardLandScapeVideoActivity'
    'com.coolapk.market/com.huawei.hms.support.api.push.service.HmsMsgService'
    'com.coolapk.market/com.bytedance.pangrowth.reward.core.helper.DefaultDrawVideoFullScreenActivity'
    'com.coolapk.market/com.byted.live.lite.ServerManager_bytelive'
    'com.coolapk.market/com.tencent.android.tpush.InnerTpnsActivity'
    'com.coolapk.market/com.bytedance.pangle.FileProvider'
    'com.coolapk.market/com.bytedance.ug.sdk.luckycat.impl.red.view.RedPacketDialogActivity'
    'com.coolapk.market/com.bytedance.android.openliveplugin.stub.activity.DouyinAuthorizeActivityLiveProcessProxy'
    'com.coolapk.market/com.ss.android.socialbase.appdownloader.DownloadHandlerService'
)

AD_RESIDUE=(
    /data/app/*/com.coolapk.market*/lib/arm64/libmetasec_ml.so
    /data/app/*/com.coolapk.market*/lib/arm64/libpangleflipped.so
    /data/app/*/com.coolapk.market*/lib/arm64/libzeus_direct_dex.so
    /data/app/*/com.coolapk.market*/lib/arm64/libnesec.so
    /data/app/*/com.coolapk.market*/lib/arm64/libnesec-x86.so
    /data/app/*/com.coolapk.market*/lib/arm64/libNetHTProtect.so
    /data/data/com.coolapk.market/cache/*
    /data/data/com.coolapk.market/code_cache/*
    /data/media/0/Android/data/com.coolapk.market/cache/*
    /data/media/0/Android/data/com.coolapk.market/files/TTCache/pangle_com.byted.pangle/*
    /data/data/com.coolapk.market/app_tt_pangle_bykv_file/pangle_com.byted.pangle/*
    /data/data/com.coolapk.market/databases/anythink*
    /data/data/com.coolapk.market/databases/pangle*
    /data/data/com.coolapk.market/files/anythink/*
    /data/data/com.coolapk.market/files/pangle*
    /data/data/com.coolapk.market/files/.*
)

disable_ads() {
    echo "[1/3] 正在禁用广告组件..."
    for component in "${AD_COMPONENTS[@]}"; do
        pm disable "com.coolapk.market/${component}" >/dev/null 2>&1
        echo "已禁用组件: ${component}"
    done
}

clean_cache() {
    echo "[2/3] 正在清理广告缓存..."
    for path in "${AD_RESIDUE[@]}"; do
        rm -rf "$path" 2>/dev/null
        echo "已清理: ${path}"
    done
}

force_stop_app() {
    echo "[3/3] 强制停止酷安..."
    am force-stop com.coolapk.market
    echo "操作完成！"
}

main() {
    disable_ads
    clean_cache
    force_stop_app
}

main "$@"