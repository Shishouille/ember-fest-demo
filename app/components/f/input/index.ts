import type { FormidableError } from 'ember-formidable';

import templateOnlyComponent from '@ember/component/template-only';

interface FInputSignature {
  Element: HTMLInputElement;
  Args: { errors?: FormidableError[]; label?: string; id?: string };
  Blocks: { label: [] };
}

const InputComponent = templateOnlyComponent<FInputSignature>();

export default InputComponent;

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'F::Input': typeof InputComponent;
    'f/Input': typeof InputComponent;
  }
}
