import std.format : format;
import dqml;

import backend;

mixin PluginMetaData!MqttPlugin;

class MqttPlugin : QQmlExtensionPlugin
{

    ~this() {
        writeln("DSide plugin destroyed");
    }

    override public void initializeEngine(QQmlEngine engine, string uri)
    {
        writeln("MqttPlugin.initializeEngine: ",uri);
    }

    override public void registerTypes(string uri)
    {
        writeln("MqttPlugin.registerTypes()");
        writeln("\t",uri);

        // assert (uri == "org.kde.plasma.private.dlang.backend");

        // Register this with with the QML engine
        // int result = qmlRegisterType!Backend(uri, 1, 0, "Backend");
        int result = qmlRegisterSingletonType!Backend(uri,1,0,"Backend");
        writeln("registerTypes() -> Result: ", result);
        // int result = qmlRegisterType!Test("ContactModule", 1, 0, "Test");

    }

}
