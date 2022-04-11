//Created by Action Script Viewer - https://www.buraks.com/asv
package com.namsautam.haitac.login
{
    import flash.display.MovieClip;
    import flash.events.MouseEvent;

    public class SlideDotContainer extends MovieClip 
    {

        public var dot1:MovieClip;
        public var dot2:MovieClip;
        public var dot3:MovieClip;
        private var _callBackFunc:Function;

        public function SlideDotContainer()
        {
            this.dot1.addEventListener(MouseEvent.CLICK, this.onDot1);
            this.dot2.addEventListener(MouseEvent.CLICK, this.onDot2);
            this.dot3.addEventListener(MouseEvent.CLICK, this.onDot3);
        }

        private function onDot1(_arg_1:MouseEvent):void
        {
            this._callBackFunc(0);
        }

        private function onDot2(_arg_1:MouseEvent):void
        {
            this._callBackFunc(1);
        }

        private function onDot3(_arg_1:MouseEvent):void
        {
            this._callBackFunc(2);
        }

        public function updateUI(_arg_1:int):void
        {
            var _local_2:MovieClip = this[("dot" + (_arg_1 + 1))];
            var _local_3:* = 1;
            while (_local_3 < 4)
            {
                MovieClip(this[("dot" + _local_3)]).gotoAndStop(2);
                _local_3++;
            };
            if (_local_2)
            {
                _local_2.gotoAndStop(1);
            };
        }

        public function set callBackFunc(_arg_1:Function):void
        {
            this._callBackFunc = _arg_1;
        }


    }
}//package com.namsautam.haitac.login
