module backend;

import dqml;
import std.conv : to;

//this(string name, string read, string write, string notify)
@QtProperty!string("number", "getNumber", "setNumber", "numberChanged")
class Backend : QObject
{
    mixin Q_OBJECT;

    this() {
        writeln("Backend ctor");
    }

    ~this() {
        writeln("Backend dtor");
    }

    @QtSlot()
    public string getNumber() {
        writeln("getNumber()");
        return m_number.to!string;
    }

    @QtSlot()
    public void setNumber(string number) {
      writeln("setNumber(",number,")");
      m_number = number.to!int;
      numberChanged(m_number.to!string);
    }

   // @QtMethod
    @QtSlot()
    public void incrementNumber()
    {
        writeln("incrementNumber()");
        m_number++;
        numberChanged(m_number.to!string);
    }

    @QtSignal()
    public void numberChanged(string number);

    private int m_number = 0;
}
