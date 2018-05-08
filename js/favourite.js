var myApp = angular.module('fav', [])
  .controller('Main', ['$scope', function($scope) {
    $scope.like = {};
    $scope.like.votes = 0;
    $scope.doVote = function() {
      if ($scope.like.userVotes == 1) {
        delete $scope.like.userVotes;
        $scope.like.votes--;
      } else {
        $scope.like.userVotes = 1;
        $scope.like.votes++;
      }
    }
  }]);

