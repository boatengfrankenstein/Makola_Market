var app = window.app = {};
app.Classfieds = void function() {
    this._input = $('#ad-search-txt');
    this._initAutocomplete();
  };
  
  app.Classifieds.prototype = {
  
  };


 _initAutocomplete: void function() {
    this._input
      .autocomplete({
        source: '/classifieds',
        appendTo: '#ad-search-results',
        select: $.proxy(this._select, this)
      })
      .autocomplete('instance')._renderItem = $.proxy(this._render, this);
  }

  _select: void function(e, ui) {
    this._input.val(ui.item.title + ' - ' + ui.item.location);
    return false;
  }


  _render: void function(ul, item) {
    var markup = [
    
      '<span class="title">' + item.title + '</span>',
      '<span class="author">' + item.location + '</span>',
      '<span class="price">' + item.price + '</span>'
    ];
    return $('<li>')
      .append(markup.join(''))
      .appendTo(ul);
  }
