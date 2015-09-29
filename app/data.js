app.factory("Data", ['$http', 'toaster',
    function ($http, toaster) { // This service connects to our REST API

        var serviceBase = 'api/v1/';

        var obj = {};//Object of factory class
        obj.toast = function (data) {
            toaster.pop(data.status, "", data.message, 10000, 'trustedHtml', {
                closeButton: true
            });
        }
        obj.get = function (q) {
            
            return $http.get(serviceBase + q).then(function (results) {
                return results.data;
            });
        };
        obj.post = function (q, object) {
            return $http.post(serviceBase + q, object).then(function (results) {
                return results.data;
            });
        };
        obj.multipartPost = function (q, object) {
            
            /**
             * To get the multipart form data, run the loop of all the form input.
             * In file-model directives you will get the file source. 
             * angular.identity is used to stop the searlization of form data
             * Content-Type undefined will tell browser to automatically set the header and boundary limit.
             */
            
            var fd = new FormData();
            for(var key in object){
                fd.append(key, object[key]);
            }           
            
            /**
             *  If the multiple file are coming
             */
            
//            for(var key2 in object['image']){
//                fd.append('image[]', object['image'][key2]);
//            }
            
            return $http.post(serviceBase + q, fd, {
                transformRequest: angular.identity,
                headers: {'Content-Type': undefined}
            }).then(function (results) {
                return results.data;
            });
        };
        obj.put = function (q, object) {
            return $http.put(serviceBase + q, object).then(function (results) {
                return results.data;
            });
        };
        obj.delete = function (q) {
            return $http.delete(serviceBase + q).then(function (results) {
                return results.data;
            });
        };

        return obj;
}]);