@RaffleCtrl = ($scope) ->
    $scope.entries = [
        {name: "Leonam"}
        {name: "Rosana"}
        {name: "Gabriel"}
    ]
    
    $scope.addEntry = ->
        $scope.entries.push($scope.newEntry)
        $scope.newEntry =  {}
        