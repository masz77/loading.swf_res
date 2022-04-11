//Created by Action Script Viewer - https://www.buraks.com/asv
package com.namsautam.haitac
{
    import flash.display.MovieClip;
    import com.namsautam.haitac.login.LoginPopup;
    import com.namsautam.haitac.fault.NoticePopup;
    import com.namsautam.haitac.serverlist.ServerListUI;
    import flash.text.TextField;
    import com.namsautam.haitac.storage.StorageManager;
    import com.namsautam.haitac.component.Components;
    import com.namsautam.haitac.config.Configurations;
    import flash.events.Event;
    import com.namsautam.haitac.keyboard.KeyBoardManager;
    import com.namsautam.haitac.api.Api;
    import flash.system.Capabilities;
    import flash.desktop.NativeApplication;
    import flash.desktop.SystemIdleMode;

    public class Main extends MovieClip 
    {

        public var loginPopup:LoginPopup;
        public var noticePopup:NoticePopup;
        public var serverList:ServerListUI;
        public var versionTxt:TextField;
        public var loading:MovieClip;
        private var hook:Function;

        public function Main()
        {
            StorageManager.init();
            Components.NoticePopup = this.noticePopup;
            Components.LoginPopup = this.loginPopup;
            Components.ServerListUI = this.serverList;
            Components.Loading = this.loading;
            Components.Main = this;
            this.noticePopup.visible = false;
            this.serverList.visible = false;
            this.loading.visible = false;
            this.versionTxt.text = ("Version: " + Configurations.VERSION);
            addEventListener(Event.ADDED_TO_STAGE, this.onAddedToStage);
        }

        public function setHook(_arg_1:Function):void
        {
            this.hook = _arg_1;
        }

        private function onAddedToStage(_arg_1:Event):void
        {
            removeEventListener(Event.ADDED_TO_STAGE, this.onAddedToStage);
            stage.addEventListener(Event.ACTIVATE, this.onAppActive);
            stage.addEventListener(Event.DEACTIVATE, this.onAppDeActive);
            KeyBoardManager.init(this.stage);
            Api.checkUpdate();
        }

        private function onAppDeActive(_arg_1:Event):void
        {
            if (Capabilities.os.toLowerCase().indexOf("windows") != -1)
            {
                return;
            };
            NativeApplication.nativeApplication.systemIdleMode = SystemIdleMode.NORMAL;
        }

        private function onAppActive(_arg_1:Event):void
        {
            if (Capabilities.os.toLowerCase().indexOf("windows") != -1)
            {
                return;
            };
            NativeApplication.nativeApplication.systemIdleMode = SystemIdleMode.KEEP_AWAKE;
        }

        public function loadTMain(_arg_1:String, _arg_2:Object):void
        {
            this.hook(_arg_2);
            this.cleanup();
        }

        private function cleanup():void
        {
            KeyBoardManager.destroy();
            while (this.numChildren > 0)
            {
                this.removeChildAt(0);
            };
            Components.NoticePopup = null;
            Components.LoginPopup = null;
            Components.ServerListUI = null;
            Components.Main = null;
            Components.Loading = null;
        }


    }
}//package com.namsautam.haitac
