//Created by Action Script Viewer - https://www.buraks.com/asv
package com.namsautam.haitac.serverlist.cum
{
    import flash.display.MovieClip;
    import com.namsautam.haitac.api.dto.ServerList;
    import flash.events.MouseEvent;

    public class CumTab 
    {

        private var cumZing:MovieClip;
        private var cum568:MovieClip;
        private var updateFunc:Function;
        private var data:ServerList;


        public function init(_arg_1:MovieClip, _arg_2:MovieClip, _arg_3:ServerList, _arg_4:Function):void
        {
            this.cum568 = _arg_2;
            this.cumZing = _arg_1;
            this.updateFunc = _arg_4;
            this.data = _arg_3;
            this.on568Click(null);
            this.cumZing.addEventListener(MouseEvent.CLICK, this.onZingClick);
            this.cum568.addEventListener(MouseEvent.CLICK, this.on568Click);
            this.cumZing.buttonMode = true;
            this.cum568.buttonMode = true;
        }

        private function on568Click(_arg_1:MouseEvent):void
        {
            this.cum568.gotoAndStop(2);
            this.cumZing.gotoAndStop(1);
            this.updateFunc(this.data.svList);
        }

        private function onZingClick(_arg_1:MouseEvent):void
        {
            this.cum568.gotoAndStop(1);
            this.cumZing.gotoAndStop(2);
            this.updateFunc(this.data.zingList);
        }


    }
}//package com.namsautam.haitac.serverlist.cum
