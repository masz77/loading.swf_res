//Created by Action Script Viewer - https://www.buraks.com/asv
package com.namsautam.haitac.component
{
    import flash.display.MovieClip;
    import flash.display.SimpleButton;
    import flash.text.TextField;
    import flash.events.MouseEvent;

    public class CheckBox extends MovieClip 
    {

        public var hit:SimpleButton;
        public var labelTxt:TextField;
        private var _isCheck:Boolean = false;

        public function CheckBox()
        {
            gotoAndStop(1);
            this.hit.addEventListener(MouseEvent.CLICK, this.onTick);
        }

        public function setLabel(_arg_1:String):void
        {
            this.labelTxt.text = _arg_1;
        }

        private function onTick(_arg_1:MouseEvent):void
        {
            if (this._isCheck)
            {
                this.turnOff();
            }
            else
            {
                this.turnOn();
            };
        }

        protected function turnOn(_arg_1:Boolean=true):void
        {
            this._isCheck = true;
            gotoAndStop(2);
        }

        protected function turnOff(_arg_1:Boolean=true):void
        {
            this._isCheck = false;
            gotoAndStop(1);
        }

        public function get isCheck():Boolean
        {
            return (this._isCheck);
        }

        public function set isCheck(_arg_1:Boolean):void
        {
            this._isCheck = _arg_1;
            if (this._isCheck)
            {
                this.turnOn();
            }
            else
            {
                this.turnOff();
            };
        }


    }
}//package com.namsautam.haitac.component
