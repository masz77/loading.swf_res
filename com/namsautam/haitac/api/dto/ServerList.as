//Created by Action Script Viewer - https://www.buraks.com/asv
package com.namsautam.haitac.api.dto
{
    public class ServerList 
    {

        private var dictionary:Object = new Object();
        public var allList:Array = [];
        public var svList:Array = [];
        public var zingList:Array = [];
        public var mostList:Array = [];

        public function ServerList(_arg_1:Object)
        {
            this.parse(_arg_1, "list", this.svList);
            this.parse(_arg_1, "most", this.mostList);
            this.parse(_arg_1, "listZing", this.zingList);
        }

        private function parse(_arg_1:Object, _arg_2:String, _arg_3:Array):void
        {
            if ((_arg_1[_arg_2] is Array))
            {
                this.parseArray(_arg_1, _arg_2, _arg_3);
            }
            else
            {
                this.parseObject(_arg_1, _arg_2, _arg_3);
            };
        }

        private function parseArray(_arg_1:Object, _arg_2:String, _arg_3:Array):void
        {
            var _local_4:Array = _arg_1[_arg_2];
            var _local_5:int;
            while (_local_5 < _local_4.length)
            {
                _arg_3.push(new ServerListItem(_local_4[_local_5]));
                _local_5++;
            };
        }

        private function parseObject(_arg_1:Object, _arg_2:String, _arg_3:Array):void
        {
            var _local_5:String;
            var _local_6:int;
            var _local_7:ServerListItem;
            var _local_4:Object = _arg_1[_arg_2];
            for (_local_5 in _local_4)
            {
                _arg_3.push(_local_5);
                this.dictionary[_local_5] = [];
                _local_6 = 0;
                while (_local_6 < _local_4[_local_5].length)
                {
                    _local_7 = new ServerListItem(_local_4[_local_5][_local_6]);
                    this.dictionary[_local_5].push(_local_7);
                    this.allList.push(_local_7);
                    _local_6++;
                };
            };
            this.bubbleSort(_arg_3);
        }

        private function bubbleSort(_arg_1:Array):void
        {
            var _local_2:*;
            var _local_4:int;
            var _local_3:int;
            while (_local_3 < _arg_1.length)
            {
                _local_4 = (_arg_1.length - 1);
                while (_local_4 > _local_3)
                {
                    if (this.isGreater(_arg_1[(_local_4 - 1)], _arg_1[_local_4]))
                    {
                        _local_2 = _arg_1[(_local_4 - 1)];
                        _arg_1[(_local_4 - 1)] = _arg_1[_local_4];
                        _arg_1[_local_4] = _local_2;
                    };
                    _local_4--;
                };
                _local_3++;
            };
        }

        private function isGreater(_arg_1:String, _arg_2:String):Boolean
        {
            return (this.getInt(_arg_1) > this.getInt(_arg_2));
        }

        private function getInt(_arg_1:String):int
        {
            _arg_1 = _arg_1.split("-")[0].replace("S", "");
            _arg_1 = _arg_1.replace(" ", "");
            _arg_1 = _arg_1.replace("Z", "");
            return (parseInt(_arg_1));
        }

        public function get newestServer():ServerListItem
        {
            return (this.svList[0]);
        }

        public function getServerListByGroup(_arg_1:String):Array
        {
            return (this.dictionary[_arg_1]);
        }


    }
}//package com.namsautam.haitac.api.dto
