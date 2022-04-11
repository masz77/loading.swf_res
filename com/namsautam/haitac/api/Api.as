//Created by Action Script Viewer - https://www.buraks.com/asv
package com.namsautam.haitac.api
{
    import com.namsautam.haitac.api.dto.Response;
    import flash.system.Capabilities;
    import com.namsautam.haitac.component.Components;
    import com.namsautam.haitac.api.dto.TokenResponse;
    import com.namsautam.haitac.log.Logger;
    import com.namsautam.haitac.api.dto.LoginResponse;

    public class Api 
    {

        public static const GENERATE_TOKEN:String = "generateToken";
        public static const LOGIN:String = "login";
        public static const GET_SERVER_LIST:String = "getServerList";
        public static const GET_SERVER_PLAY:String = "getServerPlay";
        public static const RELOAD_CAPTCHA:String = "reloadCaptcha";
        public static const CHECK_UPDATE:String = "checkVersion";


        public static function checkUpdate():void
        {
            var params:Object = {};
            params[Params.OS] = getOS();
            RestClient.executeGet(CHECK_UPDATE, params, function (_arg_1:Response):void
            {
                generateToken();
            }, function (_arg_1:Response):void
            {
            });
        }

        private static function getOS():String
        {
            if (Capabilities.os.toLowerCase().indexOf("windows") != -1)
            {
                return ("windows");
            };
            if (Capabilities.os.toLowerCase().indexOf("linux") != -1)
            {
                return ("android");
            };
            if (Capabilities.os.toLowerCase().indexOf("mac") != -1)
            {
                return ("ios");
            };
            if (Capabilities.os.toLowerCase().indexOf("iphone") != -1)
            {
                return ("ios");
            };
            return ("");
        }

        public static function generateToken():void
        {
            RestClient.executeGet(GENERATE_TOKEN, {}, function (_arg_1:TokenResponse):void
            {
                RestClient.token = _arg_1.token;
                Components.LoginPopup.loadCaptcha(_arg_1.data["captchaUrl"]);
                Components.LoginPopup.setData(_arg_1);
            }, function (_arg_1:Response):void
            {
                Logger.log("Cannot generate token");
            }, TokenResponse);
        }

        public static function login(username:String, pass:String, captcha:String):void
        {
            var params:Object = {};
            params[Params.USERNAME] = username;
            params[Params.PASSWORD] = pass;
            params[Params.CAPTCHA] = captcha;
            RestClient.executeGet(LOGIN, params, function (_arg_1:LoginResponse):void
            {
                Components.LoginPopup.visible = false;
                Components.LoginPopup.destroy();
                Components.ServerListUI.setData(_arg_1);
                Components.ServerListUI.visible = true;
            }, function (_arg_1:Response):void
            {
                RestClient.token = _arg_1.data["token"];
                Components.LoginPopup.loadCaptcha(_arg_1.data["captchaUrl"]);
            }, LoginResponse);
        }

        public static function join(slug:String):void
        {
            var params:Object = {};
            params[Params.SERVER_SLUG] = slug;
            RestClient.executeGet(GET_SERVER_PLAY, params, function (_arg_1:Response):void
            {
                var _local_2:Object = _arg_1.data["flashVars"];
                var _local_3:* = "C:\\Users\\ninhnq\\project\\haitac\\client\\bin\\";
                Components.Main.loadTMain((_local_3 + "loadingApp.swf"), _local_2);
            }, function (_arg_1:Response):void
            {
            }, Response);
        }

        public static function reloadCaptcha():void
        {
            RestClient.executeGet(RELOAD_CAPTCHA, {}, function (_arg_1:Response):void
            {
                Components.LoginPopup.loadCaptcha(_arg_1.data["captchaUrl"]);
            }, function (_arg_1:Response):void
            {
            }, Response);
        }

        private static function getTestFlashVars():Object
        {
            var _local_1:Object = {};
            var _local_2:* = "10.8.14.20";
            var _local_3:* = (("http://" + _local_2) + ":8080");
            _local_1.host = _local_2;
            _local_1.assetPath = "C:\\Users\\ninhnq\\project\\haitac\\20151027\\assets/";
            _local_1.port = 8001;
            _local_1.serverID = "game20001";
            _local_1.AMF = 3;
            _local_1.maxChars = 10;
            _local_1.globalization = "vi";
            _local_1.offset = -420;
            _local_1.swfURL = "C:\\Users\\ninhnq\\project\\haitac\\client\\bin\\Main.swf";
            _local_1.configURL = (_local_3 + "/20151027/loadingTips.xml");
            _local_1.questionUrl = (_local_3 + "/");
            _local_1.noticeUrl = (_local_3 + "/");
            _local_1.recordUrl = (_local_3 + "/");
            _local_1.checkCardUrl = (_local_3 + "/");
            _local_1.bbsUrl = (_local_3 + "/");
            _local_1.openDateTime = "2019-11-15-10-00-00";
            _local_1.openPrize = "2012-05-31";
            _local_1.hookMaxNum = 1000;
            _local_1.clientDownLoad = "http://haitac.game5.vn/Vua_Hai_Tac.exe";
            _local_1["pid"] = "2306";
            _local_1["sid"] = "1";
            return (_local_1);
        }


    }
}//package com.namsautam.haitac.api
