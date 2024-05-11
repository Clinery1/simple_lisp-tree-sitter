module.exports = grammar({
    name: "simplelisp",

    rules: {
        source_file: $ => repeat($._expr),

        _expr: $=>choice(
            // misc
            prec(1, choice(
                $.list,
                $.splat,
            )),

            // language items
            prec(2, choice(
                $.begin,
                $.defn,
                $.fn,
                $.multifn,
                $.cond,
                $.def,
                $.set,
            )),

            // terminals
            prec(3, choice(
                $.string,
                $.number,
                $.ident,
                $.float,
                $.comment,
                $.true,
                $.false,
                $.recur,
            )),
        ),

        recur: $=>"recur",

        list: $=>choice(
            seq(
                "(",
                field("first", $._expr),
                repeat($._expr),
                ")",
            ),
            seq("(", ")"),
        ),
        splat: $=>seq(
            "...",
            $._expr,
        ),

        begin: $=>seq(
            "(",
            field("keyword", "begin"),
            repeat($._expr),
            ")",
        ),

        defn: $=>seq(
            "(",
            "defn",
            field("name", $.ident),
            $._func_inner,
            ")",
        ),
        fn: $=>seq(
            "(",
            "fn",
            $._func_inner,
            ")",
        ),
        _func_inner: $=>seq(
            optional($.squiggle),
            choice($.multifn, $._fn_inner),
        ),
        multifn: $=>prec.left(repeat1($.multifn_inner)),
        multifn_inner: $=>seq(
            "(",
            $._fn_inner,
            ")",
        ),
        _fn_inner: $=>seq(
            $.vector,
            repeat($._expr),
        ),

        cond: $=>seq(
            "(",
            "cond",
            repeat($._cond_inner),
            ")",
        ),
        _cond_inner: $=>choice($.cond_else, $.cond_branch),
        cond_else: $=>prec(2, seq(
            "(",
            "else",
            $._expr,
            ")",
        )),
        cond_branch: $=>prec(1, seq(
            "(",
            field("condition", $._expr),
            $._expr,
            ")",
        )),

        def: $=>seq(
            "(",
            "def",
            field("name", $.ident),
            $._expr,
            ")",
        ),
        set: $=>seq(
            "(",
            "set",
            field("name", $.ident),
            $._expr,
            ")",
        ),

        vector: $=>seq(
            "[",
            repeat($.ident),
            "]",
        ),
        squiggle: $=>seq(
            "{",
            repeat($.ident),
            "}",
        ),

        // fundamental tokens
        ident: $=>/[^ \t\r\n()\[\]{}"'`~#0-9][^ .\t\r\n()\[\]{}"]*/,
        number: $=>/[0-9][0-9_]*/,
        float: $=>/[0-9][0-9_]*\.[0-9][0-9_]*/,
        string: $=>seq(
            '"',
            repeat(choice(
                $.string_escape,
                /[^\\"]/,
            )),
            '"',
        ),
        string_escape: $=>/\\["\\trn0]/,
        true: $=>"#t",
        false: $=>"#f",
        comment: $=>prec(10000, /;[^\n]*/),
    }
});
