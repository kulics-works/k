"Compiler" {
    "Antlr4/Runtime"
    "Antlr4/Runtime/Misc"
    "System"

    "Compiler" XsParser.
    "Compiler" Compiler Static.
}

Parameter -> {
    id(): Str
    type(): Str
    value(): Str
    annotation(): Str
    permission(): Str
}

(me:XsLangVisitor) ProcessFunctionSupport(items: [:]FunctionSupportStatementContext) -> (v:Str) {
    obj := ""
    content := ""
    lazy := []Str{}
    items @ item {
        ? item.GetChild(0) == :UsingStatementContext {
            lazy.add("}")
            content += "using ("Visit(item):(Str)") "BlockLeft" "Wrap""
        } _ {
            content += Visit(item)
        }
    }
    ? lazy.Count > 0 {
        [lazy.Count - 1 >= 0] @ i {
            content += BlockRight
        }
    }
    obj += content
    <- (obj)
}

(me:XsLangVisitor)(base) VisitFunctionStatement(context: FunctionStatementContext) -> (v: Any) {
    id := Visit(context.id()):(Result)
    obj := ""
    # 异步 #
    ? context.t.Type == Right Flow {
        pout := Visit(context.parameterClauseOut()):(Str)
        ? pout >< "void" {
            pout = ""Task"<"pout">"
        } _ {
            pout = Task
        }
        obj += " async "pout" "id.text""
    } _ {
        obj += ""Visit(context.parameterClauseOut())" "id.text""
    }
    # 泛型 #
    templateContract := ""
    ? context.templateDefine() >< Nil {
        template := Visit(context.templateDefine()):(TemplateItem)
        obj += template.Template
        templateContract = template.Contract
    }
    obj += ""Visit(context.parameterClauseIn())" "templateContract" "Wrap" "BlockLeft" "Wrap""
    obj += ProcessFunctionSupport(context.functionSupportStatement())
    obj += BlockRight + Wrap
    <- (obj)
}

(me:XsLangVisitor)(base) VisitReturnStatement(context: ReturnStatementContext) -> (v: Any) {
    r := Visit(context.tuple()):(Result)
    ? r.text == "()" {
        r.text = ""
    }
    <- ("return "r.text" "Terminate" "Wrap"")
}

(me:XsLangVisitor)(base) VisitTuple(context: TupleContext) -> (v: Any) {
    obj := "("
    [0 < context.expression().Length] @ i {
        r := Visit(context.expression(i)):(Result)
        ? i == 0 {
            obj += r.text
        } _ {
            obj += ", " r.text ""
        }
    }
    obj += ")"
    result := Result{ data = "var", text = obj }
    <- (result)
}

(me:XsLangVisitor)(base) VisitTupleExpression(context: TupleExpressionContext) -> (v: Any) {
    obj := "("
    [0 < context.expression().Length] @ i {
        r := Visit(context.expression(i)):(Result)
        ? i == 0 {
            obj += r.text
        } _ {
            obj += ", " r.text ""
        }
    }
    obj += ")"
    result := Result{ data = "var", text = obj }
    <- (result)
}

(me:XsLangVisitor)(base) VisitParameterClauseIn(context: ParameterClauseInContext) -> (v: Any) {
    obj := "("
    temp := []Str{}
    [context.parameter().Length - 1 >= 0] @ i {
        p := Visit(context.parameter(i)):(Parameter)
        temp.add(""p.annotation" "p.type" "p.id" "p.value"")
    }
    [temp.Count - 1 >= 0] @ i {
        ? i == temp.Count - 1 {
            obj += temp[i]
        } _ {
            obj += ", "temp[i]""
        }
    }

    obj += ")"
    <- (obj)
}

(me:XsLangVisitor)(base) VisitParameterClauseOut(context: ParameterClauseOutContext) -> (v: Any) {
    obj := ""
    ? context.parameter().Length == 0 {
        obj += "void"
    } context.parameter().Length == 1 {
        p := Visit(context.parameter(0)):(Parameter)
        obj += p.type
    }
    ? context.parameter().Length > 1 {
        obj += "( "
        temp := []Str{}
        [context.parameter().Length - 1 >= 0] @ i {
            p := Visit(context.parameter(i)):(Parameter)
            temp.add(""p.annotation" "p.type" "p.id" "p.value"")
        }
        [temp.Count - 1 >= 0] @ i {
            ? i == temp.Count - 1 {
                obj += temp[i]
            } _ {
                obj += ", "temp[i]""
            }
        }
        obj += " )"
    }
    <- (obj)
}

(me:XsLangVisitor)(base) VisitParameterClauseSelf(context: ParameterClauseSelfContext) -> (v: Any) {
    p := Parameter{}
    id := Visit(context.id(0)):(Result)
    p.id = id.text
    p.permission = id.permission
    p.type = Visit(context.typeType()):(Str)
    ? context.id(1) >< Nil {
        p.value = Visit(context.id(1)):(Result).text
    }
    <- (p)
}

(me:XsLangVisitor)(base) VisitParameter(context: ParameterContext) -> (v: Any) {
    p := Parameter{}
    id := Visit(context.id()):(Result)
    p.id = id.text
    p.permission = id.permission
    ? context.annotationSupport() >< Nil {
        p.annotation = Visit(context.annotationSupport()):(Str)
    }
    ? context.expression() >< Nil {
        p.value = "=" Visit(context.expression()):(Result).text ""
    }
    p.type = Visit(context.typeType()):(Str)
    <- (p)
}
