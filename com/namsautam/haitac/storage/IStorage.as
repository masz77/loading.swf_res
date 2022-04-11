//Created by Action Script Viewer - https://www.buraks.com/asv
package com.namsautam.haitac.storage
{
    public interface IStorage 
    {

        function save(_arg_1:Object):void;
        function getItem():Object;
        function clear():void;
        function isExist():Boolean;

    }
}//package com.namsautam.haitac.storage
