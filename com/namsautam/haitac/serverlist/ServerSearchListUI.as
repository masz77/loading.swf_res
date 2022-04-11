//Created by Action Script Viewer - https://www.buraks.com/asv
package com.namsautam.haitac.serverlist
{
    import flash.display.MovieClip;
    import com.namsautam.haitac.component.ScrollPane;
    import com.namsautam.haitac.component.UISprite;

    public class ServerSearchListUI extends MovieClip 
    {

        private var prizeItemPane:ScrollPane;
        private var prizeItemBox:UISprite;

        public function ServerSearchListUI()
        {
            this.prizeItemPane = new ScrollPane(409, 185);
            this.prizeItemPane.y = 2;
            this.addChild(this.prizeItemPane);
            this.prizeItemBox = new UISprite();
            this.prizeItemBox.x = 5;
            this.prizeItemPane.addToPane(this.prizeItemBox);
        }

        public function setData(_arg_1:Array, _arg_2:Function):void
        {
            var _local_4:ServerSearchListItemUI;
            while (this.prizeItemBox.numChildren)
            {
                this.prizeItemBox.removeChildAt(0);
            };
            var _local_3:int;
            while (_local_3 < _arg_1.length)
            {
                _local_4 = new ServerSearchListItemUI();
                _local_4.y = (_local_3 * 28);
                _local_4.setData(_arg_1[_local_3], _arg_2);
                this.prizeItemBox.addChild(_local_4);
                _local_3++;
            };
        }


    }
}//package com.namsautam.haitac.serverlist
