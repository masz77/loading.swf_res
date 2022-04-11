//Created by Action Script Viewer - https://www.buraks.com/asv
package com.namsautam.haitac.api
{
    import com.namsautam.haitac.component.Components;
    import com.namsautam.haitac.config.Configurations;
    import com.namsautam.haitac.log.Logger;
    import flash.net.URLRequest;
    import flash.net.URLLoader;
    import flash.events.Event;
    import com.namsautam.haitac.api.dto.Response;
    import flash.events.IOErrorEvent;
    import flash.events.SecurityErrorEvent;
    import com.hurlant.util.Hex;
    import flash.utils.ByteArray;
    import com.hurlant.crypto.Crypto;

    public class RestClient 
    {

        public static var token:String = "";


        public static function executeGet(api:String, params:Object, success:Function, fail:Function, responseClass:Class=null):void
        {
            var urlStr:String;
            Components.showLoading();
            params[Params.VERSION] = Configurations.VERSION;
            params[Params.WS_TIME] = unixTime();
            params[Params.WS_API] = api;
            params[Params.WS_AGENT_ID] = Configurations.AGENT_ID;
            if (RestClient.token != "")
            {
                params[Params.TOKEN] = RestClient.token;
            };
            params[Params.WS_SIGNATURE] = calcSignature(params);
            urlStr = ((((Configurations.PROTOCOL + "://") + Configurations.HOST) + "/?") + getFullParamString(params));
            Logger.log(("RestClient >>>> " + urlStr));
            var urlRequest:URLRequest = new URLRequest(urlStr);
            urlRequest.method = "GET";
            var loader:URLLoader = new URLLoader();
            loader.addEventListener(Event.COMPLETE, function (_arg_1:Event):*
            {
                var _local_3:Response;
                Components.hideLoading();
                var _local_2:String = URLLoader(_arg_1.target).data;
                Logger.log(("RestClient <<<< " + _local_2));
                if (responseClass)
                {
                    _local_3 = new responseClass();
                }
                else
                {
                    _local_3 = new Response();
                };
                _local_3.parse(_local_2);
                if (_local_3.success)
                {
                    if (success != null)
                    {
                        success(_local_3);
                    };
                }
                else
                {
                    Components.NoticePopup.show(_local_3.message, _local_3.data);
                    if (fail != null)
                    {
                        fail(_local_3);
                    };
                };
            });
            loader.addEventListener(IOErrorEvent.IO_ERROR, onError);
            loader.addEventListener(SecurityErrorEvent.SECURITY_ERROR, onError);
            try
            {
                loader.load(urlRequest);
            }
            catch(e:Error)
            {
                Components.hideLoading();
                Logger.log(("RestClient error on url : " + urlStr));
                Logger.log(e.getStackTrace());
            };
        }

        private static function onError(_arg_1:Event):void
        {
            Logger.log("RestClient requestError");
            Logger.log(_arg_1);
            Components.hideLoading();
        }

        private static function calcSignature(_arg_1:Object):String
        {
            var _local_3:String;
            var _local_4:String;
            var _local_5:String;
            var _local_2:Array = [];
            for (_local_3 in _arg_1)
            {
                if (_local_3 != Params.WS_AGENT_ID)
                {
                    if (_local_3 != Params.WS_SIGNATURE)
                    {
                        _local_2.push(_local_3);
                    };
                };
            };
            _local_2.sort(Array.CASEINSENSITIVE);
            _local_4 = getParamString(_local_2, _arg_1);
            _local_5 = md5(_local_4);
            return (md5(((Configurations.AGENT_ID + _local_5) + Configurations.SECRET)));
        }

        private static function md5(_arg_1:String):String
        {
            var _local_2:ByteArray = Hex.toArray(Hex.fromString(_arg_1));
            var _local_3:ByteArray = Crypto.getHash("md5").hash(_local_2);
            var _local_4:String = Hex.fromArray(_local_3);
            return (_local_4);
        }

        private static function getParamString(_arg_1:Array, _arg_2:Object):String
        {
            var _local_5:String;
            var _local_3:* = "";
            var _local_4:int;
            while (_local_4 < _arg_1.length)
            {
                _local_5 = _arg_1[_local_4];
                if (_local_4 == 0)
                {
                    _local_3 = (_local_3 + ((_local_5 + "=") + _arg_2[_local_5]));
                }
                else
                {
                    _local_3 = (_local_3 + ((("&" + _local_5) + "=") + _arg_2[_local_5]));
                };
                _local_4++;
            };
            return (_local_3);
        }

        private static function getFullParamString(_arg_1:Object):String
        {
            var _local_3:String;
            var _local_2:Array = [];
            for (_local_3 in _arg_1)
            {
                _local_2.push(_local_3);
            };
            _local_2.sort(Array.CASEINSENSITIVE);
            return (getParamString(_local_2, _arg_1));
        }

        private static function unixTime():Number
        {
            var _local_1:Date = new Date();
            return (Math.floor((_local_1.time / 1000)));
        }


    }
}//package com.namsautam.haitac.api
