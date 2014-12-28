//Ext.namespace('Ext.ux.form');

Ext.define('Ext.ux.form.CodeMirror', {
  	extend: 'Ext.form.TextArea',
  	xtype: 'ux-codemirror',
    language: 'txt',
    codeMirrorHidden: false,
    codeMirrorPath: null, // should be path to code mirror on your server!
    initCallBackFn: null,
    resizeCallBackFn: null,
    initComponent: function() {
        if (this.codeMirrorPath === null) {
            throw 'Ext.ux.form.CodeMirror: codeMirrorPath required';
        }
        this.initialized = false;
        Ext.ux.form.CodeMirror.superclass.initComponent.apply(this, arguments);
        this.addEvents('initialize');
        this.on({
        		move : function(ta, x, y) {
        			var el=document.getElementById("CodeMirror-wrapping-"+this.id);
        			if (el) {
        				if (x!=undefined)	el.style.left=x+"px";
    						if (y!=undefined)	el.style.top=y+"px"; 
							}
        		},
            resize: function(ta, width, height) {
                if (this.resizeCallBackFn)
                    this.resizeCallBackFn(this);
                else {
			        			var el=document.getElementById("CodeMirror-wrapping-"+this.id);
			        			if (el) {
			        				if (width!=undefined)	{
												var ewidth=width;
		                    var lineNumbersEl = document.getElementById("CodeMirror-line-numbers-"+this.id);
		                    if (lineNumbersEl) {
		                    	var w=lineNumbersEl.style.width;
		                    	if (typeof(w) == 'string') w=w.replace("px", "");
		                    	ewidth=ewidth-w;
		                    }
												el.style.width=ewidth+"px";
	                    }
	                    
			    						if (height!=undefined) el.style.height=height+"px"; 
										}
                }
            },
            afterrender: function() {
                var parser, stylesheet;
                switch (this.language.toLowerCase()) {
                    case 'json':
                        parser = ['tokenizejson.js', 'parsejson.js'];
                        stylesheet = this.codeMirrorPath+'/css/jsoncolors.css';
                        break;
                    case 'css':
                        parser = 'parsecss.js';
                        stylesheet = this.codeMirrorPath+'/css/csscolors.css';
                        break;
                    case 'js':
                        parser = ['tokenizejavascript.js', 'parsejavascript.js'];
                        stylesheet = this.codeMirrorPath+'/css/jscolors.css';
                        break;
                    case 'php':
                        parser = [
                        "parsexml.js",
                        "parsecss.js",
                        "tokenizejavascript.js",
                        "parsejavascript.js",
                        "../contrib/php/js/tokenizephp.js",
                        "../contrib/php/js/parsephp.js",
                        "../contrib/php/js/parsephphtmlmixed.js"
                        ];
                        stylesheet = [
                        this.codeMirrorPath+'/css/xmlcolors.css',
                        this.codeMirrorPath+'/css/jscolors.css',
                        this.codeMirrorPath+'/css/csscolors.css',
                        this.codeMirrorPath+'/contrib/php/css/phpcolors.css'
                        ];
                        break;
                    case 'sql':
                        parser = '../contrib/sql/js/parsesql.js';
                        stylesheet = this.codeMirrorPath+'/contrib/sql/css/sqlcolors.css';
                    		break;
                    case 'htm':
                    case 'html':
                        parser = [
                        "parsexml.js",
                        "parsecss.js",
                        "tokenizejavascript.js",
                        "parsejavascript.js",
                    		"parsehtmlmixed.js"
												];
                        stylesheet = [
                        this.codeMirrorPath+'/css/xmlcolors.css',
                        this.codeMirrorPath+'/css/jscolors.css',
                        this.codeMirrorPath+'/css/csscolors.css',
                        this.codeMirrorPath+'/contrib/php/css/phpcolors.css'
                        ];
												break;                    		
                    case 'xml':
                        parser = 'parsexml.js';
                        stylesheet = this.codeMirrorPath+'/css/xmlcolors.css';
                        break;
                    case 'python':
                        parser = ["../contrib/python/js/parsepython.js"];
                        stylesheet = this.codeMirrorPath+'/contrib/python/css/pythoncolors.css';
                    		break;
                    case 'pas':
                        parser = ["../contrib/pascal/js/tokenizepascal.js", "../contrib/pascal/js/parsepascal.js"];
                        stylesheet = this.codeMirrorPath+'/contrib/pascal/css/pascalcolors.css';
                        break;
                    case 'cs':
                        parser = ["../contrib/csharp/js/tokenizecsharp.js", "../contrib/csharp/js/parsecsharp.js"];
                        stylesheet = this.codeMirrorPath+'/contrib/csharp/css/csharpcolors.css';
                        break;
                    default:
                        parser = 'parsedummy.js';
                        stylesheet = '';
                        break;

                }
                var me = this;
                Ext.defer(function() {
                    me.codeEditor = new CodeMirror.fromTextArea(me.id, {
                    		id: me.id,
                    		x: me.x,
                    		y: me.y,
                    		width: me.width,
                    		gwidth: 40,
                        parserfile: parser,
                        stylesheet: stylesheet,
                        path: me.codeMirrorPath+'/js/',
                        textWrapping: false,
                        readOnly: me.readOnly,
                        autoMatchParens: true,
                        lineNumbers: true,
                        //continuousScanning: true,
                        passDelay: 100,
                        passTime: 50,
                        lineNumberDelay: 1000,
                        lineNumberTime: 50,
                        iframeClass: 'codemirror-iframe-'+me.id,
                        content: me.value,
                        parserConfig: {
                            json: true
                        },
                        lang: me.language.toLowerCase(),
                        initCallback: function() {
                            me.initialized = true;
                            me.fireEvent('initialize', true);

                            if (me.initCallBackFn != null)
                                me.initCallBackFn(me);
                        }
                    });
                }, 100);
            }
        });
    },
    getValue: function() {
        if (this.initialized) {
            if ( this.codeMirrorHidden )
                return this.getTextareaValue();
            else
                return this.codeEditor.getCode();
        }
        return this.value;
    },
    setValue: function(v) {
        if (this.initialized) {
            if (this.codeMirrorHidden)
                this.setTextareaValue(v)
            else
                this.codeEditor.setCode(v);
        }
    },
    getTextareaValue : function(){
        if(!this.rendered) {
            return this.value;
        }
        var v = this.el.getValue();
        if(v === this.emptyText || v === undefined){
            v = '';
        }
        return v;
    },
    setTextareaValue : function(v){
        if(this.emptyText && this.el && !Ext.isEmpty(v)){
            this.el.removeClass(this.emptyClass);
        }
        Ext.form.TextField.superclass.setValue.apply(this, arguments);
        this.applyEmptyText();
        this.autoSize();
        return this;
    },
    hideCodeMirror: function () {
        var me = this;
        var iframeEl = Ext.select('.'+this.id, true);
        var textareaEl = Ext.select("textarea#" + me.id, true);
               
        textareaEl.setVisibilityMode(Ext.Element.DISPLAY);
        iframeEl.setVisibilityMode(Ext.Element.DISPLAY);

        me.setTextareaValue( me.getValue() );

        iframeEl.setVisible(false);
        textareaEl.setVisible(true);

        me.codeMirrorHidden = true;
    },
    showCodeMirror: function () {
        var me = this;
        var iframeEl = Ext.get(Ext.query(".CodeMirror-wrapping"));
        var textareaEl = Ext.get(Ext.query("textarea#JsonStringForm_jsonString"));

        textareaEl.setVisibilityMode(Ext.Element.DISPLAY);
        iframeEl.setVisibilityMode(Ext.Element.DISPLAY);        

        textareaEl.setVisible(false);
        iframeEl.setVisible(true);

        me.codeMirrorHidden = false;

        me.setValue( this.getTextareaValue() );
        me.setTextareaValue( '' );
    },
    validate: function() {
        this.getValue();
        Ext.ux.form.CodeMirror.superclass.validate.apply(this, arguments);
    }
});
//Ext.reg('ux-codemirror', Ext.ux.form.CodeMirror);

// JavaScript Document
