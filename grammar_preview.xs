# Grammar Overview

# Name Space
\Xs\Demo <- {
    System
    System\Linq
    System\Text
    System\Threading\Tasks
    System\ComponentModel\DataAnnotations\Schema
    System\ComponentModel\DataAnnotations
    IO.File # 可以隐藏元素使用内容
}

Main() ~> () {
    # Define, 一般情况下编译器会自动判断类型
    string := "10"   # Str
    float := 1.2     # F64
    integer := 123   # I32
    boolean := True  # Bl
    smallFloat := (1.2).ToF32() # basic type convert

    # Const
    PI 3.141592653

    # Mark String
    format := "the value is "integer","float","Boolean""

    # List
    arr := [I32]{ 1,2,3,4,5 }
    arr2 := { 1,2,3,4,5}
    Prt( arr[0] ) # 使用下标获取

    # Dictionary, 前面为key，后面为value
    dic := {["1"]False, ["2"]True}
    dic := [[Str]Bl]{ ["1"]False, ["2"]True}
    Prt( dic["1"] ) # 使用key获取

    arr: Arr<I32> = ArrOf(1,2,3)
    # Anonymous Package
    new := {
        Title = "nnn",
        Num = 8
    }

    # Function
    fn(in: I32) -> (out: I32) {} # (I32)->(I32) 

    # Function with no params no return
    doSomeThingVoid() -> () {
        doSomeThingA()
        doSomeThingB()
    }

    # Full Function with in params and out params
    doSomeThingWithParams(x: I32, y: Str) -> (a: I32, b: Str) {
        <- (x, y)
    }

    b2c()
    # 使用 _ 舍弃返回值
    _ = a2b(3, "test")

    # Judge，当表达式的结果只有Bool时，相当于if，只当true时才执行
    ? 1+1 >< 2 {
        doSomeThingA()
    } _ { # else
        doSomeThingB()
    }

    # pattern match
    ? x -> [0<6] {
        doSomeThingA()
    } 14 {
        doSomeThingB()
    } _ { # default
        doSomeThingC()
    }

    # type match
    ? object -> :Str { 
        Prt("string") 
    } :I32 { 
        Prt("integer") 
    } :F64 { 
        Prt("float") 
    } :Bl { 
        Prt("boolean") 
    } :{} {
        Prt("object")
    } () { 
        Prt("null") 
    }

    # Loop, use identify to take out single item, default is it
    @ item <- array {
        Prt(item)
    }
    # take index and value, both worked at Dictionary
    @ [index]value <- array {
        Prt(index, value)
    }

    # Iterator, Increment [from < to, step], Decrement [from > to, step], step can omit 
    @ it <- [0 < 100, 2] {
        Prt(it)
    }
    @ it <- [10>=1] {}

    # Infinite
    @ {
        ? a > b {
            <- @ # jump out loop
        } _ {
            -> @ # continue
        }
    }
    # Conditional
    a := 0
    @ a < 10 {
        a += 1
    }
    
    # Package，支持 variable 类型，通常用来包装数据
    View -> {
        Width: I32
        Height: I32
        Background: Str
    }

    # 也支持包装方法
    Button -> {
        Width: I32
        Height: I32
        Background: Str
        Title: Str
        
        Click() -> () {
            # 可以通过 .. 来访问包自身属性或方法
            Prt( ..Title )
            doSomeThingA()
            doSomeThingB()
        }
    }

    Image -> {
        # 私有属性，不能被外部访问，也不能被重包装
        _Width := 0
        _Height := 0
        _Source := "" 
        # 初始化方法
        Init(w: I32, h: I32, s: Str) -> (v:Image) {  
            (_Width, _Height, _Source) = (w,h,s)
            <- (..)
        }
    }

    # Extension ，对某个包扩展，可以用来扩展方法
    View <~ {
        Show() -> () {}
        Hide() -> () {}
        # 重载操作符
        +() -> () {}
        -() -> () {}
    }

    # Protocol, implemented by package
    Animation <- {
        Speed: I32 # 需求变量，导入的包必须实现定义
        Move(s: I32) -> () # 需求方法，导入的包必须实现定义
    }

    # Combine Package，通过引入来复用属性和方法
    ImageButton -> {
        Button: Button    # 通过包含其它包，来组合新的包使用 
        Title: Str
    } Animation { # Implement protocol
        Speed := 2

        Move(s: I32) -> () {
            t := 5000/s
            play( s + t )
        }
    } (w: I32, h: I32)...(w, h , "img") {
        Title = "img btn"
    } {Image} { # 继承View
        Background: Str # 重名覆盖
    }

    # Create an package object
    ib := ImageButton{}
    # Calling property
    ib.Title = "OK"
    # Calling method
    ib.Button.Show()
    # Calling protocol
    ib.Move(6)

    # Create an object with simple assign
    ib2 := ImageButton{
        Title="Cancel"，Background="red"
    }
    list := [I32]{1,2,3,4,5}
    map := [[Str]I32]{["1"]1,["2"]2,["3"]3}

    # Create an object with params
    img := Image{}.Init(30, 20, "./icon.png")
    imgBtn := New<ImageButton>(1, 1)

    # 可以使用 Is<Type>() 判断类型，使用 As<Type>() 来转换包类型
    ? ib.Is<ImageButton>() {
        ib.As<View>().Show()
    }

    # get type
    Prt( ?(ib) )
    Prt( ?(:ImageButton) )

    # Check, listen the Excption Function
    file := File("./test.xy")
    ! f := ReadFile("demo.xy") {
        doSomeThing...
    } ex {
        !(ex) # Use !() to declare an Excption
    } _ {
        file.Dispose()
    }

    # Use ~> to declare Async Function
    task(in: I32) ~> (out: I32) {
        # make a function to await
        <~ doSomeThingA()
        doSomeThingB()
        <~ doSomeThingC()
        <- (in)
    }

    x := task(6)

    # Annotation 
    [assemby: Table("user"), D(False,Name="d",Hide=True)]
    User -> {
        [Column("id"), Required, Key]
        Id(): Str
        [Column("nick_name"), Required]
        NickName(): Str
        [Column("time_update"), Required]
        TimeUpdate(): I32
    }

    # Pointer Type
    a: I32! = ()
    # Get Pointer
    c := a?
    # Get Value
    d := c!
    # Safe Call
    e := a?.ToStr()
    # OrElseValue
    f := a.Def(128)
    
    # Generic package
    Table<T> -> {
        Data: T

        SetData(d: T) -> () {
            Data = d
        }
    }
    # Generic function
    Add<T>(x1: T, x2: T) -> (y: T) {
        <- (x1 + x2)
    }

    # Lambda Function
    arr.Select( {it -> it > 2} )

    # Func params
    Func(in: (I32) -> (I32)) -> () {
        in(1)
    }
    Func( (x: I32) -> (y: I32) {
        <- (y)
    })

    # linq
    arr := from id in expr where expr order expr select expr

    # event
    EventHandle -> {
        PropertyChanged: Event<PropertyChangedEventHandler>
    }

    # control
    Data -> {
        B() := 0
        C(): I32 {get;set;}

        D(): I32
        E(): PropertyChangedEventHandler {add;remove;}
    }

    # use \ to use namespace content
    func(x: \NS\NS2\NS3.Pkg) -> () {
        y := \NS\NS2\NS4.Pkg{}
        z := \NS.Pkg{}
    }

    Color -> [
        Red 
        Green
        Blue
    ]
}

# The Future

\Namespace {
    Num = 1
    Txt = "123"
} <- {
    System
    System\IO
}
Num: I32
Txt: Str
Class -> {
    Num: I32
    Txt: Str
    FuncInClass() -> () {
        Func()
    }
}
Func() -> () {
    ClassInFunc -> {
        Num: I32
        Txt: Str
        Func() -> () {
        } 
    }
    UseProtocol(Class{})
}
Protocol -> {
    FuncInClass() -> () {
    }
}
UseProtocol(it: Protocol) -> () {
    it.FuncInClass()
}