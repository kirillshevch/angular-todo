app = angular.module 'todoApp',
  ['ngRoute',
   'templates',
   'Devise',
   'ngCookies',
   'ngResource',
   'ui.date',
   'ui.sortable',
   'angularFileUpload',
   'ngToast'
  ]

app.config ["ngToastProvider", (ngToastProvider) ->
  ngToastProvider.configure verticalPosition: 'bottom'
]