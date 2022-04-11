//Created by Action Script Viewer - https://www.buraks.com/asv
package com.namsautam.haitac.component
{
    import flash.display.SimpleButton;
    import flash.display.MovieClip;
    import flash.events.MouseEvent;
    import flash.events.Event;
    import flash.display.Stage;
    import com.namsautam.haitac.event.ScrollBarEvent;

    public class ScrollBarModel_Y extends ScrollBarModel 
    {

        private var arrow_Up:SimpleButton;
        private var arrow_Down:SimpleButton;
        private var scrollBtn:SimpleButton;
        private var scrollTrack:MovieClip;


        public function initUIComp(_arg_1:SimpleButton, _arg_2:SimpleButton, _arg_3:SimpleButton, _arg_4:MovieClip):void
        {
            this.arrow_Down = _arg_2;
            this.arrow_Up = _arg_1;
            this.scrollBtn = _arg_3;
            this.scrollTrack = _arg_4;
            this.scrollBtn.addEventListener(MouseEvent.MOUSE_DOWN, this.mouseDown);
            this.scrollTrack.addEventListener(MouseEvent.CLICK, this.trackMouseClick);
            this.arrow_Down.addEventListener(MouseEvent.CLICK, this.downClick);
            this.arrow_Up.addEventListener(MouseEvent.CLICK, this.upClick);
        }

        private function mouseDown(_arg_1:Event):void
        {
            this.fixVal = this.scrollBtn.mouseY;
            this.activeStg = this.stage;
            this.stage.addEventListener(MouseEvent.MOUSE_MOVE, this.mouseMove);
            this.stage.addEventListener(MouseEvent.MOUSE_UP, this.mouseUp);
        }

        private function mouseMove(_arg_1:MouseEvent):void
        {
            if (((((_arg_1.stageX < 5) || (_arg_1.stageX > (Stage(Components.Main.stage).width - 5))) || (_arg_1.stageY < 5)) || (_arg_1.stageY > (Stage(Components.Main.stage).height - 5))))
            {
                this.stopActive();
            };
            this.updateProgress(this.mouseY);
            _arg_1.updateAfterEvent();
        }

        private function mouseUp(_arg_1:Event):void
        {
            this.stopActive();
        }

        private function stopActive():void
        {
            this.activeStg.removeEventListener(MouseEvent.MOUSE_MOVE, this.mouseMove);
            this.activeStg.removeEventListener(MouseEvent.MOUSE_UP, this.mouseUp);
            this.activeStg = null;
        }

        private function updateProgress(_arg_1:int, _arg_2:Boolean=true):void
        {
            var _local_3:int = (_arg_1 - this.fixVal);
            if (_local_3 >= this.maxVal)
            {
                _local_3 = this.maxVal;
            };
            if (_local_3 <= this.minVal)
            {
                _local_3 = this.minVal;
            };
            this.scrollBtn.y = _local_3;
            if (_arg_2)
            {
                this.dispatchEvent(new Event(ScrollBarEvent.Progress_Update));
            };
        }

        protected function init(_arg_1:int):void
        {
        }

        private function trackMouseClick(_arg_1:Event):void
        {
            this.fixVal = (this.scrollBtn.height / 2);
            this.updateProgress(this.mouseY);
        }

        protected function downClick(_arg_1:Event):void
        {
            this.fixVal = 0;
            this.addProgress(this.moveStep);
        }

        protected function upClick(_arg_1:Event):void
        {
            this.fixVal = 0;
            this.addProgress((this.moveStep * -1));
        }

        public function addProgress(_arg_1:Number):void
        {
            this.fixVal = 0;
            this.updateProgress(((this.scrollBtn.y + ((this.step * 100) * _arg_1)) >> 0));
        }

        public function setProgress(_arg_1:Number, _arg_2:Boolean=true):void
        {
            this.fixVal = 0;
            this.updateProgress((this.minVal + ((this.maxVal - this.minVal) * _arg_1)), _arg_2);
        }

        public function get progress():Number
        {
            return ((this.scrollBtn.y - this.minVal) / (this.step * 100));
        }


    }
}//package com.namsautam.haitac.component
