Package.describe({
  name: 'respondly:ctrls',
  summary: 'Common UI controls',
  version: '0.0.1',
  git: 'https://github.com/Respondly/meteor-ctrls.git'
});



Package.onUse(function (api) {
  api.use(['coffeescript', 'http']);
  api.use(['templating', 'ui', 'spacebars'], 'client');
  api.use(['respondly:css-stylus', 'respondly:ctrl', 'respondly:util']);

  // Generated with: github.com/philcockfield/meteor-package-paths
  api.addFiles('client/avatar/avatar.html', 'client');
  api.addFiles('client/spinner/spinner.html', 'client');
  api.addFiles('client/twisty/twisty.html', 'client');
  api.addFiles('client/ns.js', 'client');
  api.addFiles('client/spinner/libs/spin.js', 'client');
  api.addFiles('client/avatar/avatar.coffee', 'client');
  api.addFiles('client/avatar/avatar.styl', 'client');
  api.addFiles('client/spinner/spinner.coffee', 'client');
  api.addFiles('client/spinner/spinner.styl', 'client');
  api.addFiles('client/twisty/twisty.coffee', 'client');
  api.addFiles('client/twisty/twisty.styl', 'client');
  api.addFiles('images/avatar/anon.svg', ['client', 'server']);
  api.addFiles('images/twisty/twisty.svg', ['client', 'server']);

});



