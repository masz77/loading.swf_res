//Created by Action Script Viewer - https://www.buraks.com/asv
package com.namsautam.haitac.login
{
    import flash.display.MovieClip;
    import flash.utils.Timer;
    import com.namsautam.haitac.config.Configurations;
    import flash.events.TimerEvent;
    import flash.display.Loader;
    import flash.events.Event;
    import flash.events.IOErrorEvent;
    import com.namsautam.haitac.log.Logger;
    import flash.net.URLRequest;
    import flash.events.MouseEvent;
    import flash.net.navigateToURL;
    import com.greensock.TweenLite;

    public class SlideComp extends MovieClip 
    {

        public var dots:SlideDotContainer;
        public var container:MovieClip;
        private var data:Array;
        private var counter:int = 0;
        private var loaders:Array = [];
        private var showIdx:int = 0;
        private var timer:Timer = new Timer(Configurations.SLIDESHOW_SHOW_TIME_MILLISECOND, 1);

        public function SlideComp()
        {
            this.dots.visible = false;
            this.dots.callBackFunc = this.dotClickHandler;
            this.timer.addEventListener(TimerEvent.TIMER_COMPLETE, this._timerCompleteHandler);
        }

        public function setData(_arg_1:Array):void
        {
            this.data = _arg_1;
            this.loadImages();
        }

        private function dotClickHandler(_arg_1:int):void
        {
            this.timer.reset();
            this.nextSlide(_arg_1);
            this.timer.start();
        }

        private function loadImages():void
        {
            var loader:Loader;
            this.loaders = [];
            var i:int;
            while (i < this.data.length)
            {
                loader = new Loader();
                this.loaders.push(loader);
                this.container.addChild(loader);
                loader.visible = false;
                loader.contentLoaderInfo.addEventListener(Event.COMPLETE, this.onCompleted);
                loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, function (_arg_1:IOErrorEvent):void
                {
                    Logger.log("Error loading image");
                });
                loader.load(new URLRequest(this.data[i]["slideImage"]));
                loader.addEventListener(MouseEvent.CLICK, this.onClicked);
                i = (i + 1);
            };
        }

        private function onClicked(_arg_1:MouseEvent):void
        {
            navigateToURL(new URLRequest(this.data[this.loaders.indexOf(_arg_1.target)]["link"]));
        }

        private function onCompleted(_arg_1:Event):void
        {
            this.counter++;
            if (this.counter == this.data.length)
            {
                this.startSlideShow();
            };
        }

        private function startSlideShow():void
        {
            this.showIdx = 0;
            this.counter = 0;
            this.dots.visible = true;
            this.dots.updateUI(this.showIdx);
            this.loaders[this.showIdx].visible = true;
            this.loaders[this.showIdx].alpha = 0;
            TweenLite.to(this.loaders[this.showIdx], Configurations.SLIDESHOW_TRANSITION_TIME_SECOND, {
                "alpha":1,
                "onComplete":this.onTweenComplted
            });
        }

        private function onTweenComplted():void
        {
            this.timer.reset();
            this.timer.repeatCount = 1;
            this.timer.start();
        }

        private function _timerCompleteHandler(_arg_1:TimerEvent):void
        {
            this.nextSlide();
        }

        private function nextSlide(idx:int=-1):void
        {
            if (idx == this.showIdx)
            {
                return;
            };
            TweenLite.to(this.loaders[this.showIdx], Configurations.SLIDESHOW_TRANSITION_TIME_SECOND, {
                "alpha":0,
                "onCompleteParams":[this.loaders[this.showIdx]],
                "onComplete":function (_arg_1:Loader):void
                {
                    _arg_1.visible = false;
                }
            });
            if (idx >= 0)
            {
                this.counter = idx;
            }
            else
            {
                this.counter++;
            };
            this.showIdx = (this.counter % this.data.length);
            this.dots.updateUI(this.showIdx);
            this.loaders[this.showIdx].visible = true;
            this.loaders[this.showIdx].alpha = 0;
            TweenLite.to(this.loaders[this.showIdx], Configurations.SLIDESHOW_TRANSITION_TIME_SECOND, {
                "alpha":1,
                "onComplete":this.onTweenComplted
            });
        }

        public function destroy():void
        {
            this.timer.reset();
            this.timer.stop();
            this.timer.removeEventListener(TimerEvent.TIMER_COMPLETE, this._timerCompleteHandler);
            var _local_1:int;
            while (_local_1 < this.loaders.length)
            {
                this.loaders[_local_1].contentLoaderInfo.removeEventListener(Event.COMPLETE, this.onCompleted);
                _local_1++;
            };
            this.loaders = [];
            this.data = [];
        }


    }
}//package com.namsautam.haitac.login
