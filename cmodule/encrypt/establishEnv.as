//Created by Action Script Viewer - https://www.buraks.com/asv
package cmodule.encrypt
{
    public function establishEnv():void
    {
        var ns:Namespace;
        try
        {
            ns = new Namespace("avmplus");
            gdomainClass = ns::["Domain"];
            gshell = true;
        }
        catch(e)
        {
        };
        if (!gdomainClass)
        {
            ns = new Namespace("flash.system");
            gdomainClass = ns::["ApplicationDomain"];
        };
    }

}//package cmodule.encrypt
