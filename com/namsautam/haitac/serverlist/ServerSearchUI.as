//Created by Action Script Viewer - https://www.buraks.com/asv
package com.namsautam.haitac.serverlist
{
    import flash.display.MovieClip;
    import flash.text.TextField;
    import flash.display.SimpleButton;
    import com.namsautam.haitac.api.dto.ServerListItem;
    import com.namsautam.haitac.component.TextInputWrapper;
    import flash.events.MouseEvent;
    import com.namsautam.haitac.config.StringValues;
    import flash.events.FocusEvent;
    import flash.events.Event;
    import com.namsautam.haitac.api.Api;

    public class ServerSearchUI extends MovieClip 
    {

        public var inputText:TextField;
        public var joinBtn:SimpleButton;
        public var serverList:ServerSearchListUI;
        public var selectedItem:ServerListItem;
        public var inputTextWrapper:TextInputWrapper;
        public var focusOutHit:SimpleButton;
        private var listData:Array;
        private var lastInputTextValue:String = "";

        public function ServerSearchUI()
        {
            this.joinBtn.addEventListener(MouseEvent.CLICK, this.onJoinHandler);
            this.inputTextWrapper = TextInputWrapper.createTextInputWrapper(this.inputText, StringValues.INPUT_ID_SERVER);
            this.showServerList(false);
            this.inputText.addEventListener(FocusEvent.FOCUS_IN, this.onTextFocusIn);
            this.inputText.addEventListener(FocusEvent.FOCUS_OUT, this.onTextFocusOut);
            this.focusOutHit.addEventListener(MouseEvent.CLICK, this.onFocusOutHit);
        }

        private function onFocusOutHit(_arg_1:MouseEvent):void
        {
            this.showServerList(false);
        }

        private function onTextFocusOut(_arg_1:FocusEvent):void
        {
            this.removeEventListener(Event.ENTER_FRAME, this.onEnterFrame);
        }

        private function onTextFocusIn(_arg_1:FocusEvent):void
        {
            this.showServerList((!(this.inputTextWrapper.isEmpty())));
            this.addEventListener(Event.ENTER_FRAME, this.onEnterFrame);
        }

        private function onEnterFrame(_arg_1:Event):void
        {
            if (this.inputTextWrapper.isEmpty())
            {
                return;
            };
            if (this.hasChanged())
            {
                this.selectedItem = null;
                this.lastInputTextValue = this.inputText.text;
                this.showServerList(true);
                this.serverList.setData(this.getList(this.inputText.text), this.onItemSelected);
            };
        }

        private function hasChanged():Boolean
        {
            return (!(this.inputText.text == this.lastInputTextValue));
        }

        private function getList(_arg_1:String):Array
        {
            var _local_4:ServerListItem;
            var _local_5:String;
            var _local_2:Array = [];
            var _local_3:int;
            while (_local_3 < this.listData.length)
            {
                _local_4 = (this.listData[_local_3] as ServerListItem);
                _local_5 = _local_4.svName.toLowerCase();
                if (_local_5.indexOf(_arg_1.toLowerCase()) != -1)
                {
                    _local_2.push(_local_4);
                };
                _local_3++;
            };
            return (_local_2);
        }

        private function onJoinHandler(_arg_1:MouseEvent):void
        {
            if (this.selectedItem)
            {
                Api.join(this.selectedItem.slug);
            };
        }

        public function setData(_arg_1:Array):void
        {
            this.listData = _arg_1;
        }

        public function onItemSelected(_arg_1:ServerListItem):void
        {
            this.inputText.text = _arg_1.svName;
            this.selectedItem = _arg_1;
            this.showServerList(false);
        }

        private function showServerList(_arg_1:Boolean):void
        {
            this.focusOutHit.mouseEnabled = _arg_1;
            this.serverList.visible = _arg_1;
        }


    }
}//package com.namsautam.haitac.serverlist
