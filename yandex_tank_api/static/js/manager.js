(function() {
  var app;

  app = angular.module("ng-tank-manager", ['ui.ace', 'ui.bootstrap']);

  app.constant("TEST_STAGES", ['lock', 'init', 'configure', 'prepare', 'start', 'poll', 'end', 'postprocess', 'unlock', 'finish']);

  app.constant("_", window._);

  app.controller("TankManager", function($scope, $interval, $http, TEST_STAGES, _) {
    var updateStatus;
    $scope.max_progress = TEST_STAGES.length;
    updateStatus = function() {
      return $http.get("status").success(function(data) {
        $scope.status = data;
        if ($scope.currentSession != null) {
          $scope.sessionStatus = data[$scope.currentSession].current_stage;
          return $scope.progress = _.indexOf(TEST_STAGES, $scope.sessionStatus);
        }
      });
    };
    $scope.runTest = function() {
      return $http.post("run", $scope.tankConfig).success(function(data) {
        $scope.reply = data;
        $scope.currentTest = data.test;
        return $scope.currentSession = data.session;
      });
    };
    $scope.stopTest = function() {
      return $http.get("stop?session=" + $scope.currentSession).success(function(data) {
        return $scope.reply = data;
      });
    };
    return $interval(updateStatus, 1000);
  });

}).call(this);
