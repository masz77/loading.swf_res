﻿//Created by Action Script Viewer - https://www.buraks.com/asv
package com.hurlant.crypto.symmetric
{
    import flash.utils.ByteArray;

    public class PKCS5 implements IPad 
    {

        private var blockSize:uint;

        public function PKCS5(_arg_1:uint=0)
        {
            this.blockSize = _arg_1;
        }

        public function pad(_arg_1:ByteArray):void
        {
            var _local_2:uint = (this.blockSize - (_arg_1.length % this.blockSize));
            var _local_3:uint;
            while (_local_3 < _local_2)
            {
                _arg_1[_arg_1.length] = _local_2;
                _local_3++;
            };
        }

        public function unpad(_arg_1:ByteArray):void
        {
            var _local_2:uint;
            var _local_3:uint = (_arg_1.length % this.blockSize);
            if (_local_3 != 0)
            {
                throw (new Error("PKCS#5::unpad: ByteArray.length isn't a multiple of the blockSize"));
            };
            _local_3 = _arg_1[(_arg_1.length - 1)];
            var _local_4:uint = _local_3;
            while (_local_4 > 0)
            {
                _local_2 = _arg_1[(_arg_1.length - 1)];
                _arg_1.length--;
                if (_local_3 != _local_2)
                {
                    throw (new Error((((("PKCS#5:unpad: Invalid padding value. expected [" + _local_3) + "], found [") + _local_2) + "]")));
                };
                _local_4--;
            };
        }

        public function setBlockSize(_arg_1:uint):void
        {
            this.blockSize = _arg_1;
        }


    }
}//package com.hurlant.crypto.symmetric
