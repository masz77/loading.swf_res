//Created by Action Script Viewer - https://www.buraks.com/asv
package com.namsautam.haitac.serverlist
{
    import flash.display.MovieClip;
    import flash.text.TextField;
    import flash.display.SimpleButton;
    import com.namsautam.haitac.api.dto.ServerListItem;
    import flash.events.MouseEvent;
    import com.namsautam.haitac.api.Api;

    public class ServerListItemUI extends MovieClip 
    {

        public var textValue:TextField;
        public var hit:SimpleButton;
        public var status:HealthIndicator;
        private var itemData:ServerListItem;

        public function ServerListItemUI()
        {
            this.hit.addEventListener(MouseEvent.CLICK, this.joinHandler);
        }

        private function joinHandler(_arg_1:MouseEvent):void
        {
            Api.join(this.itemData.slug);
        }

        public function setData(_arg_1:ServerListItem):void
        {
            this.itemData = _arg_1;
            this.textValue.text = _arg_1.svName;
            this.status.setStatus(this.itemData.health);
        }


    }
}//package com.namsautam.haitac.serverlist
