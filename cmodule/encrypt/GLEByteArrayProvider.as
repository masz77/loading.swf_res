//Created by Action Script Viewer - https://www.buraks.com/asv
package cmodule.encrypt
{
    import flash.utils.ByteArray;
    import cmodule.encrypt.gdomainClass;
    import cmodule.encrypt.log;
    import flash.display.*;
    import flash.events.*;
    import flash.utils.*;
    import cmodule.encrypt.*;
    import flash.text.*;
    import flash.net.*;
    import flash.system.*;

    internal class GLEByteArrayProvider 
    {


        public static function get():ByteArray
        {
            var result:ByteArray;
            try
            {
                result = gdomainClass.currentDomain.domainMemory;
            }
            catch(e)
            {
            };
            if (!result)
            {
                result = new LEByteArray();
                try
                {
                    result.length = gdomainClass.MIN_DOMAIN_MEMORY_LENGTH;
                    gdomainClass.currentDomain.domainMemory = result;
                }
                catch(e)
                {
                    log(3, "Not using domain memory");
                };
            };
            return (result);
        }


    }
}//package cmodule.encrypt
