//Created by Action Script Viewer - https://www.buraks.com/asv
package com.namsautam.haitac.component
{
    import flash.display.MovieClip;
    import flash.filters.ColorMatrixFilter;
    import flash.display.SimpleButton;
    import flash.events.MouseEvent;

    public class PageNavigator extends MovieClip 
    {

        public static var enbaleFilter:ColorMatrixFilter = new ColorMatrixFilter([0.3086, 0.6094, 0.082, 0, 0, 0.3086, 0.6094, 0.082, 0, 0, 0.3086, 0.6094, 0.082, 0, 0, 0, 0, 0, 1, 0]);

        private var _prePage_btn:SimpleButton;
        private var _nextPage_btn:SimpleButton;
        private var _currentPage:uint;
        private var _totalPage:uint;
        private var pageChangeHandler:Function;


        protected function build():void
        {
            this._currentPage = 1;
            this._totalPage = 1;
            this._nextPage_btn.addEventListener(MouseEvent.CLICK, this.changePage);
            this._prePage_btn.addEventListener(MouseEvent.CLICK, this.changePage);
        }

        public function init(_arg_1:uint, _arg_2:uint, _arg_3:Function):void
        {
            this._currentPage = _arg_1;
            this._totalPage = ((Boolean(_arg_2)) ? _arg_2 : 1);
            this.pageChangeHandler = _arg_3;
            this.freshUI();
        }

        protected function changePage(_arg_1:MouseEvent):void
        {
            switch (_arg_1.target.name)
            {
                case "preBtn":
                    this.currentPage--;
                    break;
                case "nextBtn":
                    this.currentPage++;
                    break;
                default:
                    throw (new Error("changePage: error"));
            };
            this.pageChangeHandler(this.currentPage);
        }

        protected function freshUI():void
        {
            if (this.totalPage == 0)
            {
                this._prePage_btn.mouseEnabled = false;
                this._nextPage_btn.mouseEnabled = false;
                this._prePage_btn.filters = (this._nextPage_btn.filters = [enbaleFilter]);
                return;
            };
            this._prePage_btn.mouseEnabled = true;
            this._nextPage_btn.mouseEnabled = true;
            this._prePage_btn.filters = (this._nextPage_btn.filters = []);
            if (this.currentPage == 1)
            {
                this._prePage_btn.mouseEnabled = false;
                this._prePage_btn.filters = [enbaleFilter];
            };
            if (this.currentPage == this.totalPage)
            {
                this._nextPage_btn.mouseEnabled = false;
                this._nextPage_btn.filters = [enbaleFilter];
            };
        }

        public function get currentPage():uint
        {
            return (this._currentPage);
        }

        public function set currentPage(_arg_1:uint):void
        {
            this._currentPage = _arg_1;
            this.freshUI();
        }

        public function get totalPage():uint
        {
            return (this._totalPage);
        }

        public function set totalPage(_arg_1:uint):void
        {
            this._totalPage = _arg_1;
            this.freshUI();
        }

        public function set prePage_btn(_arg_1:SimpleButton):void
        {
            this._prePage_btn = _arg_1;
        }

        public function set nextPage_btn(_arg_1:SimpleButton):void
        {
            this._nextPage_btn = _arg_1;
        }


    }
}//package com.namsautam.haitac.component
