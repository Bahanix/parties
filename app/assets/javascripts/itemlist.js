(function($){
    //$.Itemlist = function(el, $el, options){
    function Itemlist(el, options){
        // To avoid scope issues, use 'base' instead of 'this'
        // to reference this class from internal events and functions.
        var base = this;
        
        // Access to jQuery and DOM versions of element
        base.el = el;
        base.$el = $(el);
        
        // Add a reverse reference to the DOM object
        base.$el.data("Itemlist", base);

        base.afterInsertHook = function(){
            if(!base.batchMode){
              var $newField = base.$el.find('.nested-fields').last().find('.controls input');

              $newField.typeahead({
                name: 'suggestions',
                prefetch: 'suggestions.json',
                template: [
                  '<p class="repo-language">{{type}}</p>',
                  '<p class="repo-name">{{value}}</p>',
                  '<p class="repo-description">{{desc}}</p>'
                ].join(''),
                engine: Hogan
              });

              $newField.focus();
            }
        }

        // Internal vars
        base.batchMode = false;
        
        // Sample Function, Uncomment to use
        // base.functionName = function(paramaters){
        // 
        // };
        
        // Run initializer
        base.init(options);
    };

    Itemlist.prototype = {
        init: function(options){
            var base = this;
            base.options = $.extend({},Itemlist.defaultOptions, options);

            base.$el.bind('cocoon:after-insert', base.afterInsertHook);
        },
        removeItems: function(){
            var base = this;
            base.batchMode = true;

            // remove fields
            base.$el.find('.nested-fields a.remove_fields.dynamic').click();

            base.batchMode = false;
        },
        addItems: function(itemList){
            var base = this;
            base.batchMode = true;

            // set fields
            var $addLink = base.$el.find('.add_fields');
            for(var i in itemList){
              var item = itemList[i];
              $addLink.click();
              base.$el.find('.nested-fields').last().find('.controls input').val(item);
            }

            base.batchMode = false;
        }
    };
    
    Itemlist.defaultOptions = {
    };
    
    $.fn.itemlist = function(options, datas){
        return this.each(function(){
            var elt = this;
            var data = elt.obj;

            if(!data){
                elt.obj = new Itemlist(this, options);
            } else {
                if(options && typeof options === 'string'){
                    if(options === 'set-items' && Object.prototype.toString.call(datas) === '[object Array]'){
                        data.removeItems();
                        data.addItems(datas);
                    } else if(options === 'add-items' && Object.prototype.toString.call(datas) === '[object Array]'){
                        data.addItems(datas);
                    } else {
                        
                    }
                } else {
                    
                }
            }
        });
    };
})(jQuery);