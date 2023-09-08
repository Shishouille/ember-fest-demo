import templateOnlyComponent from '@ember/component/template-only';

import type { FormidableError } from 'ember-formidable';

interface ToggleSignature {
  Element: HTMLElement;
  Args: {
    errors?: FormidableError[];
    label?: string;
    toggled: boolean;
    onToggle: () => void;
  };
  Blocks: { label: [] };
}

const ToggleComponent = templateOnlyComponent<ToggleSignature>();

export default ToggleComponent;

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'F::Toggle': typeof ToggleComponent;
    'f/Toggle': typeof ToggleComponent;
  }
}
