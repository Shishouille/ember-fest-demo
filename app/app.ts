import 'ember-fest-demo/assets/ember-fest-demo.css';

import config from 'ember-fest-demo/config/environment';
import loadInitializers from 'ember-load-initializers';
import Resolver from 'ember-resolver';

import Application from '@ember/application';

export default class App extends Application {
  modulePrefix = config.modulePrefix;
  podModulePrefix = config.podModulePrefix;
  Resolver = Resolver;
}

loadInitializers(App, config.modulePrefix);
