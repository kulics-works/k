﻿using Newtonsoft.Json;
using System;

namespace XyLang.Library
{
    [JsonConverter(typeof(I8Converter))]
    public class I8: IXyValue
    {
        private sbyte v;
        public I8() { }
        public I8(object o)
        {
            switch (o)
            {
                case sbyte _:
                case short _:
                case int _:
                case long _:
                case I8 _:
                case I16 _:
                case I32 _:
                case I64 _:

                case byte _:
                case ushort _:
                case uint _:
                case ulong _:
                case U8 _:
                case U16 _:
                case U32 _:
                case U64 _:

                case float _:
                case double _:
                case F32 _:
                case F64 _:

                case char _:
                case Chr _:

                case string _:
                case Str _:
                    v = Convert.ToSByte(o);
                    break;
                default:
                    throw new Exception("not support type");
            }
        }
        public I8(Str value, I32 fromBase) => v = Convert.ToSByte(value, fromBase);
        public Str ToBase(I32 fromBase) => Convert.ToString(v, fromBase);

        public static implicit operator I8(sbyte it) => new I8(it);
        public static implicit operator sbyte(I8 it) => it.v;

        public static I8 operator +(I8 a, I8 b) => new I8(a.v + b.v);
        public static I8 operator -(I8 a, I8 b) => new I8(a.v - b.v);
        public static I8 operator *(I8 a, I8 b) => new I8(a.v * b.v);
        public static I8 operator /(I8 a, I8 b) => new I8(a.v / b.v);
        public static I8 operator %(I8 a, I8 b) => new I8(a.v % b.v);

        public static bool operator <(I8 a, I8 b) => a.v < b.v;
        public static bool operator <=(I8 a, I8 b) => a.v <= b.v;
        public static bool operator >(I8 a, I8 b) => a.v > b.v;
        public static bool operator >=(I8 a, I8 b) => a.v >= b.v;
        public static bool operator ==(I8 a, I8 b) => a.v == b.v;
        public static bool operator !=(I8 a, I8 b) => a.v != b.v;

        public I8 AND(I8 it) => new I8(v & it);
        public I8 OR(I8 it) => new I8(v | it);
        public I8 XOR(I8 it) => new I8(v ^ it);
        public I8 NOT() => new I8(~v);
        public I8 LFT(int it) => new I8(v << it);
        public I8 RHT(int it) => new I8(v >> it);

        public override bool Equals(object o)
        {
            if (o is I8 b)
            {
                return v == b.v;
            }
            else
            {
                return false;
            }
        }

        public bool Equals(I8 b) => b != null && v == b.v;

        public override int GetHashCode() => v.GetHashCode();

        public TypeCode GetTypeCode() => v.GetTypeCode();

        public override string ToString() => v.ToString();
        public string ToString(string format) => v.ToString(format);

        public sbyte ToValue() => v;
    }

    [JsonConverter(typeof(I16Converter))]
    public class I16 : IXyValue
    {
        private short v;
        public I16() { }
        public I16(object o)
        {
            switch (o)
            {
                case sbyte _:
                case short _:
                case int _:
                case long _:
                case I8 _:
                case I16 _:
                case I32 _:
                case I64 _:

                case byte _:
                case ushort _:
                case uint _:
                case ulong _:
                case U8 _:
                case U16 _:
                case U32 _:
                case U64 _:

                case float _:
                case double _:
                case F32 _:
                case F64 _:

                case char _:
                case Chr _:

                case string _:
                case Str _:
                    v = Convert.ToInt16(o);
                    break;
                default:
                    throw new Exception("not support type");
            }
        }
        public I16(Str value, I32 fromBase) => v = Convert.ToInt16(value, fromBase);
        public Str ToBase(I32 fromBase) => Convert.ToString(v, fromBase);

        public static implicit operator I16(short it) => new I16(it);
        public static implicit operator short(I16 it) => it.v;

        public static I16 operator +(I16 a, I16 b) => new I16(a.v + b.v);
        public static I16 operator -(I16 a, I16 b) => new I16(a.v - b.v);
        public static I16 operator *(I16 a, I16 b) => new I16(a.v * b.v);
        public static I16 operator /(I16 a, I16 b) => new I16(a.v / b.v);
        public static I16 operator %(I16 a, I16 b) => new I16(a.v % b.v);

        public static bool operator <(I16 a, I16 b) => a.v < b.v;
        public static bool operator <=(I16 a, I16 b) => a.v <= b.v;
        public static bool operator >(I16 a, I16 b) => a.v > b.v;
        public static bool operator >=(I16 a, I16 b) => a.v >= b.v;
        public static bool operator ==(I16 a, I16 b) => a.v == b.v;
        public static bool operator !=(I16 a, I16 b) => a.v != b.v;

        public I16 AND(I16 it) => new I16(v & it);
        public I16 OR(I16 it) => new I16(v | it);
        public I16 XOR(I16 it) => new I16(v ^ it);
        public I16 NOT() => new I16(~v);
        public I16 LFT(int it) => new I16(v << it);
        public I16 RHT(int it) => new I16(v >> it);

        public override bool Equals(object o)
        {
            if (o is I16 b)
            {
                return v == b.v;
            }
            else
            {
                return false;
            }
        }

        public bool Equals(I16 b) => b != null && v == b.v;

        public override int GetHashCode() => v.GetHashCode();

        public TypeCode GetTypeCode() => v.GetTypeCode();

        public override string ToString() => v.ToString();
        public string ToString(string format) => v.ToString(format);

        public short ToValue() => v;
    }

    [JsonConverter(typeof(I32Converter))]
    public class I32 : IXyValue
    {
        private int v;
        public I32() { }
        public I32(object o)
        {
            switch (o)
            {
                case sbyte _:
                case short _:
                case int _:
                case long _:
                case I8 _:
                case I16 _:
                case I32 _:
                case I64 _:

                case byte _:
                case ushort _:
                case uint _:
                case ulong _:
                case U8 _:
                case U16 _:
                case U32 _:
                case U64 _:

                case float _:
                case double _:
                case F32 _:
                case F64 _:

                case char _:
                case Chr _:

                case string _:
                case Str _:
                    v = Convert.ToInt32(o);
                    break;
                default:
                    throw new Exception("not support type");
            }
        }
        public I32(Str value, I32 fromBase) => v = Convert.ToInt32(value, fromBase);
        public Str ToBase(I32 fromBase) => Convert.ToString(v, fromBase);

        public static implicit operator I32(int it) => new I32(it);
        public static implicit operator int(I32 it) => it.v;

        public static I32 operator +(I32 a, I32 b) => new I32(a.v + b.v);
        public static I32 operator -(I32 a, I32 b) => new I32(a.v - b.v);
        public static I32 operator *(I32 a, I32 b) => new I32(a.v * b.v);
        public static I32 operator /(I32 a, I32 b) => new I32(a.v / b.v);
        public static I32 operator %(I32 a, I32 b) => new I32(a.v % b.v);

        public static bool operator <(I32 a, I32 b) => a.v < b.v;
        public static bool operator <=(I32 a, I32 b) => a.v <= b.v;
        public static bool operator >(I32 a, I32 b) => a.v > b.v;
        public static bool operator >=(I32 a, I32 b) => a.v >= b.v;
        public static bool operator ==(I32 a, I32 b) => a.v == b.v;
        public static bool operator !=(I32 a, I32 b) => a.v != b.v;

        public I32 AND(I32 it) => new I32(v & it);
        public I32 OR(I32 it) => new I32(v | it);
        public I32 XOR(I32 it) => new I32(v ^ it);
        public I32 NOT() => new I32(~v);
        public I32 LFT(int it) => new I32(v << it);
        public I32 RHT(int it) => new I32(v >> it);

        public override bool Equals(object o)
        {
            if (o is I32 b)
            {
                return v == b.v;
            }
            else
            {
                return false;
            }
        }

        public bool Equals(I32 b) => b != null && v == b.v;

        public override int GetHashCode() => v.GetHashCode();

        public TypeCode GetTypeCode() => v.GetTypeCode();

        public override string ToString() => v.ToString();
        public string ToString(string format) => v.ToString(format);

        public int ToValue() => v;
    }

    [JsonConverter(typeof(I64Converter))]
    public class I64 : IXyValue
    {
        private long v;
        public I64() { }
        public I64(object o)
        {
            switch (o)
            {
                case sbyte _:
                case short _:
                case int _:
                case long _:
                case I8 _:
                case I16 _:
                case I32 _:
                case I64 _:

                case byte _:
                case ushort _:
                case uint _:
                case ulong _:
                case U8 _:
                case U16 _:
                case U32 _:
                case U64 _:

                case float _:
                case double _:
                case F32 _:
                case F64 _:

                case char _:
                case Chr _:

                case string _:
                case Str _:
                    v = Convert.ToInt64(o);
                    break;
                default:
                    throw new Exception("not support type");
            }
        }
        public I64(Str value, I32 fromBase) => v = Convert.ToInt64(value, fromBase);
        public Str ToBase(I32 fromBase) => Convert.ToString(v, fromBase);

        public static implicit operator I64(long it) => new I64(it);
        public static implicit operator long(I64 it) => it.v;

        public static I64 operator +(I64 a, I64 b) => new I64(a.v + b.v);
        public static I64 operator -(I64 a, I64 b) => new I64(a.v - b.v);
        public static I64 operator *(I64 a, I64 b) => new I64(a.v * b.v);
        public static I64 operator /(I64 a, I64 b) => new I64(a.v / b.v);
        public static I64 operator %(I64 a, I64 b) => new I64(a.v % b.v);

        public static bool operator <(I64 a, I64 b) => a.v < b.v;
        public static bool operator <=(I64 a, I64 b) => a.v <= b.v;
        public static bool operator >(I64 a, I64 b) => a.v > b.v;
        public static bool operator >=(I64 a, I64 b) => a.v >= b.v;
        public static bool operator ==(I64 a, I64 b) => a.v == b.v;
        public static bool operator !=(I64 a, I64 b) => a.v != b.v;

        public I64 AND(I64 it) => new I64(v & it);
        public I64 OR(I64 it) => new I64(v | it);
        public I64 XOR(I64 it) => new I64(v ^ it);
        public I64 NOT() => new I64(~v);
        public I64 LFT(int it) => new I64(v << it);
        public I64 RHT(int it) => new I64(v >> it);

        public override bool Equals(object o)
        {
            if (o is I64 b)
            {
                return v == b.v;
            }
            else
            {
                return false;
            }
        }

        public bool Equals(I64 b) => b != null && v == b.v;

        public override int GetHashCode() => v.GetHashCode();

        public TypeCode GetTypeCode() => v.GetTypeCode();

        public override string ToString() => v.ToString();
        public string ToString(string format) => v.ToString(format);

        public long ToValue() => v;
    }
    public class I8Converter : JsonConverter<I8>
    {
        public override void WriteJson(JsonWriter writer, I8 value, JsonSerializer serializer) => writer.WriteValue(value);
        public override I8 ReadJson(JsonReader reader, Type objectType, I8 existingValue, bool hasExistingValue, JsonSerializer serializer) => new I8((sbyte)reader.Value);
    }
    public class I16Converter : JsonConverter<I16>
    {
        public override void WriteJson(JsonWriter writer, I16 value, JsonSerializer serializer) => writer.WriteValue(value);
        public override I16 ReadJson(JsonReader reader, Type objectType, I16 existingValue, bool hasExistingValue, JsonSerializer serializer) => new I16((short)reader.Value);
    }
    public class I32Converter : JsonConverter<I32>
    {
        public override void WriteJson(JsonWriter writer, I32 value, JsonSerializer serializer) => writer.WriteValue(value);
        public override I32 ReadJson(JsonReader reader, Type objectType, I32 existingValue, bool hasExistingValue, JsonSerializer serializer) => new I32((int)reader.Value);
    }
    public class I64Converter : JsonConverter<I64>
    {
        public override void WriteJson(JsonWriter writer, I64 value, JsonSerializer serializer) => writer.WriteValue(value);
        public override I64 ReadJson(JsonReader reader, Type objectType, I64 existingValue, bool hasExistingValue, JsonSerializer serializer) => new I64((long)reader.Value);
    }
}