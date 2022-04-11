//Created by Action Script Viewer - https://www.buraks.com/asv
package com.namsautam.haitac.api.dto
{
    public class PostDto 
    {

        public var title:String;
        public var description:String;
        public var link:String;
        public var img:String;

        public function PostDto(_arg_1:Object)
        {
            this.title = _arg_1["title"];
            this.description = _arg_1["description"];
            this.link = _arg_1["link"];
            this.img = _arg_1["img"];
        }

    }
}//package com.namsautam.haitac.api.dto
