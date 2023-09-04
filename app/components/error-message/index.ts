import { FormidableError } from 'ember-formidable';

import templateOnlyComponent from '@ember/component/template-only';

interface ErrorMessageSignature {
  Element: HTMLDivElement;
  Args: { errors: FormidableError[] };
  Blocks: { default: [] };
}

const ErrorMessageComponent = templateOnlyComponent<ErrorMessageSignature>();

export default ErrorMessageComponent;

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    ErrorMessage: typeof ErrorMessageComponent;
  }
}
