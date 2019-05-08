app.directive('focus', function() {
    return function(scope, element) {
        element[0].focus();
    }      
});

app.directive('passwordMatch', [function () {
    return {
        restrict: 'A',
        scope:true,
        require: 'ngModel',
        link: function (scope, elem , attrs,control) {
            var checker = function () {
 
                //get the value of the first password
                var e1 = scope.$eval(attrs.ngModel); 
 
                //get the value of the other password  
                var e2 = scope.$eval(attrs.passwordMatch);
                if(e2!=null)
                return e1 == e2;
            };
            scope.$watch(checker, function (n) {
 
                //set the form control to valid if both 
                //passwords are the same, else invalid
                control.$setValidity("passwordNoMatch", n);
            });
        }
    };
}]);

app.directive('fileModel', ['$parse', function ($parse) {
    return {
        restrict: 'A',
		require: 'ngModel',
        link: function(scope, element, attrs, ngModalCtrl) {            
            var model = $parse(attrs.fileModel);            
            var modelSetter = model.assign;            
            ngModalCtrl.$setValidity('fileRequired',element.val() != '');
            /**
             * Remove 0 key and pass element[0].files to send multiple files and append form data in foreach loop in factory
             */
            element.bind('change', function(){
				ngModalCtrl.$setValidity('fileRequired',element.val() != '');                
                scope.$apply(function(){
                    modelSetter(scope, element[0].files[0]);
					console.log(element);
					ngModalCtrl.$render;
                });
            });
        }
    };
}]);
