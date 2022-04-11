//Created by Action Script Viewer - https://www.buraks.com/asv
package com.hurlant.crypto.hash
{
    import flash.utils.ByteArray;

    public interface IHash 
    {

        function getInputSize():uint;
        function getHashSize():uint;
        function hash(_arg_1:ByteArray):ByteArray;
        function toString():String;

    }
}//package com.hurlant.crypto.hash
