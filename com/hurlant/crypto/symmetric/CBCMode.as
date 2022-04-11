//Created by Action Script Viewer - https://www.buraks.com/asv
package com.hurlant.crypto.symmetric
{
    import flash.utils.ByteArray;

    public class CBCMode extends IVMode implements IMode 
    {

        public function CBCMode(_arg_1:ISymmetricKey, _arg_2:IPad=null)
        {
            super(_arg_1, _arg_2);
        }

        public function encrypt(_arg_1:ByteArray):void
        {
            var _local_2:uint;
            padding.pad(_arg_1);
            var _local_3:ByteArray = getIV4e();
            var _local_4:uint;
            while (_local_4 < _arg_1.length)
            {
                _local_2 = 0;
                while (_local_2 < blockSize)
                {
                    _arg_1[(_local_4 + _local_2)] = (_arg_1[(_local_4 + _local_2)] ^ _local_3[_local_2]);
                    _local_2++;
                };
                key.encrypt(_arg_1, _local_4);
                _local_3.position = 0;
                _local_3.writeBytes(_arg_1, _local_4, blockSize);
                _local_4 = (_local_4 + blockSize);
            };
        }

        public function decrypt(_arg_1:ByteArray):void
        {
            var _local_2:uint;
            var _local_3:ByteArray = getIV4d();
            var _local_4:ByteArray = new ByteArray();
            var _local_5:uint;
            while (_local_5 < _arg_1.length)
            {
                _local_4.position = 0;
                _local_4.writeBytes(_arg_1, _local_5, blockSize);
                key.decrypt(_arg_1, _local_5);
                _local_2 = 0;
                while (_local_2 < blockSize)
                {
                    _arg_1[(_local_5 + _local_2)] = (_arg_1[(_local_5 + _local_2)] ^ _local_3[_local_2]);
                    _local_2++;
                };
                _local_3.position = 0;
                _local_3.writeBytes(_local_4, 0, blockSize);
                _local_5 = (_local_5 + blockSize);
            };
            padding.unpad(_arg_1);
        }

        public function toString():String
        {
            return (key.toString() + "-cbc");
        }


    }
}//package com.hurlant.crypto.symmetric
