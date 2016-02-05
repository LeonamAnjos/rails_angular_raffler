angular.module("Raffler", ["ngResource"])
angular.module("Raffler").controller("RaffleCtrl", @RaffleCtrl)    

angular.module("Raffler").factory "Entry", ($resource) ->
    $resource("/entries/:id", {id: "@id"}, {update: {method: "PUT"}})