app.controller('productCtrl', function ($scope, $modal,$filter,Data, $timeout, $q) {
   $scope.product = {};
    
    /* For without paging remove this comment and use products_withoutpaging.html in partial folder
    Data.get('product').then(function(data){
        $scope.products = data.data;        
    });
    */
    
    /**
     * For Pagination and sorting
     ***************************************************************************/
	Data.get('product').then(function(data){
        $scope.products = data.data;        
        $scope.currentPage = 1; //current page
        $scope.entryLimit = 5; //max no of items to display in a page
        $scope.filteredItems = $scope.products.length; //Initially for no filter
        $scope.totalItems = $scope.products.length;        
    });
	
    $scope.setPage = function(pageNo) {
        $scope.currentPage = pageNo;
    };
    
    $scope.filter = function() {
        $timeout(function() {
        $scope.filteredItems = $scope.filtered.length;
        }, 10);
    };
    
    $scope.sort_by = function(predicate) {
        $scope.predicate = predicate;
        $scope.reverse = !$scope.reverse;
    };
    /***************************************************************************/
      
  $scope.changeProductStatus = function(product){
        product.status = (product.status=="Active" ? "Inactive" : "Active");
        Data.put("product/"+product.id,{status:product.status});
    };
    $scope.deleteProduct = function(product){
        if(confirm("Are you sure to remove the product")){
            Data.delete("product/"+product.id).then(function(result){
                $scope.products = _.without($scope.products, _.findWhere($scope.products, {id:product.id}));
            });
        }
    };
    
    $scope.open = function (p,size) {
        var modalInstance = $modal.open({
          templateUrl: 'partials/productEdit.html',
          controller: 'productEditCtrl',
          size: size,
          resolve: { item: function () {return p;} }
        });
       
        modalInstance.result.then(function(selectedObject) { //while .close(x) called
            //console.log("3")
            
            if(selectedObject.save == "update"){              
                p.description = selectedObject.description;
                p.price = selectedObject.price;
                p.stock = selectedObject.stock;
                p.packing = selectedObject.packing;
            }else{ //insert
                $scope.products.push(selectedObject);
                $scope.products = $filter('orderBy')($scope.products, 'id', 'reverse');
            }
        });
    };
    
 $scope.columns = [
                    {text:"ID",predicate:"id",sortable:true,dataType:"number"},
                    {text:"Name",predicate:"name",sortable:true},
                    {text:"Price",predicate:"price",sortable:true},
                    {text:"Stock",predicate:"stock",sortable:true},
                    {text:"Packing",predicate:"packing",reverse:true,sortable:true,dataType:"number"},
                    {text:"Description",predicate:"description",sortable:true},
                    {text:"Status",predicate:"status",sortable:true},
                    {text:"Action",predicate:"",sortable:false}
                ];

});

app.controller('productEditCtrl', function ($scope, $modalInstance, item, Data) {
        var allowedImageType = ["image/jpeg", "image/jpg", "image/png"];
        $scope.fileTypeValidation = false;
        $scope.product = angular.copy(item);
        
        $scope.cancel = function () {
            $modalInstance.dismiss('Close');
        };
        $scope.title = (item.id > 0) ? 'Edit Product' : 'Add Product';
        $scope.buttonText = (item.id > 0) ? 'Update Product' : 'Add New Product';

        var original = item;
        $scope.isClean = function() {
            return angular.equals(original, $scope.product);
        }
                
        $scope.saveProduct = function (product) {            
            
        if(allowedImageType.indexOf(product.image.type) == -1){            
            $scope.fileTypeValidation = true;            
            return false;
        }

            if(product.id > 0){
                Data.put('product/'+product.id, product).then(function (result) {
                    if(result.status != 'error'){
                        var x = angular.copy(product);
                        x.save = 'update';
                        $modalInstance.close(x);
                        
                    }else{
                        console.log(result);
                    }
                });
            }else{
                product.status = 'Active';                
                /**
                 * We have used 'multipartPost' instead of 'post' factory to get the multipart form data and send it to server.
                 * As the date received at server file is in different form so we have made another function product2 for it.
                 */
                Data.multipartPost('product2', product).then(function (result) {
                    if(result.status != 'error'){
                        var x = angular.copy(product);
                        //x.save = 'insert';
                        x.id = result.data;
                        $modalInstance.close(x);                                                 
                    }else{
                        console.log(result);
                    }
                });
            }
        };
});
