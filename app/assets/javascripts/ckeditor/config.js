CKEDITOR.editorConfig = function( config ) {
    config.toolbarGroups = [
        { name: 'tools' },
        { name: 'basicstyles', groups: [ 'basicstyles', 'cleanup' ] },
        { name: 'styles' },
        { name: 'others' }
    ];
    config.removeButtons = 'Underline,Subscript,Superscript';
    config.format_tags = 'p;h1;h2;h3;pre';
    config.removeDialogTabs = 'image:advanced;link:advanced';
}
