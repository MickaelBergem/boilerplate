angular.module 'boilerplate.landing'
.config ($stateProvider) ->
  $stateProvider
  .state 'landing',
    url: '/'
    templateUrl: 'landing/views/view.html'

  [
    'one'
    'two'
    'three'
  ].forEach (state) ->
    $stateProvider
    .state state,
      url: "/#{state}"
      templateUrl: "landing/views/#{state}.html"
