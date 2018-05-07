angular.module("mainModule", [])

.controller("mainController", function ($scope, $http) {
  $scope.myForm = {};

  $scope.myForm.message = "";

  $scope.myForm.traveller = "";

  $scope.myForm.local = "";


  $scope.myForm.submitTheForm=function(item,event)

    {console.log("--> Submitting form");

    var dataObject={

    mes:$scope.myForm.city_description,

    traveller_id:$scope.myForm.traveller,

    localbuddy_id:$scope.myForm.local};


    var responsePromise=$http.post("communication_controller.jsp",dataObject,{});

    responsePromise.success(function(data,status,headers,config)

    {


    var myjson=JSON.parse(data);
    $scope.questions=JSON.parse(myjson);});

    responsePromise.error(function(data,status,headers,config){alert(data);

    alert("Submitting form failed!");});

  }});
