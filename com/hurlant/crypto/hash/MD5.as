//Created by Action Script Viewer - https://www.buraks.com/asv
package com.hurlant.crypto.hash
{
    import flash.utils.Endian;
    import flash.utils.ByteArray;

    public class MD5 implements IHash 
    {

        public static const HASH_SIZE:int = 16;


        public function getInputSize():uint
        {
            return (64);
        }

        public function getHashSize():uint
        {
            return (HASH_SIZE);
        }

        public function hash(_arg_1:ByteArray):ByteArray
        {
            var _local_2:uint = (_arg_1.length * 8);
            var _local_3:String = _arg_1.endian;
            while ((_arg_1.length % 4) != 0)
            {
                _arg_1[_arg_1.length] = 0;
            };
            _arg_1.position = 0;
            var _local_4:Array = [];
            _arg_1.endian = Endian.LITTLE_ENDIAN;
            var _local_5:uint;
            while (_local_5 < _arg_1.length)
            {
                _local_4.push(_arg_1.readUnsignedInt());
                _local_5 = (_local_5 + 4);
            };
            var _local_6:Array = this.core_md5(_local_4, _local_2);
            var _local_7:ByteArray = new ByteArray();
            _local_7.endian = Endian.LITTLE_ENDIAN;
            _local_5 = 0;
            while (_local_5 < 4)
            {
                _local_7.writeUnsignedInt(_local_6[_local_5]);
                _local_5++;
            };
            _arg_1.length = (_local_2 / 8);
            _arg_1.endian = _local_3;
            return (_local_7);
        }

        private function core_md5(_arg_1:Array, _arg_2:uint):Array
        {
            var _local_3:uint;
            var _local_4:uint;
            var _local_5:uint;
            var _local_6:uint;
            _arg_1[(_arg_2 >> 5)] = (_arg_1[(_arg_2 >> 5)] | (128 << (_arg_2 % 32)));
            _arg_1[((((_arg_2 + 64) >>> 9) << 4) + 14)] = _arg_2;
            var _local_7:uint = 1732584193;
            var _local_8:uint = 4023233417;
            var _local_9:uint = 2562383102;
            var _local_10:uint = 271733878;
            var _local_11:uint;
            while (_local_11 < _arg_1.length)
            {
                _arg_1[_local_11] = ((_arg_1[_local_11]) || (0));
                _arg_1[(_local_11 + 1)] = ((_arg_1[(_local_11 + 1)]) || (0));
                _arg_1[(_local_11 + 2)] = ((_arg_1[(_local_11 + 2)]) || (0));
                _arg_1[(_local_11 + 3)] = ((_arg_1[(_local_11 + 3)]) || (0));
                _arg_1[(_local_11 + 4)] = ((_arg_1[(_local_11 + 4)]) || (0));
                _arg_1[(_local_11 + 5)] = ((_arg_1[(_local_11 + 5)]) || (0));
                _arg_1[(_local_11 + 6)] = ((_arg_1[(_local_11 + 6)]) || (0));
                _arg_1[(_local_11 + 7)] = ((_arg_1[(_local_11 + 7)]) || (0));
                _arg_1[(_local_11 + 8)] = ((_arg_1[(_local_11 + 8)]) || (0));
                _arg_1[(_local_11 + 9)] = ((_arg_1[(_local_11 + 9)]) || (0));
                _arg_1[(_local_11 + 10)] = ((_arg_1[(_local_11 + 10)]) || (0));
                _arg_1[(_local_11 + 11)] = ((_arg_1[(_local_11 + 11)]) || (0));
                _arg_1[(_local_11 + 12)] = ((_arg_1[(_local_11 + 12)]) || (0));
                _arg_1[(_local_11 + 13)] = ((_arg_1[(_local_11 + 13)]) || (0));
                _arg_1[(_local_11 + 14)] = ((_arg_1[(_local_11 + 14)]) || (0));
                _arg_1[(_local_11 + 15)] = ((_arg_1[(_local_11 + 15)]) || (0));
                _local_3 = _local_7;
                _local_4 = _local_8;
                _local_5 = _local_9;
                _local_6 = _local_10;
                _local_7 = this.ff(_local_7, _local_8, _local_9, _local_10, _arg_1[(_local_11 + 0)], 7, 3614090360);
                _local_10 = this.ff(_local_10, _local_7, _local_8, _local_9, _arg_1[(_local_11 + 1)], 12, 3905402710);
                _local_9 = this.ff(_local_9, _local_10, _local_7, _local_8, _arg_1[(_local_11 + 2)], 17, 606105819);
                _local_8 = this.ff(_local_8, _local_9, _local_10, _local_7, _arg_1[(_local_11 + 3)], 22, 3250441966);
                _local_7 = this.ff(_local_7, _local_8, _local_9, _local_10, _arg_1[(_local_11 + 4)], 7, 4118548399);
                _local_10 = this.ff(_local_10, _local_7, _local_8, _local_9, _arg_1[(_local_11 + 5)], 12, 1200080426);
                _local_9 = this.ff(_local_9, _local_10, _local_7, _local_8, _arg_1[(_local_11 + 6)], 17, 2821735955);
                _local_8 = this.ff(_local_8, _local_9, _local_10, _local_7, _arg_1[(_local_11 + 7)], 22, 4249261313);
                _local_7 = this.ff(_local_7, _local_8, _local_9, _local_10, _arg_1[(_local_11 + 8)], 7, 1770035416);
                _local_10 = this.ff(_local_10, _local_7, _local_8, _local_9, _arg_1[(_local_11 + 9)], 12, 2336552879);
                _local_9 = this.ff(_local_9, _local_10, _local_7, _local_8, _arg_1[(_local_11 + 10)], 17, 0xFFFF5BB1);
                _local_8 = this.ff(_local_8, _local_9, _local_10, _local_7, _arg_1[(_local_11 + 11)], 22, 2304563134);
                _local_7 = this.ff(_local_7, _local_8, _local_9, _local_10, _arg_1[(_local_11 + 12)], 7, 1804603682);
                _local_10 = this.ff(_local_10, _local_7, _local_8, _local_9, _arg_1[(_local_11 + 13)], 12, 4254626195);
                _local_9 = this.ff(_local_9, _local_10, _local_7, _local_8, _arg_1[(_local_11 + 14)], 17, 2792965006);
                _local_8 = this.ff(_local_8, _local_9, _local_10, _local_7, _arg_1[(_local_11 + 15)], 22, 1236535329);
                _local_7 = this.gg(_local_7, _local_8, _local_9, _local_10, _arg_1[(_local_11 + 1)], 5, 4129170786);
                _local_10 = this.gg(_local_10, _local_7, _local_8, _local_9, _arg_1[(_local_11 + 6)], 9, 3225465664);
                _local_9 = this.gg(_local_9, _local_10, _local_7, _local_8, _arg_1[(_local_11 + 11)], 14, 643717713);
                _local_8 = this.gg(_local_8, _local_9, _local_10, _local_7, _arg_1[(_local_11 + 0)], 20, 3921069994);
                _local_7 = this.gg(_local_7, _local_8, _local_9, _local_10, _arg_1[(_local_11 + 5)], 5, 3593408605);
                _local_10 = this.gg(_local_10, _local_7, _local_8, _local_9, _arg_1[(_local_11 + 10)], 9, 38016083);
                _local_9 = this.gg(_local_9, _local_10, _local_7, _local_8, _arg_1[(_local_11 + 15)], 14, 3634488961);
                _local_8 = this.gg(_local_8, _local_9, _local_10, _local_7, _arg_1[(_local_11 + 4)], 20, 3889429448);
                _local_7 = this.gg(_local_7, _local_8, _local_9, _local_10, _arg_1[(_local_11 + 9)], 5, 568446438);
                _local_10 = this.gg(_local_10, _local_7, _local_8, _local_9, _arg_1[(_local_11 + 14)], 9, 3275163606);
                _local_9 = this.gg(_local_9, _local_10, _local_7, _local_8, _arg_1[(_local_11 + 3)], 14, 4107603335);
                _local_8 = this.gg(_local_8, _local_9, _local_10, _local_7, _arg_1[(_local_11 + 8)], 20, 1163531501);
                _local_7 = this.gg(_local_7, _local_8, _local_9, _local_10, _arg_1[(_local_11 + 13)], 5, 2850285829);
                _local_10 = this.gg(_local_10, _local_7, _local_8, _local_9, _arg_1[(_local_11 + 2)], 9, 4243563512);
                _local_9 = this.gg(_local_9, _local_10, _local_7, _local_8, _arg_1[(_local_11 + 7)], 14, 1735328473);
                _local_8 = this.gg(_local_8, _local_9, _local_10, _local_7, _arg_1[(_local_11 + 12)], 20, 2368359562);
                _local_7 = this.hh(_local_7, _local_8, _local_9, _local_10, _arg_1[(_local_11 + 5)], 4, 4294588738);
                _local_10 = this.hh(_local_10, _local_7, _local_8, _local_9, _arg_1[(_local_11 + 8)], 11, 2272392833);
                _local_9 = this.hh(_local_9, _local_10, _local_7, _local_8, _arg_1[(_local_11 + 11)], 16, 1839030562);
                _local_8 = this.hh(_local_8, _local_9, _local_10, _local_7, _arg_1[(_local_11 + 14)], 23, 4259657740);
                _local_7 = this.hh(_local_7, _local_8, _local_9, _local_10, _arg_1[(_local_11 + 1)], 4, 2763975236);
                _local_10 = this.hh(_local_10, _local_7, _local_8, _local_9, _arg_1[(_local_11 + 4)], 11, 1272893353);
                _local_9 = this.hh(_local_9, _local_10, _local_7, _local_8, _arg_1[(_local_11 + 7)], 16, 4139469664);
                _local_8 = this.hh(_local_8, _local_9, _local_10, _local_7, _arg_1[(_local_11 + 10)], 23, 3200236656);
                _local_7 = this.hh(_local_7, _local_8, _local_9, _local_10, _arg_1[(_local_11 + 13)], 4, 681279174);
                _local_10 = this.hh(_local_10, _local_7, _local_8, _local_9, _arg_1[(_local_11 + 0)], 11, 3936430074);
                _local_9 = this.hh(_local_9, _local_10, _local_7, _local_8, _arg_1[(_local_11 + 3)], 16, 3572445317);
                _local_8 = this.hh(_local_8, _local_9, _local_10, _local_7, _arg_1[(_local_11 + 6)], 23, 76029189);
                _local_7 = this.hh(_local_7, _local_8, _local_9, _local_10, _arg_1[(_local_11 + 9)], 4, 3654602809);
                _local_10 = this.hh(_local_10, _local_7, _local_8, _local_9, _arg_1[(_local_11 + 12)], 11, 3873151461);
                _local_9 = this.hh(_local_9, _local_10, _local_7, _local_8, _arg_1[(_local_11 + 15)], 16, 530742520);
                _local_8 = this.hh(_local_8, _local_9, _local_10, _local_7, _arg_1[(_local_11 + 2)], 23, 3299628645);
                _local_7 = this.ii(_local_7, _local_8, _local_9, _local_10, _arg_1[(_local_11 + 0)], 6, 4096336452);
                _local_10 = this.ii(_local_10, _local_7, _local_8, _local_9, _arg_1[(_local_11 + 7)], 10, 1126891415);
                _local_9 = this.ii(_local_9, _local_10, _local_7, _local_8, _arg_1[(_local_11 + 14)], 15, 2878612391);
                _local_8 = this.ii(_local_8, _local_9, _local_10, _local_7, _arg_1[(_local_11 + 5)], 21, 4237533241);
                _local_7 = this.ii(_local_7, _local_8, _local_9, _local_10, _arg_1[(_local_11 + 12)], 6, 1700485571);
                _local_10 = this.ii(_local_10, _local_7, _local_8, _local_9, _arg_1[(_local_11 + 3)], 10, 2399980690);
                _local_9 = this.ii(_local_9, _local_10, _local_7, _local_8, _arg_1[(_local_11 + 10)], 15, 4293915773);
                _local_8 = this.ii(_local_8, _local_9, _local_10, _local_7, _arg_1[(_local_11 + 1)], 21, 2240044497);
                _local_7 = this.ii(_local_7, _local_8, _local_9, _local_10, _arg_1[(_local_11 + 8)], 6, 1873313359);
                _local_10 = this.ii(_local_10, _local_7, _local_8, _local_9, _arg_1[(_local_11 + 15)], 10, 4264355552);
                _local_9 = this.ii(_local_9, _local_10, _local_7, _local_8, _arg_1[(_local_11 + 6)], 15, 2734768916);
                _local_8 = this.ii(_local_8, _local_9, _local_10, _local_7, _arg_1[(_local_11 + 13)], 21, 1309151649);
                _local_7 = this.ii(_local_7, _local_8, _local_9, _local_10, _arg_1[(_local_11 + 4)], 6, 4149444226);
                _local_10 = this.ii(_local_10, _local_7, _local_8, _local_9, _arg_1[(_local_11 + 11)], 10, 3174756917);
                _local_9 = this.ii(_local_9, _local_10, _local_7, _local_8, _arg_1[(_local_11 + 2)], 15, 718787259);
                _local_8 = this.ii(_local_8, _local_9, _local_10, _local_7, _arg_1[(_local_11 + 9)], 21, 3951481745);
                _local_7 = (_local_7 + _local_3);
                _local_8 = (_local_8 + _local_4);
                _local_9 = (_local_9 + _local_5);
                _local_10 = (_local_10 + _local_6);
                _local_11 = (_local_11 + 16);
            };
            return ([_local_7, _local_8, _local_9, _local_10]);
        }

        private function rol(_arg_1:uint, _arg_2:uint):uint
        {
            return ((_arg_1 << _arg_2) | (_arg_1 >>> (32 - _arg_2)));
        }

        private function cmn(_arg_1:uint, _arg_2:uint, _arg_3:uint, _arg_4:uint, _arg_5:uint, _arg_6:uint):uint
        {
            return (this.rol((((_arg_2 + _arg_1) + _arg_4) + _arg_6), _arg_5) + _arg_3);
        }

        private function ff(_arg_1:uint, _arg_2:uint, _arg_3:uint, _arg_4:uint, _arg_5:uint, _arg_6:uint, _arg_7:uint):uint
        {
            return (this.cmn(((_arg_2 & _arg_3) | ((~(_arg_2)) & _arg_4)), _arg_1, _arg_2, _arg_5, _arg_6, _arg_7));
        }

        private function gg(_arg_1:uint, _arg_2:uint, _arg_3:uint, _arg_4:uint, _arg_5:uint, _arg_6:uint, _arg_7:uint):uint
        {
            return (this.cmn(((_arg_2 & _arg_4) | (_arg_3 & (~(_arg_4)))), _arg_1, _arg_2, _arg_5, _arg_6, _arg_7));
        }

        private function hh(_arg_1:uint, _arg_2:uint, _arg_3:uint, _arg_4:uint, _arg_5:uint, _arg_6:uint, _arg_7:uint):uint
        {
            return (this.cmn(((_arg_2 ^ _arg_3) ^ _arg_4), _arg_1, _arg_2, _arg_5, _arg_6, _arg_7));
        }

        private function ii(_arg_1:uint, _arg_2:uint, _arg_3:uint, _arg_4:uint, _arg_5:uint, _arg_6:uint, _arg_7:uint):uint
        {
            return (this.cmn((_arg_3 ^ (_arg_2 | (~(_arg_4)))), _arg_1, _arg_2, _arg_5, _arg_6, _arg_7));
        }

        public function toString():String
        {
            return ("md5");
        }


    }
}//package com.hurlant.crypto.hash
