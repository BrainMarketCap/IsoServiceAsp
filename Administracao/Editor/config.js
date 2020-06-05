/**
 * @license Copyright (c) 2003-2015, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see LICENSE.md or http://ckeditor.com/license
 */

CKEDITOR.editorConfig = function (config) {
    config.language = 'pt-br'
    config.toolbar = [
		{ name: 'document', items: ['Preview', 'Print', '-', 'Templates'] },
		{ name: 'clipboard', items: ['Cut', 'Copy', 'Paste', 'PasteText', 'PasteFromWord', '-', 'Undo', 'Redo'] },
		{ name: 'editing', items: ['Find', 'Replace', '-', 'SelectAll', '-'] },
        { name: 'styles', items: ['FontSize'] },
		{ name: 'colors', items: ['TextColor'] },
		{ name: 'tools', items: ['Maximize', 'Format'] },
		'/',
		{ name: 'basicstyles', items: ['Bold', 'Italic', 'Underline', 'Strike', 'Subscript', 'Superscript', '-', 'RemoveFormat'] },
		{ name: 'paragraph', items: ['NumberedList', 'BulletedList', '-', 'Outdent', 'Indent', '-', 'JustifyLeft', 'JustifyCenter', 'JustifyRight', 'JustifyBlock'] },
		{ name: 'links', items: ['Link', 'Unlink'] },
		{ name: 'insert', items: ['HorizontalRule'] }
	];
};
