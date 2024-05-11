(defn
   "(" @delimiter
   ")" @delimiter @sentinel) @container
(fn
   "(" @delimiter
   ")" @delimiter @sentinel) @container
(multifn_inner
   "(" @delimiter
   ")" @delimiter @sentinel) @container

(begin
   "(" @delimiter
   ")" @delimiter @sentinel) @container
(def
   "(" @delimiter
   ")" @delimiter @sentinel) @container
(set
   "(" @delimiter
   ")" @delimiter @sentinel) @container
(list
   "(" @delimiter
   ")" @delimiter @sentinel) @container

(cond
   "(" @delimiter
   ")" @delimiter @sentinel) @container
(cond_branch
   "(" @delimiter
   ")" @delimiter @sentinel) @container
(cond_else
   "(" @delimiter
   ")" @delimiter @sentinel) @container

(vector
   "[" @delimiter
   "]" @delimiter @sentinel) @container
(squiggle
   "{" @delimiter
   "}" @delimiter @sentinel) @container
