// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require moment
//= require fullcalender
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require bootstrap-sprockets
//= require_tree .

//fullcalenderを正しく読み込むためのコード
$(function(){
  //画面遷移を検知（turbolinksエラー改善）
  $(document).on('turbolinks:load', function(){

    function eventCalender(){
      return $('#calender').fullCalender({})
    };
    function clearCalender(){
      $('#calender').html('');
    };
    //呼び出すコード
    $(document).on('turbolinks:load', function(){
      eventcalender();
    });
    $(document).on('turbolinks:before-cache', clearCalender);

    //カレンダーの詳細はjsonファイルを参照するように指定
    $('#calneder').fullcalender({
      events: '/events.json'
      //以下に表示形式の変更が可能
      titleFormat: 'YYYY年 M月',//カレンダー上部年月で表示
      dayNamesShort: ['日','月','火','水','木','金','土'],//曜日を日本語表示
      //ボタンのレイアウト
      header: {
        left: '',
        center: 'title',
        right: 'today prev,next'
      };
      //終了時刻がないイベントの表示間隔
      defaultTimeEventDuration: '03:00:00',
      buttonText: {
        prev: '前',
        next: '次',
        prevYear: '前年',
        nextYear: '翌年',
        today: '今日',
        month: '月',
        week: '週',
        day: '日',
      },
      //イベントの時間表示を24時間に
      timeFormat: "HH:mm",
      //イベントの色を変える
      eventColor: '#63ceef',
      //イベントの文字色を変える
      eventTextColor: '#0000000',
    });
  });
});
