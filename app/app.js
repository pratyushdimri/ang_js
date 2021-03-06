var app = angular.module('myApp', ['ngRoute', 'ngAnimate', 'toaster','ui.bootstrap']);

app.config(['$routeProvider',
  function ($routeProvider) {
        $routeProvider.
        when('/login', {
            title: 'Login',
            templateUrl: 'partials/login.html',
            controller: 'authCtrl'
        })
        .when('/logout', {
            title: 'Logout123',
            templateUrl: 'partials/login.html',
            controller: 'logoutCtrl'
        })
        .when('/signup', {
            title: 'Signup',
            templateUrl: 'partials/signup.html',
            controller: 'authCtrl'
        })
        .when('/dashboard', {
            title: 'Dashboard',
            templateUrl: 'partials/dashboard.html',
            controller: 'authCtrl'
        })
		.when('/promise', {
            title: 'Promise Test',
            templateUrl: 'partials/promise.html',
            controller: 'promiseCtrl'
        })
        .when('/', {
            title: 'Login',
            templateUrl: 'partials/login.html',
            controller: 'authCtrl',
            role: '0'
        })
        .when('/product', {
            title: 'Products',
            templateUrl: 'partials/products.html',
            controller: 'productCtrl'
        })
        .otherwise({
            redirectTo: '/login'
        });
  }])
      .run(function ($rootScope, $location, Data) {
        $rootScope.$on("$routeChangeStart", function (event, next, current) {
            $rootScope.authenticated = false;
             var nextUrl = next.$$route.originalPath;
             
                Data.get('session').then(function (results) {
                    
                if (results.uid) { //
                    $rootScope.authenticated = true;
                    $rootScope.uid = results.uid;
                    $rootScope.name = results.name;
                    $rootScope.email = results.email;
                    if( nextUrl == '/login' || nextUrl == '/' ){
                     $location.path("/dashboard");   
                    }
                }else {
                    //var nextUrl = next.$$route.originalPath;
                    if (nextUrl != '/signup' && nextUrl != '/login') {
                         $location.path("/login");
                    }
                }
            });
        });
    });