" Vim syntaxtax file
" Language: pseudocode
" Maintainer: Simone Fidanza
" Latest Revision: 2023-06-16 16:53

if exists("b:current_syntaxtax")
  finish
endif


" ----------------------------------------------------------------------------
" BUFFER SPECIFIC OPTIONS
" ----------------------------------------------------------------------------
let &l:conceallevel=1
let &l:concealcursor="n"


" ----------------------------------------------------------------------------
" DOCUMENT WIDE HIGHLIGHTS
" ----------------------------------------------------------------------------
syntax match pseudoHorizontalRule /^-\+$/            containedin=ALL
syntax match pseudoCommentInline  ://.*$:            containedin=ALL
syntax match pseudoBoolean        /\v(TRUE|FALSE)/   containedin=ALL
syntax match pseudoConstant       /\v(INPUT|OUTPUT|LAVORO|ALGORITMO|SE|ALLORA|ALTRIMENTI|FINE|MENTRE|NOT|OR|AND)@!<[A-Z][A-Z_]*>/ containedin=ALLBUT,@pseudoPreambleCluster,@pseudoFunctionCluster

syntax match pseudoWhitespace 
  \ /\(\%u0009\|\%u000A\|\%u000B\|\%u000C\|\%u000D\|\%u0020\|\%u0085\|\%u00A0\|\%u1680\|\%u2000\|\%u2001\|\%u2002\|\%u2003\|\%u2004\|\%u2005\|\%u2006\|\%u2007\|\%u2008\|\%u2009\|\%u200A\|\%u2028\|\%u2029\|\%u202F\|\%u205F\|\%u3000\)\+$/ containedin=ALL

syntax region pseudoCommentBlock containedin=ALL
  \ start=:/\*:
  \ end=  :\*/:


" ----------------------------------------------------------------------------
" BEGINNING OF A PSEUDOCODE FILE
" ----------------------------------------------------------------------------
syntax region pseudoFilePreamble contains=@pseudoPreambleCluster
  \ transparent
  \ start=/\%^/
  \ end=  /^\ze-\+$/

syntax keyword pseudoIncludeDirective vedere contained

syntax match pseudoFileTitle   /\%^[A-Z][A-Z ]*$/       contained
syntax match pseudoIncludeFile /\v"\.\/([^"]+\.[^"]+)"/ contained
syntax match pseudoFileHeader  /^=\+$/                  contained

syntax cluster pseudoPreambleCluster contains=
  \ pseudoFileTitle,
  \ pseudoFileHeader,
  \ pseudoIncludeDirective,
  \ pseudoIncludeFile


" ----------------------------------------------------------------------------
" FUNCTION DECLARATION
" ----------------------------------------------------------------------------
syntax region pseudoFunctionDeclaration contains=@pseudoFunctionCluster
  \ transparent
  \ start=/^\vFUNZIONE (.*)$/
  \ end=  /^ALGORITMO:$/

syntax keyword pseudoFunctionKeyword FUNZIONE                      contained
syntax keyword pseudoKeywords        INPUT OUTPUT LAVORO ALGORITMO contained

syntax match pseudoFunctionTitle       /\v(^FUNZIONE\s)@<=<[a-z][a-z0-9_]*>/  contained
syntax match pseudoFunctionHeader      /^=\+$/                                contained
syntax match pseudoFunctionDescription /\v(^\=+$\n)@<=\_.{-}\n\n(^INPUT:$)@=/ contained

syntax cluster pseudoFunctionCluster contains=
  \ pseudoFunctionKeyword,
  \ pseudoKeywords,
  \ pseudoFunctionTitle,
  \ pseudoFunctionHeader,
  \ pseudoFunctionDescription,
  \ pseudoParameterDeclaration,


" ----------------------------------------------------------------------------
" PARAMETER DECLARATION
" ----------------------------------------------------------------------------
syntax region pseudoParameterDeclaration contains=@pseudoParameterCluster
  \ transparent contained
  \ start=/^-\s/
  \ end=  /\v(\.|;)$/

syn match pseudoParameterSeparator /,/ contained

syntax match pseudoParameterName     contained
  \ /\v^-\s\zs<[a-z][a-z0-9_]*>\ze,/ 
syntax match pseudoParameterDescript contained
  \ /\v(^-\s<[a-z][a-z0-9_]*>,\s)@<=(.*|.*\n\s{2}.*)\ze,/
syntax match pseudoParameterType     contained
  \ /\v(^-\s<[a-z][a-z0-9_]*>,\s(.*|.*\n\s{2}.*)\ze,)@<=\s<\w+>/

syntax cluster pseudoParameterCluster contains=
  \ pseudoParameterSeparator,
  \ pseudoParameterName,
  \ pseudoParameterDescription,
  \ pseudoParameterType


" ----------------------------------------------------------------------------
" ALGORITHM BLOCK
" ----------------------------------------------------------------------------
syntax region pseudoAlgorithmBlock contains=@pseudoAlgorithmCluster nextgroup=pseudoAlgorithmBlock
  \ start=/^ALGORITMO:$/
  \ end=  /^\ze-\+$/

syntax keyword pseudoAlgorithmKeyword ALGORITMO contained

syntax keyword pseudoFunctionBuiltins contained
  \ StampareAVideo LeggereDaTastiera AprireFile ChiudereFile LeggereDaFile 
  \ ScrivereSuFile

syntax match pseudoFunctionCall /\v<[a-z][a-z0-9_]*>(\(|.*\))@=/ contained
syntax match pseudoDelimiters   /[,()\[\]{}]/                    contained
syntax match pseudoVariable     /\<[a-z][a-z0-9_]*\>\((\)\@!/    contained
syntax match pseudoOperators    /[:=\*\/+-]/                     contained
syntax match pseudoString       /\(\w\)\@!\(".*"\|'.*'\)/        containedin=ALL
syntax match pseudoCharacter    /'\w'/                           contained
syntax match pseudoEscape       /\\\w\+\>/                       containedin=pseudoString
syntax match pseudoInteger      /\v(<\d+>|<[-+]\d+>)/            containedin=ALL
syntax match pseudoFloat        /\v(<\d+\.\d*>|<[-+]\d+\.\d*>)/  containedin=ALL

syntax match pseudoLogicalNot /\v<NOT\s|NOT>/  conceal cchar=¬ contained
syntax match pseudoLogicalAnd /\<AND\>/        conceal cchar=& contained
syntax match pseudoLogicalOr  /\<OR\>/         conceal cchar=∥ contained

syntax match pseudoConditionals /\v(|\s+)(FINE\s)@<!<SE>/                  contained
syntax match pseudoConditionals /\v^(|\s+)<FINE>\s(<MENTRE>)@!<SE>(|\s+)$/ contained
syntax match pseudoConditionals /\<ALTRIMENTI\>/                           contained
syntax match pseudoConditionals /\<ALLORA\>/                               contained

syntax match pseudoRepeats /\v^(|\s+)(FINE\s)@<!<MENTRE>(\s\(.*\)(|\s+)$)@=/ contained
syntax match pseudoRepeats /\v^(|\s+)<FINE>\s(<SE>)@!<MENTRE>(|\s+)$/        contained

syntax region pseudoConditional contains=@pseudoAlgorithmCluster
   \ transparent contained
   \ start=/\v^(|\s+)(FINE\s)@<!<SE>(\s\(.*\)\sALLORA(|\s+)$)@=/
   \ end=  /\v^(|\s+)<FINE>\s(<MENTRE>)@!<SE>(|\s+)$/

syntax region pseudoRepeat contains=@pseudoAlgorithmCluster
  \ transparent contained
  \ start=/\v^(|\s+)(FINE\s)@<!<MENTRE>(\s\(.*\)(|\s+)$)@=/
  \ end=  /\v^(|\s+)<FINE>\s(<SE>)@!<MENTRE>(|\s+)$/


syntax cluster pseudoAlgorithmCluster contains=
  \ pseudoAlgorithmKeyword,
  \ pseudoFunctionBuiltins,
  \ pseudoFunctionCall,
  \ pseudoVariable,
  \ pseudoOperators,
  \ pseudoString,
  \ pseudoCharacter,
  \ pseudoEscape,
  \ pseudoInteger,
  \ pseudoFloat,
  \ pseudoLogicalOr,
  \ pseudoLogicalNot,
  \ pseudoLogicalAnd,
  \ pseudoDelimiters,
  \ pseudoRepeat,
  \ pseudoRepeats,
  \ pseudoConditional,
  \ pseudoConditionals


" ----------------------------------------------------------------------------
" HIGHLIGHTS
" ----------------------------------------------------------------------------
highlight link pseudoCommentInline  Comment
highlight link pseudoCommentBlock   Comment
highlight link pseudoHorizontalRule Comment
highlight link pseudoConstant       Constant
highlight link pseudoBoolean        Boolean
highlight link pseudoWhitespace     Error

highlight link pseudoFileTitle        Bold
highlight link pseudoFileHeader       Title
highlight link pseudoIncludeDirective Include
highlight link pseudoIncludeFile      String

highlight link pseudoKeywords         Keyword
highlight link pseudoFunctionKeyword  Keyword
highlight link pseudoAlgorithmKeyword Keyword

highlight link pseudoFunctionTitle       Function
highlight link pseudoFunctionHeader      Title
highlight link pseudoFunctionDescription Italic

highlight link pseudoParameterSeparator   Comment
highlight link pseudoParameterName        Underlined
highlight link pseudoParameterDescription Italic
highlight link pseudoParameterType        Type

highlight link pseudoString           String
highlight link pseudoCharacter        Character
highlight link pseudoEscape           Special
highlight link pseudoOperators        Operator
highlight link pseudoFunctionBuiltins Function
highlight link pseudoFunctionCall     Function
highlight link pseudoDelimiters       Delimiter
highlight link pseudoVariable         Variable
highlight link pseudoInteger          Number
highlight link pseudoFloat            Float

highlight link pseudoConditional  Conditional
highlight link pseudoConditionals Conditional
highlight link pseudoRepeat       Repeat
highlight link pseudoRepeats      Repeat

highlight link pseudoLogicalNot Conceal
highlight link pseudoLogicalAnd Conceal
highlight link pseudoLogicalOr  Conceal

