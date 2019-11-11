module tagion.Message;

import std.format;
import std.json;

import tagion.Options;

version(UPDATE_MESSAGE_TABEL) {
    @safe synchronized struct Message {
        static shared string[string] translation;
        static JSONValue toJSON() {
            JSONValue language;
            result[language.stringof]="en";
            JSONValue tabel;
            foreach(from, to; tabel) {
                tabel[from]=to;
            }
            result[translation.stringof]=tabel;
        }
    }
}
else {
    synchronized struct Message {
        static __gshared string[string] translation;
        static void load(JSONValue json) {
            auto trans=json[translation.stringof].object;
            foreach(from, to; trans) {
                translation[from]=to.str;
            }
        }
    }
}

@trusted
string message(Args...)(string fmt, lazy Args args) {
    if (options.message.language == "" ) {
        version(UPDATE_MESSAGE_TABEL) {
            if (!(fmt in translation)) {
                Message.translation[fmt]=fmt;
            }
        }
        return format(fmt, args);
    }
    else {
        immutable translate_fmt=Message.translation.get(fmt, fmt);
        return format(fmt, args);
    }
}
