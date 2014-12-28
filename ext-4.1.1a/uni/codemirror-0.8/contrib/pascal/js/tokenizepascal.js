/* Tokenizer for pascal code */

var tokenizepascal = (function() {
  // Advance the stream until the given character (not preceded by a
  // backslash) is encountered, or the end of the line is reached.
  function nextUntilUnescaped(source, end) {
    var escaped = false;
    var next;
    while (!source.endOfLine()) {
      var next = source.next();
      if (next == end && !escaped)
        return false;
      escaped = !escaped && next == "\\";
    }
    return escaped;
  }

  // A map of JavaScript's keywords. The a/b/c keyword distinction is
  // very rough, but it gives the parser enough information to parse
  // correct code correctly (we don't care that much how we parse
  // incorrect code). The style information included in these objects
  // is used by the highlighter to pick the correct CSS style for a
  // token.
  var keywords = function(){
    function result(type, style){
      return {type: type, style: "pascal-" + style};
    }
    // keywords that take a parenthised expression, and then a
    // statement (if)
    var keywordA = result("keyword a", "keyword");
    // keywords that take just a statement (else)
    var keywordB = result("keyword b", "keyword");
    // keywords that optionally take an expression, and form a
    // statement (return)
    var keywordC = result("keyword c", "keyword");
    var operator = result("operator", "keyword");
    var atom = result("atom", "atom");
    // just a keyword with no indentation implications
    var keywordD = result("keyword d", "keyword"); 
    
    return {
      "if": keywordA, "while": keywordA, "with": keywordA, "then": keywordB,
      "else": keywordB, "do": keywordB, "try": keywordB, "except": keywordB, "finally": keywordB,
      "return": keywordC, "break": keywordC, "continue": keywordC, "new": keywordC, "delete": keywordC, "throw": keywordC,
      "in": operator, "typeof": operator, "instanceof": operator, "on": operator, 
      "var": result("var", "keyword"), "procedure": result("function", "keyword"), 
			"function": result("function", "keyword"), "catch": result("catch", "keyword"),
      "for": result("for", "keyword"),  "case": result("case", "keyword"), "default": result("default", "keyword"), 
			"of": keywordD, "true": atom, "false": atom, "null": atom,
      
      "constructor": keywordD, "destructor": keywordD, "published": keywordD, "inherited": keywordD,
      "class": result("class", "keyword"), "namespace": result("class", "keyword"),
      "type": keywordD, "uses": keywordD, "begin": keywordD, "end": keywordD, "implementation": keywordD,
      "unit": keywordD, "interface": keywordD, "initialization": keywordD, "finalization": keywordD, "implementation": keywordD,
      "reintroduce": keywordD, "public": keywordD, "private": keywordD, "protected": keywordD, "internal": keywordD,
      "property": keywordD, "read": keywordD, "write": keywordD,
      "extern": keywordD, "override": keywordD, "virtual": keywordD, "abstract": keywordD, 
      "static": keywordD, "out": keywordD, "ref": keywordD, "const": keywordD,
      
      "foreach": result("for", "keyword"), "using": keywordC,
      
      "integer": keywordD, "double": keywordD, "longint": keywordD, "boolean": keywordD, "char": keywordD, 
      "void": keywordD, "string": keywordD, "byte": keywordD, "sbyte": keywordD, "decimal": keywordD,
      "float": keywordD, "uint": keywordD, "ulong": keywordD, "object": keywordD,
      "short": keywordD, "ushort": keywordD,
      
      "get": keywordD, "set": keywordD, "value": keywordD      
    };
  }();

  // Some helper regexps
  var isOperatorChar = /[+\-*&%=<>!?|]/;
  var isHexDigit = /[0-9A-Fa-f]/;
  var isWordChar = /[\w\$_]/;

  // Wrapper around jsToken that helps maintain parser state (whether
  // we are inside of a multi-line comment and whether the next token
  // could be a regular expression).
  function jsTokenState(inside, regexp) {
    return function(source, setState) {
      var newInside = inside;
      var type = jsToken(inside, regexp, source, function(c) {newInside = c;});
      var newRegexp = type.type == "operator" || type.type == "keyword c" || type.type.match(/^[\[{}\(,;:]$/);
      if (newRegexp != regexp || newInside != inside)
        setState(jsTokenState(newInside, newRegexp));
      return type;
    };
  }

  // The token reader, inteded to be used by the tokenizer from
  // tokenize.js (through jsTokenState). Advances the source stream
  // over a token, and returns an object containing the type and style
  // of that token.
  function jsToken(inside, regexp, source, setInside) {
    function readHexNumber(){
//      source.next(); // skip the 'x'
      source.nextWhileMatches(isHexDigit);
      return {type: "number", style: "pascal-atom"};
    }

    function readNumber() {
      source.nextWhileMatches(/[0-9]/);
      if (source.equals(".")){
        source.next();
        source.nextWhileMatches(/[0-9]/);
      }
      if (source.equals("e") || source.equals("E")){
        source.next();
        if (source.equals("-"))
          source.next();
        source.nextWhileMatches(/[0-9]/);
      }
      return {type: "number", style: "pascal-atom"};
    }
    // Read a word, look it up in keywords. If not found, it is a
    // variable, otherwise it is a keyword of the type found.
    function readWord() {
      source.nextWhileMatches(isWordChar);
      var word = source.get();
      var known = keywords.hasOwnProperty(word) && keywords.propertyIsEnumerable(word) && keywords[word];
      return known ? {type: known.type, style: known.style, content: word} :
      {type: "variable", style: "pascal-variable", content: word};
    }
    function readRegexp() {
      nextUntilUnescaped(source, "/");
      source.nextWhileMatches(/[gi]/);
      return {type: "regexp", style: "pascal-string"};
    }
    // Mutli-line comments are tricky. We want to return the newlines
    // embedded in them as regular newline tokens, and then continue
    // returning a comment token for every line of the comment. So
    // some state has to be saved (inside) to indicate whether we are
    // inside a /* */ sequence.
    function readMultilineComment(start, inside){
      var newInside = null;
			if (start == "{" || inside == "{") {
				if (start != "}") {
					newInside = "{";
		      while (true) {
		        if (source.endOfLine())
		          break;
		          
		        var next = source.next();
		        if (next == "}"){
		          newInside = null;
		          break;
		        }
		    	}
	    	}
			} else {
				newInside = "(*";
	      var maybeEnd = (start == "*");
	      while (true) {
	        if (source.endOfLine())
	          break;
	        var next = source.next();
	        if (next == ")" && maybeEnd){
	          newInside = null;
	          break;
	        }
	        maybeEnd = (next == "*");
	      }
      }
      setInside(newInside);
      return {type: "comment", style: "pascal-comment"};
    }
    
    function readOperator() {
      source.nextWhileMatches(isOperatorChar);
      return {type: "operator", style: "pascal-operator"};
    }
    function readString(quote) {
      var endBackSlash = nextUntilUnescaped(source, quote);
      setInside(endBackSlash ? quote : null);
      return {type: "string", style: "pascal-string"};
    }

    // Fetch the next token. Dispatches on first character in the
    // stream, or first two characters when the first is a slash.
    if (inside == "'") return readString(inside);
    
    var ch = source.next();
    if (inside == "(*" || inside =="{")
      return readMultilineComment(ch, inside);
    else if (ch == "'")
      return readString(ch);
    else if (ch == "{") 
			return readMultilineComment(ch, inside); 
    else if (ch == "(" && source.equals("*")){ 
			source.next(); 
			return readMultilineComment(ch, inside); 
		}
    else if (ch == ":" && source.equals("="))
      return {type: "operator", style: "pascal-operator"};
    // with punctuation, the type of the token is the symbol itself
    else if (/[\[\]\(\),;\:\.]/.test(ch))
      return {type: ch, style: "pascal-punctuation"};
    else if (ch == "$") // && (source.equals("x") || source.equals("X")))
      return readHexNumber();
    else if (/[0-9]/.test(ch))
      return readNumber();
    else if (ch == "/"){
      if (source.equals("/"))
      { nextUntilUnescaped(source, null); return {type: "comment", style: "pascal-comment"};}
      else if (regexp)
        return readRegexp();
      else
        return readOperator();
    }
    else if (ch == "#") {  // treat c# regions like comments
        nextUntilUnescaped(source, null); return {type: "comment", style: "pascal-comment"};
    }
    else if (isOperatorChar.test(ch))
      return readOperator();
    else
      return readWord();
  }

  // The external interface to the tokenizer.
  return function(source, startState) {
    return tokenizer(source, startState || jsTokenState(false, true));
  };
})();
