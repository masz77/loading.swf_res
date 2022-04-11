//Created by Action Script Viewer - https://www.buraks.com/asv
package com.namsautam.haitac.login
{
    import flash.display.MovieClip;

    public class NewsComp extends MovieClip 
    {

        public var line1:NewsListItem;
        public var line2:NewsListItem;
        public var line3:NewsListItem;
        public var line4:NewsListItem;
        public var line5:NewsListItem;
        public var line6:NewsListItem;
        public var line7:NewsListItem;


        public function setData(_arg_1:Array):void
        {
            var _local_2:int = ((_arg_1.length > 7) ? 7 : _arg_1.length);
            var _local_3:int;
            while (_local_3 < _local_2)
            {
                this[("line" + (_local_3 + 1))].setData(_arg_1[_local_3]);
                _local_3++;
            };
        }


    }
}//package com.namsautam.haitac.login
