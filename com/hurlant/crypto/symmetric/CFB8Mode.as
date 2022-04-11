//Created by Action Script Viewer - https://www.buraks.com/asv
package com.hurlant.crypto.symmetric
{
    import flash.utils.ByteArray;

    public class CFB8Mode extends IVMode implements IMode 
    {

        public function CFB8Mode(_arg_1:ISymmetricKey, _arg_2:IPad=null)
        {
            super(_arg_1, null);
        }

        public function encrypt(_arg_1:ByteArray):void
        {
            var _local_2:uint;
            var _local_3:ByteArray = getIV4e();
            var _local_4:ByteArray = new ByteArray();
            var _local_5:uint;
            while (_local_5 < _arg_1.length)
            {
                _local_4.position = 0;
                _local_4.writeBytes(_local_3);
                key.encrypt(_local_3);
                _arg_1[_local_5] = (_arg_1[_local_5] ^ _local_3[0]);
                _local_2 = 0;
                while (_local_2 < (blockSize - 1))
                {
                    _local_3[_local_2] = _local_4[(_local_2 + 1)];
                    _local_2++;
                };
                _local_3[(blockSize - 1)] = _arg_1[_local_5];
                _local_5++;
            };
        }

        public function decrypt(_arg_1:ByteArray):void
        {
            var _local_2:uint;
            var _local_3:uint;
            var _local_4:ByteArray = getIV4d();
            var _local_5:ByteArray = new ByteArray();
            var _local_6:uint;
            while (_local_6 < _arg_1.length)
            {
                _local_2 = _arg_1[_local_6];
                _local_5.position = 0;
                _local_5.writeBytes(_local_4);
                key.encrypt(_local_4);
                _arg_1[_local_6] = (_arg_1[_local_6] ^ _local_4[0]);
                _local_3 = 0;
                while (_local_3 < (blockSize - 1))
                {
                    _local_4[_local_3] = _local_5[(_local_3 + 1)];
                    _local_3++;
                };
                _local_4[(blockSize - 1)] = _local_2;
                _local_6++;
            };
        }

        public function toString():String
        {
            return (key.toString() + "-cfb8");
        }


    }
}//package com.hurlant.crypto.symmetric
