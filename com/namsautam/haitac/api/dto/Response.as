//Created by Action Script Viewer - https://www.buraks.com/asv
package com.namsautam.haitac.api.dto
{
    public class Response 
    {

        public var status:int = 0;
        public var message:String = "";
        public var data:Object;


        public function parse(_arg_1:String):void
        {
            var _local_2:Object = JSON.parse(_arg_1);
            this.status = _local_2.status;
            this.message = _local_2.mess;
            this.data = _local_2["data"];
        }

        public function get success():Boolean
        {
            return (this.status == 1);
        }


    }
}//package com.namsautam.haitac.api.dto
