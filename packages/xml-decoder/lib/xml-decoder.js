'use babel';

import XmlDecoderView from './xml-decoder-view';
import { CompositeDisposable } from 'atom';

export default {

  xmlDecoderView: null,
  modalPanel: null,
  subscriptions: null,

  activate(state) {
    this.xmlDecoderView = new XmlDecoderView(state.xmlDecoderViewState);
    this.modalPanel = atom.workspace.addModalPanel({
      item: this.xmlDecoderView.getElement(),
      visible: false
    });

    // Events subscribed to in atom's system can be easily cleaned up with a CompositeDisposable
    this.subscriptions = new CompositeDisposable();

    // Register command that toggles this view
    this.subscriptions.add(atom.commands.add('atom-workspace', {
      'xml-decoder:toggle': () => this.toggle()
    }));

    this.subscriptions.add(atom.commands.add('atom-workspace', {
      'xml-decoder:decode': () => this.decode()
    }));
  },

  deactivate() {
    this.modalPanel.destroy();
    this.subscriptions.dispose();
    this.xmlDecoderView.destroy();
  },

  serialize() {
    return {
      xmlDecoderViewState: this.xmlDecoderView.serialize()
    };
  },

  toggle() {
    console.log('toggle');
  },

  decode(){

    let editor
    if (editor = atom.workspace.getActiveTextEditor()) {
      let text = editor.getText()
      let decodedText = text.replace(/&lt;/g,'<').replace(/&gt;/g,'>').replace(/&amp;/g,'&');
      editor.setText(decodedText)
    }
  }
};
