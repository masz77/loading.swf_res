//Created by Action Script Viewer - https://www.buraks.com/asv
package com.namsautam.haitac.component
{
    import flash.display.SimpleButton;
    import flash.display.MovieClip;
    import flash.events.Event;

    public class ScrollBar_Y extends ScrollBarModel_Y 
    {

        public var minShowH:int = 0;
        public var scrollBtn:SimpleButton;
        public var scrollTrack:MovieClip;
        public var scrollTrackBg:MovieClip;
        public var arrow_Up:SimpleButton;
        public var arrow_Down:SimpleButton;
        private var myHeight:int = 60;

        public function ScrollBar_Y(_arg_1:int=60)
        {
            this.myHeight = _arg_1;
            addEventListener(Event.ADDED_TO_STAGE, this.initUICompHandler);
        }

        private function initUICompHandler(_arg_1:Event):void
        {
            removeEventListener(Event.ADDED_TO_STAGE, this.initUICompHandler);
            initUIComp(this.arrow_Up, this.arrow_Down, this.scrollBtn, this.scrollTrack);
            this.scrollTrackBg = this.scrollTrack.scrollTrackBg;
            this.init(this.myHeight);
        }

        override protected function init(_arg_1:int):void
        {
            this.visible = ((_arg_1 < this.minShowH) ? Boolean(false) : Boolean(true));
            this.resetScrollButtonSize(_arg_1, 1);
            _arg_1 = (_arg_1 - ((this.arrow_Down.height + this.arrow_Up.height) + 4));
            this.scrollTrackBg.height = _arg_1;
            this.scrollTrack.x = ((this.arrow_Up.width - this.scrollTrack.width) / 2);
            this.scrollTrack.y = (this.arrow_Up.height + 2);
            this.arrow_Down.y = ((this.scrollTrack.y + this.scrollTrack.height) + 2);
            this.scrollBtn.x = (((this.scrollTrack.width - this.scrollBtn.width) >> 1) + this.scrollTrack.x);
            this.scrollBtn.y = this.scrollTrack.y;
            this.minVal = this.scrollTrack.y;
            this.maxVal = ((this.scrollTrack.y + this.scrollTrack.height) - this.scrollBtn.height);
            this.step = ((this.maxVal - this.minVal) / 100);
        }

        public function setHeight(_arg_1:int):void
        {
            var _local_2:Number = this.progress;
            this.init(_arg_1);
            this.setProgress(_local_2);
        }

        public function resetScrollButtonSize(_arg_1:Number, _arg_2:Number):void
        {
            var _local_3:Number = (((_arg_1 > _arg_2) ? 1 : (_arg_1 / _arg_2)) * this.scrollTrackBg.height);
            var _local_4:Number = ((_local_3 < 15) ? Number(15) : Number(_local_3));
            this.scrollBtn.width = this.scrollBtn.width;
            this.scrollBtn.height = _local_4;
            this.maxVal = ((this.scrollTrack.y + this.scrollTrack.height) - this.scrollBtn.height);
            this.step = ((this.maxVal - this.minVal) / 100);
        }

        public function resetScrollButtonSizeByScroll(_arg_1:int, _arg_2:Number):void
        {
            var _local_3:Number = ((((_arg_1 == 1) ? 1 : ((_arg_2 - _arg_1) + 1)) / _arg_2) * this.scrollTrackBg.height);
            var _local_4:Number = ((_local_3 < 15) ? Number(15) : Number(_local_3));
            this.scrollBtn.width = this.scrollBtn.width;
            this.scrollBtn.height = _local_4;
            this.maxVal = ((this.scrollTrack.y + this.scrollTrack.height) - this.scrollBtn.height);
            this.step = ((this.maxVal - this.minVal) / 100);
        }


    }
}//package com.namsautam.haitac.component
