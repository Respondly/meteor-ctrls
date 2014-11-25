Package.describe({
  name: 'respondly:ctrls',
  summary: 'Common UI controls',
  version: '0.0.1',
  git: 'https://github.com/Respondly/meteor-ctrls.git'
});



Package.on_use(function (api) {
  api.use(['coffeescript', 'http']);
  api.use(['templating', 'ui', 'spacebars'], 'client');
  api.use(['respondly:css-stylus', 'respondly:ctrl', 'respondly:util']);

  // Generated with: github.com/philcockfield/meteor-package-paths
  api.add_files('client/avatar/avatar.html', 'client');
  api.add_files('client/spinner/spinner.html', 'client');
  api.add_files('client/twisty/twisty.html', 'client');
  api.add_files('client/ns.js', 'client');
  api.add_files('client/spinner/libs/spin.js', 'client');
  api.add_files('client/avatar/avatar.coffee', 'client');
  api.add_files('client/avatar/avatar.styl', 'client');
  api.add_files('client/spinner/spinner.coffee', 'client');
  api.add_files('client/spinner/spinner.styl', 'client');
  api.add_files('client/twisty/twisty.coffee', 'client');
  api.add_files('client/twisty/twisty.styl', 'client');
  api.add_files('images/avatar/anon.svg', ['client', 'server']);
  api.add_files('images/twisty/twisty.svg', ['client', 'server']);

});



