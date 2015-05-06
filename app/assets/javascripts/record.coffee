# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


$ ->
  $(".table-sorter").tablesorter({usNumberFormat : true})

mh_app = angular.module('mh_app', [])
mh_app.controller("MainController", ['$scope', '$compile',
  ($scope, $compile) ->
    date = new Date()
    $scope.option = years: [2010..(1900 + date.getYear())], month: [1..12], quaters: [1..4].map((e) -> e + "분기"), days: [1..31]
    $scope.search_period = "monthly"
    $scope.year = 2015
    $scope.month = 5
    $scope.quater = '1분기'

    $scope.search_period_updated = () ->
      $("#search-selection").empty();
      $("#search-selection").append($compile("<year-select></year-select>")($scope)[0])

      if $scope.search_period == 'monthly'
        $("#search-selection").append($compile("<month-select></month-select>")($scope)[0])
      else if $scope.search_period == 'daily'
        date = new Date($scope.year, $scope.month, 0)
        $scope.option.days = [1..(date.getDate())]
        $("#search-selection").append($compile("<month-select></month-select>")($scope)[0])
        $("#search-selection").append($compile("<day-select></day-select>")($scope)[0])
      else if $scope.search_period == 'quater'
        $("#search-selection").append($compile("<quater-select></quater-select>")($scope)[0])

      return
#      angular.element("<>")
    $scope.search_period_updated()
])
.directive("yearSelect", -> {restrict: 'E', template: '<select ng-model="year" ng-options="i for i in option.years" class="form-control" date-changed></select>'})
.directive("quaterSelect", -> {restrict: 'E', template: '<select ng-model="quater" ng-options="i for i in option.quaters" class="form-control"></select>'})
.directive("monthSelect", -> {restrict: 'E', template: '<select ng-model="month" ng-options="i for i in option.month" class="form-control" date-changed></select>'})
.directive("daySelect", -> {restrict: 'E', template: '<select ng-model="day" ng-options="i for i in option.days" class="form-control" date-changed></select>'})
.directive("dateChanged", ($compile)->
                              return (scope, elem, attt) ->
                                elem.bind('click', () ->
                                  date = new Date($scope.year, $scope.month, 0)
                                  scope.option.days = [1..(date.getDate())]
                                ))
.directive("sendDate", ($compile)->
                          return ($scope, elem, attr) ->
                            elem.bind('click', () ->
                                    if $scope.search_period == 'monthly'
                                        location.href = Routes.record_month_path($scope.year, $scope.month)
                                    else if $scope.search_period == 'yearly'
                                        location.href = Routes.record_year_path($scope.year)
                                    else if $scope.search_period == 'daily'
                                        if $scope.day?
                                          location.href = Routes.record_day_path($scope.year, $scope.month, $scope.day)
                                        else
                                          alert('날짜를 선택해 주세요');
                                    else if $scope.search_period == 'quater'
                                        location.href = Routes.record_quater_path($scope.year, $scope.quater)
            ))