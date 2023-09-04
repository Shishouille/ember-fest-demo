import { FormidableError } from 'ember-formidable';

import templateOnlyComponent from '@ember/component/template-only';

interface CheckboxSignature {
  Element: HTMLElement;
  Args: { errors?: FormidableError[]; avatar?: string; label?: string; id?: string };
  Blocks: { default: [] };
}

const CheckboxComponent = templateOnlyComponent<CheckboxSignature>();

export default CheckboxComponent;

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'F::Checkbox': typeof CheckboxComponent;
    'f/checkbox': typeof CheckboxComponent;
  }
}
