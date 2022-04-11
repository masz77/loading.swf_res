//Created by Action Script Viewer - https://www.buraks.com/asv
package com.hurlant.crypto.symmetric
{
    import flash.utils.ByteArray;

    public class CFBMode extends IVMode implements IMode 
    {

        public function CFBMode(_arg_1:ISymmetricKey, _arg_2:IPad=null)
        {
            super(_arg_1, null);
        }

        public function encrypt(_arg_1:ByteArray):void
        {
            var _local_2:uint;
            var _local_3:uint;
            var _local_4:uint = _arg_1.length;
            var _local_5:ByteArray = getIV4e();
            var _local_6:uint;
            while (_local_6 < _arg_1.length)
            {
                key.encrypt(_local_5);
                _local_2 = (((_local_6 + blockSize) < _local_4) ? uint(blockSize) : uint((_local_4 - _local_6)));
                _local_3 = 0;
                while (_local_3 < _local_2)
                {
                    _arg_1[(_local_6 + _local_3)] = (_arg_1[(_local_6 + _local_3)] ^ _local_5[_local_3]);
                    _local_3++;
                };
                _local_5.position = 0;
                _local_5.writeBytes(_arg_1, _local_6, _local_2);
                _local_6 = (_local_6 + blockSize);
            };
        }

        public function decrypt(_arg_1:ByteArray):void
        {
            var _local_2:uint;
            var _local_3:uint;
            var _local_4:uint = _arg_1.length;
            var _local_5:ByteArray = getIV4d();
            var _local_6:ByteArray = new ByteArray();
            var _local_7:uint;
            while (_local_7 < _arg_1.length)
            {
                key.encrypt(_local_5);
                _local_2 = (((_local_7 + blockSize) < _local_4) ? uint(blockSize) : uint((_local_4 - _local_7)));
                _local_6.position = 0;
                _local_6.writeBytes(_arg_1, _local_7, _local_2);
                _local_3 = 0;
                while (_local_3 < _local_2)
                {
                    _arg_1[(_local_7 + _local_3)] = (_arg_1[(_local_7 + _local_3)] ^ _local_5[_local_3]);
                    _local_3++;
                };
                _local_5.position = 0;
                _local_5.writeBytes(_local_6);
                _local_7 = (_local_7 + blockSize);
            };
        }

        public function toString():String
        {
            return (key.toString() + "-cfb");
        }


    }
}//package com.hurlant.crypto.symmetric
