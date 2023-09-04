import 'ember-source/types';
import 'ember-source/types/preview';
import '@glint/environment-ember-loose';
import '@glint/environment-ember-template-imports';

import type EmberFormidableRegistry from 'ember-formidable/template-registry';
import type EmberShikiRegistry from 'ember-shiki/template-registry';

type Registries = EmberShikiRegistry & EmberFormidableRegistry;
declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry extends Registries /* ... */ {}
}
