//Created by Action Script Viewer - https://www.buraks.com/asv
package com.namsautam.haitac.serverlist
{
    import flash.display.MovieClip;
    import com.namsautam.haitac.api.dto.ServerListItem;

    public class ServerListWithPaging extends MovieClip 
    {

        private var ITEM_PER_PAGE:int = 10;
        private var serverList:Array;
        public var item1:ServerListItemUI;
        public var item2:ServerListItemUI;
        public var item3:ServerListItemUI;
        public var item4:ServerListItemUI;
        public var item5:ServerListItemUI;
        public var item6:ServerListItemUI;
        public var item7:ServerListItemUI;
        public var item8:ServerListItemUI;
        public var item9:ServerListItemUI;
        public var item10:ServerListItemUI;


        public function setData(_arg_1:Array):void
        {
            this.serverList = _arg_1;
            this.render(1);
        }

        public function render(_arg_1:int):void
        {
            var _local_5:ServerListItem;
            var _local_6:ServerListItemUI;
            var _local_2:int = ((_arg_1 - 1) * this.ITEM_PER_PAGE);
            var _local_3:int;
            var _local_4:int = _local_2;
            while (_local_4 < (_local_2 + this.ITEM_PER_PAGE))
            {
                _local_5 = this.serverList[((this.serverList.length - 1) - _local_4)];
                _local_3 = ((_local_4 % this.ITEM_PER_PAGE) + 1);
                _local_6 = this[("item" + _local_3)];
                if (_local_5)
                {
                    _local_6.visible = true;
                    _local_6.setData(_local_5);
                }
                else
                {
                    _local_6.visible = false;
                };
                _local_4++;
            };
        }


    }
}//package com.namsautam.haitac.serverlist
