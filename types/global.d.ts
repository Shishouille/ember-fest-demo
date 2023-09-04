import 'ember-source/types';
import 'ember-source/types/preview';
import '@glint/environment-ember-loose';

import type Demo from '@components/demo';
import type EmberShikiRegistery from 'ember-shiki/template-registry';
declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry extends EmberShikiRegistery /* ... */ {
    Demo: Demo;
  }
}
