﻿//Created by Action Script Viewer - https://www.buraks.com/asv
package com.hurlant.crypto.hash
{
    public class SHA1 extends SHABase implements IHash 
    {

        public static const HASH_SIZE:int = 20;


        override public function getHashSize():uint
        {
            return (HASH_SIZE);
        }

        override protected function core(_arg_1:Array, _arg_2:uint):Array
        {
            var _local_3:uint;
            var _local_4:uint;
            var _local_5:uint;
            var _local_6:uint;
            var _local_7:uint;
            var _local_8:uint;
            var _local_9:uint;
            _arg_1[(_arg_2 >> 5)] = (_arg_1[(_arg_2 >> 5)] | (128 << (24 - (_arg_2 % 32))));
            _arg_1[((((_arg_2 + 64) >> 9) << 4) + 15)] = _arg_2;
            var _local_10:Array = [];
            var _local_11:uint = 1732584193;
            var _local_12:uint = 4023233417;
            var _local_13:uint = 2562383102;
            var _local_14:uint = 271733878;
            var _local_15:uint = 3285377520;
            var _local_16:uint;
            while (_local_16 < _arg_1.length)
            {
                _local_3 = _local_11;
                _local_4 = _local_12;
                _local_5 = _local_13;
                _local_6 = _local_14;
                _local_7 = _local_15;
                _local_8 = 0;
                while (_local_8 < 80)
                {
                    if (_local_8 < 16)
                    {
                        _local_10[_local_8] = ((_arg_1[(_local_16 + _local_8)]) || (0));
                    }
                    else
                    {
                        _local_10[_local_8] = this.rol((((_local_10[(_local_8 - 3)] ^ _local_10[(_local_8 - 8)]) ^ _local_10[(_local_8 - 14)]) ^ _local_10[(_local_8 - 16)]), 1);
                    };
                    _local_9 = ((((this.rol(_local_11, 5) + this.ft(_local_8, _local_12, _local_13, _local_14)) + _local_15) + _local_10[_local_8]) + this.kt(_local_8));
                    _local_15 = _local_14;
                    _local_14 = _local_13;
                    _local_13 = this.rol(_local_12, 30);
                    _local_12 = _local_11;
                    _local_11 = _local_9;
                    _local_8++;
                };
                _local_11 = (_local_11 + _local_3);
                _local_12 = (_local_12 + _local_4);
                _local_13 = (_local_13 + _local_5);
                _local_14 = (_local_14 + _local_6);
                _local_15 = (_local_15 + _local_7);
                _local_16 = (_local_16 + 16);
            };
            return ([_local_11, _local_12, _local_13, _local_14, _local_15]);
        }

        private function rol(_arg_1:uint, _arg_2:uint):uint
        {
            return ((_arg_1 << _arg_2) | (_arg_1 >>> (32 - _arg_2)));
        }

        private function ft(_arg_1:uint, _arg_2:uint, _arg_3:uint, _arg_4:uint):uint
        {
            if (_arg_1 < 20)
            {
                return ((_arg_2 & _arg_3) | ((~(_arg_2)) & _arg_4));
            };
            if (_arg_1 < 40)
            {
                return ((_arg_2 ^ _arg_3) ^ _arg_4);
            };
            if (_arg_1 < 60)
            {
                return (((_arg_2 & _arg_3) | (_arg_2 & _arg_4)) | (_arg_3 & _arg_4));
            };
            return ((_arg_2 ^ _arg_3) ^ _arg_4);
        }

        private function kt(_arg_1:uint):uint
        {
            return ((_arg_1 < 20) ? uint(1518500249) : ((_arg_1 < 40) ? uint(1859775393) : ((_arg_1 < 60) ? uint(2400959708) : uint(3395469782))));
        }

        override public function toString():String
        {
            return ("sha1");
        }


    }
}//package com.hurlant.crypto.hash
