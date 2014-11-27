/*!
 * JavaScript for Flat UI's docs (http://designmodo.com/flat)
 * Copyright 2013-2014 Designmodo, Inc.
 */

// Some general UI pack related JS
// Extend JS String with repeat method
String.prototype.repeat = function (num) {
  'use strict';
  return new Array(num + 1).join(this);
};

(function ($) {
  'use strict';

  // Add segments to a slider
  $.fn.addSliderSegments = function (amount, orientation) {
    return this.each(function () {
      if (orientation === 'vertical') {
        var output = '';
        var i;
        for (i = 1; i <= amount - 2; i++) {
          output += '<div class="ui-slider-segment" style="top:' + 100 / (amount - 1) * i + '%;"></div>';
        }
        $(this).prepend(output);
      } else {
        var segmentGap = 100 / (amount - 1) + '%';
        var segment = '<div class="ui-slider-segment" style="margin-left: ' + segmentGap + ';"></div>';
        $(this).prepend(segment.repeat(amount - 2));
      }
    });
  };

  $(function () {

    // Custom Selects
    if ($('[data-toggle="select"]').length) {
      $('[data-toggle="select"]').select2();
    }

    // Checkboxes and Radiobuttons

    $('[data-toggle="checkbox"]').radiocheck();
    $('[data-toggle="radio"]').radiocheck();

    // Tabs
    $('.nav-tabs a').on('click', function (e) {
      e.preventDefault();
      $(this).tab('show');
    });

    // Tooltips
    $('[data-toggle="tooltip"]').tooltip('show');

    // Popovers
    $('[data-toggle="popover"]').popover();

    // jQuery UI Sliders
    var $slider = $('#slider');
    if ($slider.length) {
      $slider.slider({
        min: 1,
        max: 5,
        values: [3, 4],
        orientation: 'horizontal',
        range: true
      }).addSliderSegments($slider.slider('option').max);

    }

    var $slider2 = $('#slider2');
    if ($slider2.length) {
      $slider2.slider({
        min: 1,
        max: 5,
        values: [3, 4],
        orientation: 'horizontal',
        range: true
      }).addSliderSegments($slider2.slider('option').max);
    }

    var $slider3 = $('#slider3');
    var slider3ValueMultiplier = 100;
    var slider3Options;

    if ($slider3.length) {
      $slider3.slider({
        min: 1,
        max: 5,
        values: [3, 4],
        orientation: 'horizontal',
        range: true,
        slide: function (event, ui) {
          $slider3.find('.ui-slider-value:first')
            .text('$' + ui.values[0] * slider3ValueMultiplier)
            .end()
            .find('.ui-slider-value:last')
            .text('$' + ui.values[1] * slider3ValueMultiplier);
        }
      });

      slider3Options = $slider3.slider('option');
      $slider3.addSliderSegments(slider3Options.max)
        .find('.ui-slider-value:first')
        .text('$' + slider3Options.values[0] * slider3ValueMultiplier)
        .end()
        .find('.ui-slider-value:last')
        .text('$' + slider3Options.values[1] * slider3ValueMultiplier);
    }

    var $verticalSlider = $('#vertical-slider');
    if ($verticalSlider.length) {
      $verticalSlider.slider({
        min: 1,
        max: 5,
        value: 3,
        orientation: 'vertical',
        range: 'min'
      }).addSliderSegments($verticalSlider.slider('option').max, 'vertical');
    }

    // Placeholders for input/textarea
    $(':text, textarea').placeholder();

    // Make pagination demo work
    $('.pagination').on('click', 'a', function () {
      $(this).parent().siblings('li').removeClass('active').end().addClass('active');
    });

    $('.btn-group').on('click', 'a', function () {
      $(this).siblings().removeClass('active').end().addClass('active');
    });

    // Disable link clicks to prevent page scrolling
    $(document).on('click', 'a[href="#fakelink"]', function (e) {
      e.preventDefault();
    });

    // jQuery UI Spinner
    if (typeof $.ui != 'undefined') {
      $.widget('ui.customspinner', $.ui.spinner, {
        widgetEventPrefix: $.ui.spinner.prototype.widgetEventPrefix,
        _buttonHtml: function () { // Remove arrows on the buttons
          return '' +
          '<a class="ui-spinner-button ui-spinner-up ui-corner-tr">' +
            '<span class="ui-icon ' + this.options.icons.up + '"></span>' +
          '</a>' +
          '<a class="ui-spinner-button ui-spinner-down ui-corner-br">' +
            '<span class="ui-icon ' + this.options.icons.down + '"></span>' +
          '</a>';
        }
      });

      $('#spinner-01, #spinner-02, #spinner-03, #spinner-04, #spinner-05').customspinner({
        min: -99,
        max: 99
      }).on('focus', function () {
        $(this).closest('.ui-spinner').addClass('focus');
      }).on('blur', function () {
        $(this).closest('.ui-spinner').removeClass('focus');
      });
    }


    // Focus state for append/prepend inputs
    $('.input-group').on('focus', '.form-control', function () {
      $(this).closest('.input-group, .form-group').addClass('focus');
    }).on('blur', '.form-control', function () {
      $(this).closest('.input-group, .form-group').removeClass('focus');
    });

    // Table: Toggle all checkboxes
    $('.table .toggle-all :checkbox').on('click', function () {
      var $this = $(this);
      var ch = $this.prop('checked');
      $this.closest('.table').find('tbody :checkbox').radiocheck(!ch ? 'uncheck' : 'check');
    });

    // Table: Add class row selected
    $('.table tbody :checkbox').on('change.radiocheck', function () {
      var $this = $(this);
      var check = $this.prop('checked');
      var checkboxes = $('.table tbody :checkbox');
      var checkAll = checkboxes.length === checkboxes.filter(':checked').length;

      $this.closest('tr')[check ? 'addClass' : 'removeClass']('selected-row');
      $this.closest('.table').find('.toggle-all :checkbox').radiocheck(checkAll ? 'check' : 'uncheck');
    });

    // jQuery UI Datepicker
    if (typeof $.ui != 'undefined') {
      var datepickerSelector = $('#datepicker-01');
      datepickerSelector.datepicker({
        showOtherMonths: true,
        selectOtherMonths: true,
        dateFormat: 'd MM, yy',
        yearRange: '-1:+1'
      }).prev('.input-group-btn').on('click', function (e) {
        e && e.preventDefault();
        datepickerSelector.focus();
      });
      $.extend($.datepicker, { _checkOffset: function (inst,offset,isFixed) { return offset; } });

      // Now let's align datepicker with the prepend button
      datepickerSelector.datepicker('widget').css({ 'margin-left': -datepickerSelector.prev('.input-group-btn').find('.btn').outerWidth() + 3 });
    }

    // Timepicker
    if ($('#timepicker1').length) {
      $('#timepicker1').timepicker().on('click', function () {
        $(this).timepicker('showWidget');
      });
    }

    // Switches
    if ($('[data-toggle="switch"]').length) {
      $('[data-toggle="switch"]').bootstrapSwitch();
    }

    // Typeahead
    if ($('#typeahead-demo-01').length) {
      var states = new Bloodhound({
        datumTokenizer: function (d) { return Bloodhound.tokenizers.whitespace(d.word); },
        queryTokenizer: Bloodhound.tokenizers.whitespace,
        limit: 4,
        local: [
          { word: 'Alabama' },
          { word: 'Alaska' },
          { word: 'Arizona' },
          { word: 'Arkansas' },
          { word: 'California' },
          { word: 'Colorado' }
        ]
      });

      states.initialize();

      $('#typeahead-demo-01').typeahead(null, {
        name: 'states',
        displayKey: 'word',
        source: states.ttAdapter()
      });
    }

    // Todo list
    $('.todo').on('click', 'li', function () {
      $(this).toggleClass('todo-done');
    });

    // make code pretty
    window.prettyPrint && prettyPrint();
  });
}(jQuery));

function showHide(elementId) {
        if (document.getElementById) {
            var element = document.getElementById(elementId);
            if (element.style.visibility == 'hidden') {
                element.style.visibility = 'visible';
            } else if (element.style.visibility == 'visible') {
                element.style.visibility = 'hidden';
            }
        }
    }