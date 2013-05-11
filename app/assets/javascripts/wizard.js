(function($){
    $.Wizard = function(el, options){
        // To avoid scope issues, use 'base' instead of 'this'
        // to reference this class from internal events and functions.
        var base = this;
        
        // Access to jQuery and DOM versions of element
        base.$el = $(el);
        base.el = el;
        
        // Add a reverse reference to the DOM object
        base.$el.data("Wizard", base);

        function getStepIndexFromId(id){
            // id must be : step1, step2...
            return parseInt(id.substring(4));
        }

        function getStepIndexFromHash(id){
            // id must be : #step1, #step2...
            return parseInt(id.substring(5));
        }

        function getIdFromStepIndex(stepIndex){
            return "step"+stepIndex;
        }

        function getCurrentState(wizard){
            var activePane = wizard.find('.step-content .step-pane.active');
            if(activePane && activePane.length == 1){
                return getStepIndexFromId(activePane.attr('id'));
            } else {
                return 0;
            }
        }

        function setState(step){
            if(step <= base.currentStep+1){
                // reset classes
                var $steps = base.$el.find('.header .steps li[data-target]');
                var $panes = base.$el.find('.step-content .step-pane');
                $steps.removeClass('active').removeClass('complete');
                $panes.removeClass('active').removeClass('complete');
                $steps.find('span.badge').removeClass('badge-info').removeClass('badge-success');

                // set classes for completed steps
                var $prevSteps = base.$el.find('.header .steps li[data-target]:lt(' + (step - 1) + ')');
                var $prevPanes = base.$el.find('.step-content .step-pane:lt(' + (step - 1) + ')');
                $prevSteps.addClass('complete');
                $prevPanes.addClass('complete');
                $prevSteps.find('span.badge').addClass('badge-success');

                // set classes for current step
                var $prevSteps = base.$el.find('.header .steps li[data-target]:eq(' + (step - 1) + ')');
                var $prevPanes = base.$el.find('.step-content .step-pane:eq(' + (step - 1) + ')');
                $prevSteps.addClass('active');
                $prevPanes.addClass('active');
                $prevSteps.find('span.badge').addClass('badge-info');
                base.currentStep = step;
            }
        }

        // Internal vars
        base.currentStep = getCurrentState(base.$el);
        
        base.init = function(){
            base.options = $.extend({},$.Wizard.defaultOptions, options);

            setState(base.currentStep);
            
            // Put your initialization code here
            base.$el.on('click', '[data-target]', function(){
                setState(getStepIndexFromHash($(this).attr('data-target')));
                return false;
            });
        };
        
        // Sample Function, Uncomment to use
        // base.functionName = function(paramaters){
        // 
        // };
        
        // Run initializer
        base.init();
    };
    
    $.Wizard.defaultOptions = {
    };
    
    $.fn.wizard = function(options){
        return this.each(function(){
            (new $.Wizard(this, options));
        });
    };
})(jQuery);