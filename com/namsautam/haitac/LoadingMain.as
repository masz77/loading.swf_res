//Created by Action Script Viewer - https://www.buraks.com/asv
package com.namsautam.haitac
{
    import flash.display.MovieClip;
    import flash.net.URLLoader;
    import flash.display.Loader;
    import cmodule.encrypt.CLibInit;
    import flash.events.Event;
    import flash.net.URLLoaderDataFormat;
    import flash.net.URLRequest;
    import flash.display.StageScaleMode;
    import flash.display.StageAlign;
    import flash.system.LoaderContext;
    import flash.system.ApplicationDomain;
    import flash.events.IOErrorEvent;
    import flash.external.ExternalInterface;
    import flash.utils.clearTimeout;
    import flash.utils.setTimeout;
    import flash.events.SecurityErrorEvent;

    public class LoadingMain extends MovieClip 
    {

        private var lib:Object;
        public var tips:MovieClip;
        public var serverList:Main;
        private var loadMC:*;
        private var loadList:Array;
        private var index:int = 0;
        private var urlXmlLoader:URLLoader;
        private var urlMainLoader:URLLoader;
        private var vars:Object = {};
        private var delay:Number = 500;
        private var intervalId:uint;
        private var loader:Loader;

        public function LoadingMain()
        {
            this.lib = new CLibInit().init();
            this.tips.visible = false;
            this.serverList.visible = true;
            this.serverList.setHook(this.startProcessToGame);
            addEventListener(Event.ADDED_TO_STAGE, this.onAddToStageHandler);
        }

        private function startProcessToGame(_arg_1:Object):void
        {
            this.vars = _arg_1;
            if (((this.vars.hasOwnProperty("swfURL")) && (this.vars.hasOwnProperty("configURL"))))
            {
                this.loadList = [this.vars["swfURL"], this.vars["configURL"]];
            };
            this.tips.visible = true;
            this.urlMainLoader = new URLLoader();
            this.urlMainLoader.dataFormat = URLLoaderDataFormat.BINARY;
            this.urlMainLoader.addEventListener(Event.COMPLETE, this.onLoadComplete);
            this.urlMainLoader.load(new URLRequest(this.loadList[this.index]));
            this.urlXmlLoader = new URLLoader();
            this.urlXmlLoader.addEventListener(Event.COMPLETE, this.onLoadXMLComplete);
        }

        private function onAddToStageHandler(_arg_1:Event):void
        {
            removeEventListener(Event.ADDED_TO_STAGE, this.onAddToStageHandler);
            stage.scaleMode = StageScaleMode.SHOW_ALL;
            stage.align = StageAlign.TOP_LEFT;
            stage.addEventListener(Event.RESIZE, this.onResize);
            this.reSize();
            this.onResize(null);
        }

        private function onLoadComplete(_arg_1:Event):void
        {
            this.index = (this.index + 1);
            this.urlXmlLoader.load(new URLRequest(this.loadList[this.index]));
        }

        private function onLoadXMLComplete(_arg_1:Event):void
        {
            this.addEventListener(Event.ENTER_FRAME, this.loadMainClass);
        }

        private function onComplete(_arg_1:Event):void
        {
        }

        private function loadMainClass(_arg_1:Event):void
        {
            this.removeEventListener(Event.ENTER_FRAME, this.loadMainClass);
            var _local_2:LoaderContext = new LoaderContext(false, ApplicationDomain.currentDomain);
            _local_2.allowCodeImport = true;
            this.loader = new Loader();
            this.loader.contentLoaderInfo.addEventListener(Event.COMPLETE, this.onLoadMainComplete);
            this.loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, this.onLoadMainError);
            this.loader.loadBytes(this.urlMainLoader.data, _local_2);
        }

        private function onLoadMainComplete(_arg_1:Event):void
        {
            if (!ApplicationDomain.currentDomain.hasDefinition("Main"))
            {
                ((ExternalInterface.available) && (ExternalInterface.call("alert", "Error loading main class!")));
                return;
            };
            var _local_2:Class = (ApplicationDomain.currentDomain.getDefinition("Main") as Class);
            this.loadMC = new (_local_2)();
            this.loadMC.initEncryption(this.lib);
            stage.removeEventListener(Event.RESIZE, this.onResize);
            this.tips.stop();
            this.removeChild(this.tips);
            this.loadMC.setLoadingParams(this.vars);
            this.loadMC.setTipsXML(new XML(this.urlXmlLoader.data));
            this.addChild(this.loadMC);
        }

        private function onLoadMainError(_arg_1:IOErrorEvent):void
        {
            ((ExternalInterface.available) && (ExternalInterface.call("alert", _arg_1.text)));
        }

        private function reSize():void
        {
            try
            {
                clearTimeout(this.intervalId);
                ((ExternalInterface.available) && (ExternalInterface.call("doResize")));
                return;
            }
            catch(err:Error)
            {
                intervalId = setTimeout(reSize, delay);
                return;
            };
        }

        private function onResize(_arg_1:Event):void
        {
            this.tips.x = (this.stage.stageWidth / 2);
            this.tips.y = (this.stage.stageHeight / 2);
        }

        private function onErrorHandler(_arg_1:IOErrorEvent):void
        {
            trace(("ERROR: " + _arg_1.text));
        }

        private function onSecurityErrorHandler(_arg_1:SecurityErrorEvent):void
        {
            throw (new Error(_arg_1.text));
        }


    }
}//package com.namsautam.haitac
