angular.module("mainModule", [])

.controller("mainController", function ($scope, $http) {
  $scope.localForm = {};

  $scope.localForm.city_description = "";

  $scope.localForm.quote = "";

  $scope.localForm.student = "not available";

  $scope.localForm.findahome = "not available";

  $scope.localForm.submitTheForm=function(item,event)

    {console.log("--> Submitting form");

    var dataObject={

    city_description:$scope.localForm.city_description,

    quote:$scope.localForm.quote,

    student:$scope.localForm.student ,

    findahome:$scope.localForm.findahome};

    var responsePromise=$http.post("registerlocal_controller.jsp",dataObject,{});

    responsePromise.success(function(data,status,headers,config)

    {


    var myjson=JSON.parse(data);
    $scope.questions=JSON.parse(myjson);});

    responsePromise.error(function(data,status,headers,config){alert(data);

    alert("Submitting form failed!");});

  }});
