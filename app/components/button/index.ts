import templateOnlyComponent from '@ember/component/template-only';

interface ButtonSignature {
  Element: HTMLButtonElement;
  Args: {};
  Blocks: { default: [] };
}

const ButtonComponent = templateOnlyComponent<ButtonSignature>();

export default ButtonComponent;

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    Button: typeof ButtonComponent;
  }
}
