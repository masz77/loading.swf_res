//Created by Action Script Viewer - https://www.buraks.com/asv
package com.namsautam.haitac.storage
{
    import com.namsautam.haitac.log.Logger;
    import flash.utils.ByteArray;
    import flash.utils.CompressionAlgorithm;
    import flash.filesystem.FileStream;
    import flash.filesystem.FileMode;
    import flash.filesystem.File;
    import com.namsautam.haitac.config.Configurations;

    public class FileStorage implements IStorage 
    {

        public function FileStorage()
        {
            Logger.log("FileStorage created");
        }

        public function save(_arg_1:Object):void
        {
            var _local_2:ByteArray = new ByteArray();
            _local_2.writeObject(_arg_1);
            _local_2.position = 0;
            _local_2.compress(CompressionAlgorithm.DEFLATE);
            this.writeBytesToFile(_local_2);
        }

        public function getItem():Object
        {
            var _local_1:ByteArray;
            if (this.isExist())
            {
                _local_1 = this.readBytesFromFile();
                _local_1.position = 0;
                _local_1.uncompress(CompressionAlgorithm.DEFLATE);
                _local_1.position = 0;
                return (_local_1.readObject());
            };
            return (null);
        }

        public function clear():void
        {
            if (this.isExist())
            {
                this.getFile().deleteFile();
            };
        }

        public function isExist():Boolean
        {
            return (this.getFile().exists);
        }

        private function writeBytesToFile(_arg_1:ByteArray):void
        {
            var _local_2:FileStream = new FileStream();
            _local_2.open(this.getFile(), FileMode.WRITE);
            _local_2.writeBytes(_arg_1, 0, _arg_1.length);
            _local_2.close();
        }

        private function readBytesFromFile():ByteArray
        {
            var _local_1:ByteArray = new ByteArray();
            var _local_2:FileStream = new FileStream();
            _local_2.open(this.getFile(), FileMode.READ);
            _local_2.readBytes(_local_1);
            _local_2.close();
            return (_local_1);
        }

        private function getFile():File
        {
            var _local_1:File = File.userDirectory.resolvePath(Configurations.FILE_STORAGE_NAME);
            Logger.log(("Local Storage: " + _local_1.nativePath));
            return (_local_1);
        }


    }
}//package com.namsautam.haitac.storage
