//Created by Action Script Viewer - https://www.buraks.com/asv
package com.namsautam.haitac.component
{
    import flash.display.MovieClip;
    import flash.display.Stage;

    public class Components 
    {

        public static var NoticePopup:*;
        public static var LoginPopup:*;
        public static var ServerListUI:*;
        public static var Main:*;
        public static var Loading:MovieClip;


        public static function showLoading():void
        {
            Loading.visible = true;
            Loading.gotoAndPlay(0);
        }

        public static function hideLoading():void
        {
            Loading.visible = false;
            Loading.gotoAndStop(0);
        }

        public static function get stgW():int
        {
            return (Stage(Main.stage).width);
        }

        public static function get stgH():int
        {
            return (Stage(Main.stage).height);
        }


    }
}//package com.namsautam.haitac.component
