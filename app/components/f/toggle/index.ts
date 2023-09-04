import { FormidableError } from 'ember-formidable';

import templateOnlyComponent from '@ember/component/template-only';

interface ToggleSignature {
  Element: HTMLElement;
  Args: {
    errors?: FormidableError[];
    label?: string;
    toggled: boolean;
    onToggle: () => void;
  };
  Blocks: { default: [] };
}

const ToggleComponent = templateOnlyComponent<ToggleSignature>();

export default ToggleComponent;

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'F::Toggle': typeof ToggleComponent;
    'f/Toggle': typeof ToggleComponent;
  }
}
