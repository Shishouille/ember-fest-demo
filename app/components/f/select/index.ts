import { FormidableError } from 'ember-formidable';

import templateOnlyComponent from '@ember/component/template-only';

interface SelectSignature {
  Element: HTMLElement;
  Args: {
    errors?: FormidableError[];
    label?: string;
    id?: string;
    options: Array<{ value: any; label: string }>;
  };
  Blocks: { default: []; label: [] };
}

const SelectComponent = templateOnlyComponent<SelectSignature>();

export default SelectComponent;

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'F::Select': typeof SelectComponent;
    'f/select': typeof SelectComponent;
  }
}
