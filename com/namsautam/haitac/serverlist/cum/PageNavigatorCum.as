//Created by Action Script Viewer - https://www.buraks.com/asv
package com.namsautam.haitac.serverlist.cum
{
    import com.namsautam.haitac.component.PageNavigator;
    import flash.display.SimpleButton;
    import flash.events.Event;

    public class PageNavigatorCum extends PageNavigator 
    {

        public var preBtn:SimpleButton;
        public var nextBtn:SimpleButton;

        public function PageNavigatorCum()
        {
            addEventListener(Event.ADDED_TO_STAGE, this.onAddedToStage);
        }

        private function onAddedToStage(_arg_1:Event):void
        {
            removeEventListener(Event.ADDED_TO_STAGE, this.onAddedToStage);
            prePage_btn = this.preBtn;
            nextPage_btn = this.nextBtn;
            build();
        }


    }
}//package com.namsautam.haitac.serverlist.cum
