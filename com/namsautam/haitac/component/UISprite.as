//Created by Action Script Viewer - https://www.buraks.com/asv
package com.namsautam.haitac.component
{
    import flash.display.Sprite;
    import flash.display.DisplayObject;
    import flash.display.BitmapData;
    import flash.events.Event;
    import flash.geom.Rectangle;
    import flash.utils.Dictionary;
    import flash.display.MovieClip;
    import flash.display.DisplayObjectContainer;

    public class UISprite extends Sprite 
    {

        protected static var activeArea:Sprite = null;
        public static var stg:Sprite = null;
        public static const LEFT_TOP:String = "leftTop";
        public static const LEFT_MIDDLE:String = "leftMiddle";
        public static const LEFT_BOTTOM:String = "leftBottom";
        public static const CENTER_TOP:String = "centerTop";
        public static const CENTER_MIDDLE:String = "centerMiddle";
        public static const CENTER_BOTTOM:String = "centerBottom";
        public static const RIGHT_TOP:String = "rightTop";
        public static const RIGHT_MIDDLE:String = "rightMiddle";
        public static const RIGHT_BOTTOM:String = "rightBottom";

        private var showTip:Boolean = false;
        private var tipText:String = "";
        private var EventDict:Object;
        private var dicEvent:Object;
        protected var isStopPrg:Boolean = true;
        private var _position:String;
        protected var $defaultWidth:Number;
        protected var $defaultHeight:Number;
        protected var $hasDefaultSkin:Boolean;
        private var _isLive:Boolean = true;

        public function UISprite()
        {
            var _local_1:DisplayObject;
            super();
            this.EventDict = {};
            this.dicEvent = {};
            this.$hasDefaultSkin = ((numChildren) && (!(getChildAt(0))));
            if (this.$hasDefaultSkin)
            {
                this.$defaultWidth = width;
                this.$defaultHeight = height;
                scaleX = (scaleY = 1);
                _local_1 = getChildAt(0);
                if (_local_1)
                {
                    removeChild(_local_1);
                };
            };
        }

        public static function initial(_arg_1:Sprite):void
        {
            UISprite.stg = _arg_1;
        }

        public static function reActiveSize():void
        {
            if (((!(UISprite.activeArea.width == Components.stgW)) || (!(UISprite.activeArea.height == Components.stgH))))
            {
                UISprite.activeArea.graphics.clear();
                UISprite.activeArea.graphics.beginBitmapFill(new BitmapData(Components.stgW, Components.stgH));
                UISprite.activeArea.graphics.drawRect(0, 0, Components.stgW, Components.stgW);
                UISprite.activeArea.graphics.endFill();
                UISprite.activeArea.alpha = 0;
            };
        }


        public function get isLive():Boolean
        {
            return (this._isLive);
        }

        public function set isLive(_arg_1:Boolean):void
        {
            this._isLive = _arg_1;
        }

        protected function validateDisplay(_arg_1:int=0):void
        {
            this.addEventListener(Event.ENTER_FRAME, this.onRenderListener, false, _arg_1);
        }

        private function onRenderListener(_arg_1:Event):void
        {
            this.removeEventListener(Event.ENTER_FRAME, this.onRenderListener);
            this.updateDisplay();
        }

        protected function updateDisplay():void
        {
        }

        public function updateUI():void
        {
            this.validateDisplay();
        }

        public function nowUpdateUI():void
        {
            this.removeEventListener(Event.ENTER_FRAME, this.onRenderListener);
            this.updateDisplay();
        }

        public function getRectangle():Rectangle
        {
            return (this.getBounds(this.parent));
        }

        override public function addEventListener(_arg_1:String, _arg_2:Function, _arg_3:Boolean=false, _arg_4:int=0, _arg_5:Boolean=false):void
        {
            if (!this.dicEvent[_arg_1])
            {
                this.dicEvent[_arg_1] = {
                    "useCap":new Dictionary(true),
                    "noCap":new Dictionary(true)
                };
            };
            var _local_6:Dictionary = ((_arg_3) ? this.dicEvent[_arg_1].useCap : this.dicEvent[_arg_1].noCap);
            _local_6[_arg_2] = true;
            super.addEventListener(_arg_1, _arg_2, _arg_3, _arg_4, _arg_5);
        }

        override public function removeEventListener(_arg_1:String, _arg_2:Function, _arg_3:Boolean=false):void
        {
            if (!this.dicEvent[_arg_1])
            {
                return;
            };
            var _local_4:Dictionary = ((_arg_3) ? this.dicEvent[_arg_1].useCap : this.dicEvent[_arg_1].noCap);
            delete _local_4[_arg_1];
            super.removeEventListener(_arg_1, _arg_2, _arg_3);
        }

        public function clearAllEvent():void
        {
            var _local_1:*;
            var _local_2:*;
            var _local_3:*;
            var _local_4:Object;
            for (_local_1 in this.dicEvent)
            {
                _local_4 = this.dicEvent[_local_1];
                for (_local_2 in _local_4.useCap)
                {
                    delete _local_4.useCap[_local_2];
                    super.removeEventListener(_local_1, (_local_2 as Function), true);
                };
                for (_local_3 in _local_4.noCap)
                {
                    delete _local_4.noCap[_local_3];
                    super.removeEventListener(_local_1, (_local_3 as Function), false);
                };
                delete this.dicEvent[_local_1];
            };
        }

        public function dispose():void
        {
            this.clearAllEvent();
            this.clearAllChild(this);
        }

        public function clearAllChild(_arg_1:DisplayObjectContainer):void
        {
            var _local_2:DisplayObject;
            if ((_arg_1 is MovieClip))
            {
                MovieClip(_arg_1).stop();
            };
            while (_arg_1.numChildren > 0)
            {
                _local_2 = _arg_1.getChildAt(0);
                if (!_local_2) break;
                _arg_1.removeChild(_local_2);
                if ((_local_2 is DisplayObjectContainer))
                {
                    this.clearAllChild((_local_2 as DisplayObjectContainer));
                };
                _local_2 = null;
            };
        }

        public function setSize(_arg_1:int, _arg_2:int):void
        {
            super.width = _arg_1;
            super.height = _arg_2;
        }

        override public function set width(_arg_1:Number):void
        {
            this.setSize(_arg_1, height);
        }

        override public function set height(_arg_1:Number):void
        {
            this.setSize(width, _arg_1);
        }

        public function setTipText(_arg_1:String):void
        {
            this.tipText = _arg_1;
        }


    }
}//package com.namsautam.haitac.component
