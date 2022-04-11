//Created by Action Script Viewer - https://www.buraks.com/asv
package com.namsautam.haitac.component
{
    import flash.display.MovieClip;
    import flash.display.Loader;
    import flash.display.Bitmap;
    import com.namsautam.haitac.config.Configurations;
    import com.namsautam.haitac.log.Logger;
    import flash.events.Event;
    import flash.events.IOErrorEvent;
    import flash.net.URLRequest;

    public class Captcha extends MovieClip 
    {

        private var loader:Loader;
        private var currentCaptcha:Bitmap;
        private var _isLoading:Boolean = false;


        public function load(_arg_1:String):void
        {
            if (this._isLoading)
            {
                return;
            };
            if (!_arg_1)
            {
                if (this.currentCaptcha != null)
                {
                    removeChild(this.currentCaptcha);
                };
                return;
            };
            this._isLoading = true;
            _arg_1 = _arg_1.replace("https", Configurations.PROTOCOL);
            Logger.log(("Captcha load: " + _arg_1));
            this.loader = new Loader();
            this.loader.contentLoaderInfo.addEventListener(Event.COMPLETE, this.completeHandler);
            this.loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, this.ioErrorHandler);
            this.loader.load(new URLRequest(_arg_1));
        }

        private function ioErrorHandler(_arg_1:IOErrorEvent):void
        {
            Logger.log("Captcha can't load");
            this._isLoading = false;
        }

        private function completeHandler(_arg_1:Event):void
        {
            if (this.currentCaptcha != null)
            {
                removeChild(this.currentCaptcha);
            };
            this.currentCaptcha = Bitmap(this.loader.content);
            addChild(this.currentCaptcha);
            this._isLoading = false;
        }


    }
}//package com.namsautam.haitac.component
