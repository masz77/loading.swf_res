//Created by Action Script Viewer - https://www.buraks.com/asv
package com.namsautam.haitac.serverlist
{
    import flash.display.MovieClip;
    import flash.text.TextField;
    import flash.display.SimpleButton;
    import com.namsautam.haitac.api.dto.ServerListItem;
    import flash.events.MouseEvent;

    public class ServerSearchListItemUI extends MovieClip 
    {

        public var itemTxt:TextField;
        public var hit:SimpleButton;
        private var data:ServerListItem;
        private var callback:Function;

        public function ServerSearchListItemUI()
        {
            this.hit.addEventListener(MouseEvent.CLICK, this.onSelectHandler);
        }

        private function onSelectHandler(_arg_1:MouseEvent):void
        {
            this.callback(this.data);
        }

        public function setData(_arg_1:ServerListItem, _arg_2:Function):void
        {
            this.data = _arg_1;
            this.itemTxt.text = _arg_1.svName;
            this.callback = _arg_2;
        }


    }
}//package com.namsautam.haitac.serverlist
