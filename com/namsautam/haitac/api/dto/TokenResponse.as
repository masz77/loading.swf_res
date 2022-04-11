//Created by Action Script Viewer - https://www.buraks.com/asv
package com.namsautam.haitac.api.dto
{
    public class TokenResponse extends Response 
    {

        public var token:String;
        public var homePageLink:String;
        public var forumLink:String;
        public var fanpageLink:String;
        public var paymentLink:String;
        public var slides:Array = [];
        public var posts:Array = [];


        override public function parse(_arg_1:String):void
        {
            super.parse(_arg_1);
            if (!this.success)
            {
                return;
            };
            this.token = this.data["token"];
            this.homePageLink = this.data["menu"]["homepage"]["link"];
            this.forumLink = this.data["menu"]["forum"]["link"];
            this.fanpageLink = this.data["menu"]["fanpage"]["link"];
            this.paymentLink = this.data["menu"]["payment"]["link"];
            this.parseSlideArray(this.data, "slide", this.slides);
            this.parsePostArray(this.data, "post", this.posts);
        }

        private function parseSlideArray(_arg_1:Object, _arg_2:String, _arg_3:Array):void
        {
            var _local_4:Array = _arg_1[_arg_2];
            var _local_5:int;
            while (_local_5 < _local_4.length)
            {
                _arg_3.push(new SlideItemDto(_local_4[_local_5]));
                _local_5++;
            };
        }

        private function parsePostArray(_arg_1:Object, _arg_2:String, _arg_3:Array):void
        {
            var _local_4:Array = _arg_1[_arg_2];
            var _local_5:int;
            while (_local_5 < _local_4.length)
            {
                _arg_3.push(new PostDto(_local_4[_local_5]));
                _local_5++;
            };
        }


    }
}//package com.namsautam.haitac.api.dto
