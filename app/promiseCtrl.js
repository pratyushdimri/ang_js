app.controller('promiseCtrl', function ($scope, $q, Data, $timeout) {
	$scope.result = "init data";
	
	/*
	*This function use $q service to return promise object.
	*but on call back function,it will only run if we trigger resolve,reject or notify functions.
	*/
	var getProductList = function() {
		var defer = $q.defer();
		
		$timeout(function(){
			Data.get('product').then(
				function(data){ 
					defer.resolve(data.data);
				},function(err){
					defer.reject(err);  //call any undefined api to check the error callback function
				});			
			},5000);
		
		$timeout(function(){
			defer.notify('About to get result');
		},1000);		
			
		return defer.promise;
	}	
	
	var PromiseCheckFunction = getProductList();//at this point it returns the defer.promise object. But 3 then callbacks functions(success,error & notify) only runs if we trigger defer.resolve,reject and notify respectively.
	
	PromiseCheckFunction.then(
	function(succesRes){
		$scope.result = succesRes;
	},function(errRes){
		$scope.result = errRes;
	},function(notifyRes){
		$scope.result = notifyRes;
	});
});