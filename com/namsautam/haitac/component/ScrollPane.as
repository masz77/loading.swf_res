//Created by Action Script Viewer - https://www.buraks.com/asv
package com.namsautam.haitac.component
{
    import flash.display.Bitmap;
    import flash.display.BitmapData;
    import flash.geom.Rectangle;
    import flash.events.Event;
    import com.namsautam.haitac.enum.RenderPriority;
    import com.namsautam.haitac.event.ScrollBarEvent;
    import flash.events.MouseEvent;
    import flash.display.DisplayObject;
    import com.namsautam.haitac.enum.ScrollRenderMode;
    import flash.display.DisplayObjectContainer;

    public class ScrollPane extends UISprite 
    {

        public static var bmp:Bitmap = new Bitmap(new BitmapData(1, 1, true, 0));

        protected var maxW:int = 0;
        protected var maxH:int = 0;
        protected var pane:UISprite;
        public var scrollBar:ScrollBar_Y;
        private var paneHeight:int;
        private var _renderMode:int = 0;
        private var lockEvent:Boolean = false;

        public function ScrollPane(_arg_1:int, _arg_2:int)
        {
            this.pane = new UISprite();
            addChild(this.pane);
            this.maxW = _arg_1;
            this.maxH = _arg_2;
            this.scrollRect = new Rectangle(0, 0, _arg_1, _arg_2);
            this.init();
        }

        private function changeEvent(_arg_1:Event):void
        {
            if (this.lockEvent)
            {
                return;
            };
            this.updateUI();
        }

        override public function updateUI():void
        {
            validateDisplay(RenderPriority.low);
        }

        override public function dispose():void
        {
            this.pane.removeEventListener(Event.ADDED, this.changeEvent);
            this.pane.removeEventListener(Event.REMOVED, this.changeEvent);
            super.dispose();
        }

        public function set renderMode(_arg_1:int):void
        {
            this._renderMode = _arg_1;
        }

        private function init():void
        {
            this.scrollBar = new ScrollBar_Y(this.maxH);
            this.scrollBar.x = (this.maxW - this.scrollBar.width);
            this.addChild(this.scrollBar);
            this.scrollBar.addEventListener(ScrollBarEvent.Progress_Update, this.onScroll_Y);
            this.pane.addEventListener(MouseEvent.MOUSE_WHEEL, this.onWheel);
            this.pane.addEventListener(Event.ADDED, this.changeEvent);
            this.pane.addEventListener(Event.REMOVED, this.changeEvent);
            this.updateUI();
        }

        public function addToPaneAt(_arg_1:DisplayObject, _arg_2:int):void
        {
            this.pane.addChildAt(_arg_1, _arg_2);
        }

        public function addToPane(_arg_1:DisplayObject):void
        {
            this.pane.addChild(_arg_1);
        }

        public function scrollTo(_arg_1:Number):void
        {
            ((this.paneHeight > this.maxH) && (this.scrollBar.setProgress(_arg_1)));
        }

        public function delFromPane(_arg_1:DisplayObject):void
        {
            this.pane.removeChild(_arg_1);
        }

        override protected function updateDisplay():void
        {
            this.lockEvent = true;
            this.pane.addChild(bmp);
            this.paneHeight = this.pane.height;
            this.scrollBar.showMe = (this.pane.height > this.maxH);
            if (this.pane.height < this.maxH)
            {
                this.scrollBar.setProgress(0);
            }
            else
            {
                this.checkRender();
            };
            this.pane.removeChild(bmp);
            this.lockEvent = false;
            this.scrollBar.resetScrollButtonSize(this.maxH, this.paneHeight);
        }

        private function checkRender():void
        {
            if (this._renderMode == ScrollRenderMode.renderAll)
            {
                return;
            };
            this.clearRender(this.pane);
        }

        private function clearRender(_arg_1:DisplayObjectContainer):void
        {
            var _local_4:DisplayObject;
            var _local_5:Boolean;
            var _local_2:int = _arg_1.numChildren;
            var _local_3:int;
            while (_local_3 < _local_2)
            {
                _local_4 = _arg_1.getChildAt(_local_3);
                if ((_local_4 is DisplayObjectContainer))
                {
                    this.clearRender((_local_4 as DisplayObjectContainer));
                }
                else
                {
                    _local_5 = this.scrollRect.intersects(_local_4.getBounds(this));
                    if (_local_5 != _local_4.visible)
                    {
                        _local_4.visible = _local_5;
                    };
                };
                _local_3++;
            };
        }

        public function updateMaxHeight(_arg_1:int):void
        {
            this.maxH = _arg_1;
            this.scrollRect = new Rectangle(0, 0, this.maxW, _arg_1);
            this.scrollBar.setHeight(_arg_1);
            this.updateUI();
        }

        private function onScroll_Y(_arg_1:Event):void
        {
            this.pane.y = (((this.maxH - this.paneHeight) * this.scrollBar.progress) >> 0);
            this.checkRender();
        }

        private function onWheel(_arg_1:MouseEvent):void
        {
            if (this.paneHeight <= this.maxH)
            {
                return;
            };
            if (_arg_1.delta > 0)
            {
                this.scrollBar.addProgress(-0.1);
            }
            else
            {
                this.scrollBar.addProgress(0.1);
            };
        }

        public function set alwaysHideScrollBar(_arg_1:Boolean):void
        {
            if (_arg_1)
            {
                ((this.scrollBar.parent) && (this.scrollBar.parent.removeChild(this.scrollBar)));
            }
            else
            {
                this.addChild(this.scrollBar);
            };
        }


    }
}//package com.namsautam.haitac.component
