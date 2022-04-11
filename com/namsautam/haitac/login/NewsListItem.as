//Created by Action Script Viewer - https://www.buraks.com/asv
package com.namsautam.haitac.login
{
    import flash.display.MovieClip;
    import flash.display.SimpleButton;
    import flash.text.TextField;
    import com.namsautam.haitac.api.dto.PostDto;
    import flash.events.MouseEvent;
    import flash.net.navigateToURL;
    import flash.net.URLRequest;

    public class NewsListItem extends MovieClip 
    {

        public var hit:SimpleButton;
        public var textValue:TextField;
        private var data:PostDto;

        public function NewsListItem()
        {
            this.hit.addEventListener(MouseEvent.CLICK, this.onClicked);
        }

        private function onClicked(_arg_1:MouseEvent):void
        {
            navigateToURL(new URLRequest(this.data.link));
        }

        public function setData(_arg_1:PostDto):void
        {
            this.data = _arg_1;
            this.textValue.text = _arg_1.title;
        }


    }
}//package com.namsautam.haitac.login
