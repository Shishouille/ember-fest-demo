import templateOnlyComponent from '@ember/component/template-only';

interface HeaderSignature {
  Element: HTMLElement;
  Args: {};
  Blocks: { default: [] };
}

const HeaderComponent = templateOnlyComponent<HeaderSignature>();

export default HeaderComponent;

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    Header: typeof HeaderComponent;
  }
}
