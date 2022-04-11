//Created by Action Script Viewer - https://www.buraks.com/asv
package com.namsautam.haitac.fault
{
    import flash.display.MovieClip;
    import flash.text.TextField;
    import flash.display.SimpleButton;
    import flash.events.MouseEvent;
    import flash.net.navigateToURL;
    import flash.net.URLRequest;

    public class NoticePopup extends MovieClip 
    {

        public var errorMessage:TextField;
        public var overlay:MovieClip;
        public var closeBtn:SimpleButton;
        public var updateBtn:SimpleButton;
        private var _customInfo:Object;

        public function NoticePopup()
        {
            this.visible = false;
            this.errorMessage.text = "";
            this.overlay.mouseEnabled = true;
            this.closeBtn.addEventListener(MouseEvent.CLICK, this.onClose);
            this.updateBtn.visible = false;
            this.updateBtn.addEventListener(MouseEvent.CLICK, this.handleCustomAction);
        }

        public function show(_arg_1:String, _arg_2:Object=null):void
        {
            this.errorMessage.text = _arg_1;
            this.visible = true;
            this._customInfo = _arg_2;
            if (((_arg_2) && (_arg_2["link_update_version"])))
            {
                this.updateBtn.visible = true;
                this.closeBtn.visible = false;
            }
            else
            {
                this.updateBtn.visible = false;
                this.closeBtn.visible = true;
            };
        }

        private function handleCustomAction(_arg_1:MouseEvent):void
        {
            if (((this._customInfo) && (this._customInfo["link_update_version"])))
            {
                navigateToURL(new URLRequest(this._customInfo["link_update_version"]));
            };
        }

        public function hide():void
        {
            this.visible = false;
        }

        private function onClose(_arg_1:MouseEvent):void
        {
            this.hide();
        }


    }
}//package com.namsautam.haitac.fault
