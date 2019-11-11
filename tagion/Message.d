module tagion.Message;

import std.format;
import std.json;

import tagion.Options;

version(UPDATE_MESSAGE_TABEL) {
    @safe synchronized struct Message {
        private static shared string[string] translation;
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
    private static __gshared string[string] translation;
    synchronized struct Message {
        static set(string from, string to) {
            translation[from]=to;
        }
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
                Message.set(fmt,fmt);
            }
        }
        return format(fmt, args);
    }
    else {
        immutable translate_fmt=translation.get(fmt, fmt);
        return format(translate_fmt, args);
    }
}
