@RaffleCtrl = ($scope, Entry) ->
    $scope.entries = Entry.query()
    
    $scope.addEntry = ->
        entry = Entry.save($scope.newEntry)
        $scope.entries.push(entry)
        $scope.newEntry =  {}
        
    $scope.drawWinner= ->
        pool = []
        angular.forEach $scope.entries, (entry) ->
            pool.push(entry) if !entry.winner
        if pool.length > 0 
            entry = pool[Math.floor(Math.random()*pool.length)]
            entry.winner = true
            entry.$update()
            $scope.lastWinner = entry
        
# Angular injects based on param name. In production, param names may be differents thanks to minification
# To solve this problem:
# 1: All javascript funcions should be in a array
# 2: Configure Uglifier to not minifi the names
 
# Examples:

# 1:
#@RaffleCtrl = ["$scope","Entry", ($scope, Entry) ->
#    $scope.entries = Entry.query()
#    
#    $scope.addEntry = ->
#        entry = Entry.save($scope.newEntry)
#        $scope.entries.push(entry)
#        $scope.newEntry =  {}
#        
#    $scope.drawWinner= ->
#        pool = []
#        angular.forEach $scope.entries, (entry) ->
#            pool.push(entry) if !entry.winner
#        if pool.length > 0 
#            entry = pool[Math.floor(Math.random()*pool.length)]
#            entry.winner = true
#            entry.$update()
#            $scope.lastWinner = entry
#]            

# 2: on production environment file:
#
# assets.js_compressor = Sprockets::LazyCompressor.new { Uglifier.new(mangle: flase) }
#
