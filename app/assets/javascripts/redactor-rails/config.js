window.init_redactor = function(){
  var csrf_token = $('meta[name=csrf-token]').attr('content');
  var csrf_param = $('meta[name=csrf-param]').attr('content');
  var params;
  if (csrf_param !== undefined && csrf_token !== undefined) {
      params = csrf_param + "=" + encodeURIComponent(csrf_token);
  }
  $('.redactor').redactor({
        // You can specify, which ones plugins you need.
        // If you want to use plugins, you have add plugins to your
        // application.js and application.css files and uncomment the line below:
        // "plugins": ['fontsize', 'fontcolor', 'fontfamily', 'fullscreen', 'textdirection', 'clips'],
        // "buttons": ['html', 'formatting', 'bold', 'italic', 'underline', 'deleted', 'unorderedlist', 'orderedlist', 'outdent', 'indent', 'image', 'file', 'link', 'alignment', 'horizontalrule','bufferbuttons'],
        "buttons": ['html', 'formatting', 'bold', 'italic', 'underline', 'fontsize', 'unorderedlist', 'orderedlist', 'outdent', 'indent', 'image', 'link', 'alignment', 'horizontalrule','bufferbuttons'],
        "plugins": ['fontsize', 'fontcolor', 'fullscreen','html'],
        "imageUpload":"/redactor_rails/pictures?" + params,
        "imageGetJson":"/redactor_rails/pictures",
        "fileUpload":"/redactor_rails/documents?" + params,
        "fileGetJson":"/redactor_rails/documents",
        "path":"/assets/redactor-rails",
        "css":"style.css",
        "lang":'zh_cn',
        // "focus": true,
        "source": false
      });
}

$(document).on( 'ready page:load', window.init_redactor );


