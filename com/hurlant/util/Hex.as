﻿//Created by Action Script Viewer - https://www.buraks.com/asv
package com.hurlant.util
{
    import flash.utils.ByteArray;

    public class Hex 
    {


        public static function toArray(_arg_1:String):ByteArray
        {
            _arg_1 = _arg_1.replace(/\s|:/gm, "");
            var _local_2:ByteArray = new ByteArray();
            if ((_arg_1.length & 0x01) == 1)
            {
                _arg_1 = ("0" + _arg_1);
            };
            var _local_3:uint;
            while (_local_3 < _arg_1.length)
            {
                _local_2[(_local_3 / 2)] = parseInt(_arg_1.substr(_local_3, 2), 16);
                _local_3 = (_local_3 + 2);
            };
            return (_local_2);
        }

        public static function fromArray(_arg_1:ByteArray, _arg_2:Boolean=false):String
        {
            var _local_3:* = "";
            var _local_4:uint;
            while (_local_4 < _arg_1.length)
            {
                _local_3 = (_local_3 + ("0" + _arg_1[_local_4].toString(16)).substr(-2, 2));
                if (_arg_2)
                {
                    if (_local_4 < (_arg_1.length - 1))
                    {
                        _local_3 = (_local_3 + ":");
                    };
                };
                _local_4++;
            };
            return (_local_3);
        }

        public static function toString(_arg_1:String):String
        {
            var _local_2:ByteArray = toArray(_arg_1);
            return (_local_2.readUTFBytes(_local_2.length));
        }

        public static function fromString(_arg_1:String, _arg_2:Boolean=false):String
        {
            var _local_3:ByteArray = new ByteArray();
            _local_3.writeUTFBytes(_arg_1);
            return (fromArray(_local_3, _arg_2));
        }


    }
}//package com.hurlant.util
