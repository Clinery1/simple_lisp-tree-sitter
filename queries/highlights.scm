"defn"  @keyword.function
"fn"    @keyword.function
"def"   @keyword
"set"   @keyword
"begin" @keyword
"cond"  @keyword.conditional

(true)  @boolean
(false)  @boolean

"("     @punctuation.bracket
")"     @punctuation.bracket
"["     @punctuation.bracket
"]"     @punctuation.bracket
"{"     @punctuation.bracket
"}"     @punctuation.bracket

(ident) @variable
(string) @string
(string_escape) @string.escape
(number) @number
(float) @float
(comment) @comment
(comment) @spell

(recur) @function.builtin

(splat "..." @punctuation)

(defn
    name: (ident) @function.definition)
(def
    name: (ident) @variable.definition)
(set
    name: (ident) @variable)
(cond_else
    "else" @keyword.conditional)

(list
   first: (ident) @function.call)

(squiggle
    (ident) @variable.parameter)
(vector
    ((ident) @punctuation (#eq? @punctuation "&")))
(vector
    (ident) @variable.parameter)

((ident) @operator (#eq? @operator "="))
((ident) @operator (#eq? @operator "!="))
((ident) @operator (#eq? @operator "<"))
((ident) @operator (#eq? @operator "<="))
((ident) @operator (#eq? @operator ">"))
((ident) @operator (#eq? @operator ">="))

((ident) @operator (#eq? @operator "+"))
((ident) @operator (#eq? @operator "-"))
((ident) @operator (#eq? @operator "*"))
((ident) @operator (#eq? @operator "/"))
((ident) @operator (#eq? @operator "%"))
((ident) @keyword (#eq? @keyword "and"))
((ident) @keyword (#eq? @keyword "or"))
