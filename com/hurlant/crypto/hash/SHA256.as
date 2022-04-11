﻿//Created by Action Script Viewer - https://www.buraks.com/asv
package com.hurlant.crypto.hash
{
    public class SHA256 extends SHABase implements IHash 
    {

        protected static const k:Array = [1116352408, 1899447441, 3049323471, 3921009573, 961987163, 1508970993, 2453635748, 2870763221, 3624381080, 310598401, 607225278, 1426881987, 1925078388, 2162078206, 2614888103, 3248222580, 3835390401, 4022224774, 264347078, 604807628, 770255983, 1249150122, 1555081692, 1996064986, 2554220882, 2821834349, 2952996808, 3210313671, 3336571891, 3584528711, 113926993, 338241895, 666307205, 773529912, 1294757372, 1396182291, 1695183700, 1986661051, 2177026350, 2456956037, 2730485921, 2820302411, 3259730800, 3345764771, 3516065817, 3600352804, 4094571909, 275423344, 430227734, 506948616, 659060556, 883997877, 958139571, 1322822218, 1537002063, 1747873779, 1955562222, 2024104815, 2227730452, 2361852424, 2428436474, 2756734187, 3204031479, 3329325298];

        protected var h:Array;

        public function SHA256()
        {
            this.h = [1779033703, 3144134277, 1013904242, 2773480762, 1359893119, 2600822924, 528734635, 1541459225];
        }

        override public function getHashSize():uint
        {
            return (32);
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
            var _local_10:uint;
            var _local_11:uint;
            var _local_12:uint;
            var _local_13:uint;
            var _local_14:uint;
            var _local_15:uint;
            _arg_1[(_arg_2 >> 5)] = (_arg_1[(_arg_2 >> 5)] | (128 << (24 - (_arg_2 % 32))));
            _arg_1[((((_arg_2 + 64) >> 9) << 4) + 15)] = _arg_2;
            var _local_16:Array = [];
            var _local_17:uint = this.h[0];
            var _local_18:uint = this.h[1];
            var _local_19:uint = this.h[2];
            var _local_20:uint = this.h[3];
            var _local_21:uint = this.h[4];
            var _local_22:uint = this.h[5];
            var _local_23:uint = this.h[6];
            var _local_24:uint = this.h[7];
            var _local_25:uint;
            while (_local_25 < _arg_1.length)
            {
                _local_3 = _local_17;
                _local_4 = _local_18;
                _local_5 = _local_19;
                _local_6 = _local_20;
                _local_7 = _local_21;
                _local_8 = _local_22;
                _local_9 = _local_23;
                _local_10 = _local_24;
                _local_11 = 0;
                while (_local_11 < 64)
                {
                    if (_local_11 < 16)
                    {
                        _local_16[_local_11] = ((_arg_1[(_local_25 + _local_11)]) || (0));
                    }
                    else
                    {
                        _local_14 = ((this.rrol(_local_16[(_local_11 - 15)], 7) ^ this.rrol(_local_16[(_local_11 - 15)], 18)) ^ (_local_16[(_local_11 - 15)] >>> 3));
                        _local_15 = ((this.rrol(_local_16[(_local_11 - 2)], 17) ^ this.rrol(_local_16[(_local_11 - 2)], 19)) ^ (_local_16[(_local_11 - 2)] >>> 10));
                        _local_16[_local_11] = (((_local_16[(_local_11 - 16)] + _local_14) + _local_16[(_local_11 - 7)]) + _local_15);
                    };
                    _local_12 = (((this.rrol(_local_17, 2) ^ this.rrol(_local_17, 13)) ^ this.rrol(_local_17, 22)) + (((_local_17 & _local_18) ^ (_local_17 & _local_19)) ^ (_local_18 & _local_19)));
                    _local_13 = ((((_local_24 + ((this.rrol(_local_21, 6) ^ this.rrol(_local_21, 11)) ^ this.rrol(_local_21, 25))) + ((_local_21 & _local_22) ^ (_local_23 & (~(_local_21))))) + k[_local_11]) + _local_16[_local_11]);
                    _local_24 = _local_23;
                    _local_23 = _local_22;
                    _local_22 = _local_21;
                    _local_21 = (_local_20 + _local_13);
                    _local_20 = _local_19;
                    _local_19 = _local_18;
                    _local_18 = _local_17;
                    _local_17 = (_local_13 + _local_12);
                    _local_11++;
                };
                _local_17 = (_local_17 + _local_3);
                _local_18 = (_local_18 + _local_4);
                _local_19 = (_local_19 + _local_5);
                _local_20 = (_local_20 + _local_6);
                _local_21 = (_local_21 + _local_7);
                _local_22 = (_local_22 + _local_8);
                _local_23 = (_local_23 + _local_9);
                _local_24 = (_local_24 + _local_10);
                _local_25 = (_local_25 + 16);
            };
            return ([_local_17, _local_18, _local_19, _local_20, _local_21, _local_22, _local_23, _local_24]);
        }

        protected function rrol(_arg_1:uint, _arg_2:uint):uint
        {
            return ((_arg_1 << (32 - _arg_2)) | (_arg_1 >>> _arg_2));
        }

        override public function toString():String
        {
            return ("sha256");
        }


    }
}//package com.hurlant.crypto.hash
