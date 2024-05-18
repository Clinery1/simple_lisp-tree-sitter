"defn"    @keyword.function
"fn"      @keyword.function
"def"     @keyword
"set"     @keyword
"begin"   @keyword
"cond"    @keyword.conditional
"object"  @keyword
"chain"   @keyword
"module"  @keyword.import

(true)  @boolean
(false)  @boolean

"("   @punctuation.bracket
")"   @punctuation.bracket
"["   @punctuation.bracket
"]"   @punctuation.bracket
"{"   @punctuation.bracket
"}"   @punctuation.bracket

(ident) @variable
(dotIdent) @variable.member
(string) @string
(string_escape) @string.escape
(char) @character
(number) @number
(float) @float
(comment) @comment @spell
(docComment) @comment @spell

(recur) @function.builtin

(splat "..." @punctuation)

(module (ident) @module)

(defn
  name: (ident) @function.definition)
(def
  name: (ident) @variable.definition)
(set
  name: (ident) @variable)
(cond_else
  "else" @keyword.conditional)
(chain
  name: (ident) @variable.definition)

(list
  first: (ident) @function.call)
(object
  (dotIdent) @variable.member.definition)
(path
  (pathSeparator) @punctuation)
(pathField) @variable.member

(squiggle
  (ident) @variable.parameter)
(vector
  (ident) @variable.parameter)
(vector
  ((ident) @punctuation (#eq? @punctuation "&")))

((dotIdent) @punctuation.special (#eq? @punctuation.special ".$"))

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

((ident) @operator (#eq? @operator "+="))
((ident) @operator (#eq? @operator "-="))
((ident) @operator (#eq? @operator "*="))
((ident) @operator (#eq? @operator "/="))
((ident) @operator (#eq? @operator "%="))

((ident) @function.builtin (#eq? @function.builtin "gcCollect"))
((ident) @function.builtin (#eq? @function.builtin "and"))
((ident) @function.builtin (#eq? @function.builtin "or"))
((ident) @function.builtin (#eq? @function.builtin "index"))
((ident) @function.builtin (#eq? @function.builtin "list"))
((ident) @function.builtin (#eq? @function.builtin "clone"))
((ident) @function.builtin (#eq? @function.builtin "length"))
((ident) @function.builtin (#eq? @function.builtin "listPop"))
((ident) @function.builtin (#eq? @function.builtin "debug"))
((ident) @function.builtin (#eq? @function.builtin "intern"))
