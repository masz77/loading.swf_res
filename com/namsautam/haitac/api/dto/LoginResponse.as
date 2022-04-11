//Created by Action Script Viewer - https://www.buraks.com/asv
package com.namsautam.haitac.api.dto
{
    public class LoginResponse extends Response 
    {

        public var userId:String;
        public var userName:String;
        public var serverList:ServerList;


        override public function parse(_arg_1:String):void
        {
            super.parse(_arg_1);
            if (!this.success)
            {
                return;
            };
            this.userId = this.data["user_id"];
            this.userName = this.data["username"];
            this.serverList = new ServerList(this.data["server_list"]);
        }


    }
}//package com.namsautam.haitac.api.dto
