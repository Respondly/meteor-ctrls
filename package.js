Package.describe({
  summary: 'Common UI controls'
});



Package.on_use(function (api) {
  api.use(['coffeescript', 'sugar', 'http']);
  api.use(['templating'], 'client');
  api.use(['css-stylus', 'ctrl', 'util']);

  // Generated with: github.com/philcockfield/meteor-package-paths
  api.add_files('shared/ns.js', ['client', 'server']);
  api.add_files('client/avatar/avatar.html', 'client');
  api.add_files('client/spinner/spinner.html', 'client');
  api.add_files('client/twisty/twisty.html', 'client');
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



