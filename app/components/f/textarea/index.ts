import { FormidableError } from 'ember-formidable';

import templateOnlyComponent from '@ember/component/template-only';

interface TextareaSignature {
  Element: HTMLElement;
  Args: {
    errors?: FormidableError[];
    label?: string;
    id?: string;
  };
  Blocks: { label: [] };
}

const TextareaComponent = templateOnlyComponent<TextareaSignature>();

export default TextareaComponent;

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'F::Textarea': typeof TextareaComponent;
    'f/Textarea': typeof TextareaComponent;
  }
}
