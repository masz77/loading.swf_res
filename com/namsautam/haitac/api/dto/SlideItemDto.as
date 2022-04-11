//Created by Action Script Viewer - https://www.buraks.com/asv
package com.namsautam.haitac.api.dto
{
    public class SlideItemDto 
    {

        public var slideName:String;
        public var slideImage:String;
        public var link:String;

        public function SlideItemDto(_arg_1:Object)
        {
            this.slideImage = _arg_1["slideImage"];
            this.slideName = _arg_1["slideName"];
            this.link = _arg_1["link"];
        }

    }
}//package com.namsautam.haitac.api.dto
