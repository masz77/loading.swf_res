//Created by Action Script Viewer - https://www.buraks.com/asv
package com.namsautam.haitac.serverlist
{
    import flash.display.MovieClip;

    public class HealthIndicator extends MovieClip 
    {


        public function setStatus(_arg_1:String):void
        {
            switch (_arg_1)
            {
                case "1":
                    gotoAndStop(1);
                    return;
                case "-1":
                    gotoAndStop(3);
                    return;
                case "-2":
                    gotoAndStop(2);
                    return;
                default:
                    gotoAndStop(1);
            };
        }


    }
}//package com.namsautam.haitac.serverlist
