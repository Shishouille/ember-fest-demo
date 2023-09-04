import { FormidableError } from 'ember-formidable';

import templateOnlyComponent from '@ember/component/template-only';

interface FieldsetSignature {
  Element: HTMLElement;
  Args: { errors: FormidableError[]; legend?: string };
  Blocks: { default: [] };
}

const FieldsetComponent = templateOnlyComponent<FieldsetSignature>();

export default FieldsetComponent;

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'F::Fieldset': typeof FieldsetComponent;
    'f/fieldset': typeof FieldsetComponent;
  }
}
