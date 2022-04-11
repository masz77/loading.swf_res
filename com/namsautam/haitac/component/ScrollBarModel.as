//Created by Action Script Viewer - https://www.buraks.com/asv
package com.namsautam.haitac.component
{
    import flash.display.MovieClip;
    import flash.display.Stage;

    public class ScrollBarModel extends MovieClip 
    {

        protected var fixVal:int = 0;
        protected var minVal:int = 0;
        protected var maxVal:int = 0;
        protected var step:Number = 0;
        protected var _moveStep:Number = 0.15;
        protected var activeStg:Stage;

        public function ScrollBarModel()
        {
            this.mouseEnabled = false;
        }

        public function set moveStep(_arg_1:Number):void
        {
            this._moveStep = _arg_1;
        }

        public function get moveStep():Number
        {
            return (this._moveStep);
        }

        public function set showMe(_arg_1:Boolean):void
        {
            this.visible = _arg_1;
        }

        public function get showMe():Boolean
        {
            return (this.visible);
        }


    }
}//package com.namsautam.haitac.component
