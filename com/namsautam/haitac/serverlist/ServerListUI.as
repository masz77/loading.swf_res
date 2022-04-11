//Created by Action Script Viewer - https://www.buraks.com/asv
package com.namsautam.haitac.serverlist
{
    import flash.display.MovieClip;
    import com.namsautam.haitac.serverlist.cum.ServerCumUI;
    import flash.display.SimpleButton;
    import flash.text.TextField;
    import com.namsautam.haitac.api.dto.LoginResponse;
    import flash.events.MouseEvent;
    import com.namsautam.haitac.api.Api;
    import com.namsautam.haitac.api.dto.ServerListItem;

    public class ServerListUI extends MovieClip 
    {

        public var cumPanel:ServerCumUI;
        public var btnNewest:SimpleButton;
        public var btnMost:SimpleButton;
        public var newestHealth:HealthIndicator;
        public var mostHealth:HealthIndicator;
        public var btnNewestTxt:TextField;
        public var btnMostTxt:TextField;
        public var serverList:ServerListWithPaging;
        public var quickSearch:ServerSearchUI;
        private var data:LoginResponse;

        public function ServerListUI()
        {
            this.btnNewest.addEventListener(MouseEvent.CLICK, this.joinNewest);
            this.btnMost.addEventListener(MouseEvent.CLICK, this.joinMost0);
        }

        public function setData(_arg_1:LoginResponse):void
        {
            tabEnabled = false;
            tabChildren = false;
            this.data = _arg_1;
            this.btnNewestTxt.text = _arg_1.serverList.mostList[0].svName;
            this.newestHealth.setStatus(_arg_1.serverList.mostList[0].health);
            this.btnMostTxt.text = _arg_1.serverList.mostList[1].svName;
            this.mostHealth.setStatus(_arg_1.serverList.mostList[1].health);
            this.cumPanel.setData(_arg_1.serverList);
            this.quickSearch.setData(_arg_1.serverList.allList);
        }

        public function selectCumHandler(_arg_1:String):void
        {
            this.serverList.setData(this.data.serverList.getServerListByGroup(_arg_1));
        }

        private function joinMost0(_arg_1:MouseEvent):void
        {
            this.join(this.data.serverList.mostList[1]);
        }

        private function joinNewest(_arg_1:MouseEvent):void
        {
            this.join(this.data.serverList.mostList[0]);
        }

        private function join(_arg_1:ServerListItem):void
        {
            Api.join(_arg_1.slug);
        }


    }
}//package com.namsautam.haitac.serverlist
