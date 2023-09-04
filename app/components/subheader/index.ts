import templateOnlyComponent from '@ember/component/template-only';

interface SubheaderSignature {
  Element: HTMLElement;
  Args: {};
  Blocks: { default: [] };
}

const SubheaderComponent = templateOnlyComponent<SubheaderSignature>();

export default SubheaderComponent;

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    Subheader: typeof SubheaderComponent;
  }
}
