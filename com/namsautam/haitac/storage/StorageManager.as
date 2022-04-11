//Created by Action Script Viewer - https://www.buraks.com/asv
package com.namsautam.haitac.storage
{
    import flash.system.Capabilities;
    import flash.data.EncryptedLocalStore;

    public class StorageManager 
    {

        private static var _storage:IStorage;


        public static function init():void
        {
            if (Capabilities.os.indexOf("Windows") != -1)
            {
                _storage = new FileStorage();
            }
            else
            {
                if (EncryptedLocalStore.isSupported)
                {
                    _storage = new EncryptedStorage();
                }
                else
                {
                    _storage = new FileStorage();
                };
            };
        }

        public static function get storage():IStorage
        {
            return (_storage);
        }


    }
}//package com.namsautam.haitac.storage
