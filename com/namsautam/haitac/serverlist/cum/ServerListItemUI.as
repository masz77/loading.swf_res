//Created by Action Script Viewer - https://www.buraks.com/asv
package com.namsautam.haitac.serverlist.cum
{
    import flash.display.MovieClip;
    import flash.text.TextField;
    import flash.display.SimpleButton;

    public class ServerListItemUI extends MovieClip 
    {

        public var textValue:TextField;
        public var hit:SimpleButton;
        private var _itemData:String;


        public function setData(_arg_1:String):void
        {
            this.textValue.text = _arg_1;
            this._itemData = _arg_1;
        }

        public function get cumStr():String
        {
            return (this._itemData);
        }


    }
}//package com.namsautam.haitac.serverlist.cum
