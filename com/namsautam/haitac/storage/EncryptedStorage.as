//Created by Action Script Viewer - https://www.buraks.com/asv
package com.namsautam.haitac.storage
{
    import com.namsautam.haitac.log.Logger;
    import flash.utils.ByteArray;
    import flash.data.EncryptedLocalStore;

    public class EncryptedStorage implements IStorage 
    {

        private static const KEY:String = "userdata";

        public function EncryptedStorage()
        {
            Logger.log("EncryptedStorage created");
        }

        public function save(_arg_1:Object):void
        {
            var _local_2:ByteArray = new ByteArray();
            _local_2.writeObject(_arg_1);
            EncryptedLocalStore.setItem(KEY, _local_2);
        }

        public function getItem():Object
        {
            var _local_1:ByteArray;
            if (this.isExist())
            {
                _local_1 = EncryptedLocalStore.getItem(KEY);
                return (_local_1.readObject());
            };
            return (null);
        }

        public function clear():void
        {
            EncryptedLocalStore.removeItem(KEY);
        }

        public function isExist():Boolean
        {
            return (!(EncryptedLocalStore.getItem(KEY) == null));
        }


    }
}//package com.namsautam.haitac.storage
