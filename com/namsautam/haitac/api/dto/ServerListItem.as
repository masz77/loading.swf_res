//Created by Action Script Viewer - https://www.buraks.com/asv
package com.namsautam.haitac.api.dto
{
    public class ServerListItem 
    {

        public var svId:String;
        public var slug:String;
        public var health:String;
        public var svName:String;

        public function ServerListItem(_arg_1:Object)
        {
            this.svId = _arg_1["id"];
            this.slug = _arg_1["slug"];
            this.health = _arg_1["health"];
            this.svName = _arg_1["name"];
        }

    }
}//package com.namsautam.haitac.api.dto
