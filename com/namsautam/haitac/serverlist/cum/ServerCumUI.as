//Created by Action Script Viewer - https://www.buraks.com/asv
package com.namsautam.haitac.serverlist.cum
{
    import flash.display.MovieClip;
    import com.namsautam.haitac.serverlist.PageNavigatorMain;
    import flash.events.MouseEvent;
    import com.namsautam.haitac.serverlist.ServerListUI;
    import com.namsautam.haitac.api.dto.ServerList;

    public class ServerCumUI extends MovieClip 
    {

        public var paging:PageNavigatorCum;
        public var cumNavigator:PageNavigatorMain;
        private var ITEM_PER_PAGE:int = 6;
        private var serverList:Array;
        public var item1:ServerListItemUI;
        public var item2:ServerListItemUI;
        public var item3:ServerListItemUI;
        public var item4:ServerListItemUI;
        public var item5:ServerListItemUI;
        public var item6:ServerListItemUI;
        public var cumZingTab:MovieClip;
        public var cum568Tab:MovieClip;
        private var tab:CumTab;

        public function ServerCumUI()
        {
            this.tab = new CumTab();
            var _local_1:int = 1;
            while (_local_1 < 7)
            {
                this[("item" + _local_1)].addEventListener(MouseEvent.CLICK, this.onSelectCum);
                _local_1++;
            };
        }

        private function onSelectCum(_arg_1:MouseEvent):void
        {
            this.showServerListInCum(_arg_1.currentTarget.cumStr);
            this.cumNavigator.currentPage = (this.serverList.length - this.serverList.indexOf(_arg_1.currentTarget.cumStr));
        }

        private function showServerListInCum(_arg_1:String):void
        {
            ServerListUI(this.parent).selectCumHandler(_arg_1);
        }

        public function setData(_arg_1:ServerList):void
        {
            this.tab.init(this.cumZingTab, this.cum568Tab, _arg_1, this.activeList);
        }

        public function activeList(_arg_1:Array):void
        {
            this.serverList = _arg_1;
            var _local_2:int = int(Math.ceil((_arg_1.length / 6)));
            this.paging.init(1, _local_2, this.render);
            this.cumNavigator.init(1, _arg_1.length, this.renderNextCum);
            this.render(1);
        }

        private function printList(_arg_1:Array):void
        {
            var _local_2:int;
            while (_local_2 < _arg_1.length)
            {
                trace(((("i:" + _local_2) + "-") + _arg_1[_local_2]));
                _local_2++;
            };
        }

        public function renderNextCum(_arg_1:int):void
        {
            this.showServerListInCum(this.serverList[(this.serverList.length - _arg_1)]);
        }

        public function render(_arg_1:int):void
        {
            var _local_5:String;
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
            this.showServerListInCum(this.item1.cumStr);
        }


    }
}//package com.namsautam.haitac.serverlist.cum
