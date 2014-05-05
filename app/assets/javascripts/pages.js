$('textarea').autosize();

var $editor = $('#editor');
if ($editor.length > 0) {
    var editor = ace.edit('editor');
    editor.setTheme("ace/theme/theme-xcode");
    editor.session.setMode("ace/mode/c_cpp");
    $("form").submit(function() {
        var code = editor.getValue();
        $("#code_codigo").val(code);
    });
}
