import templateOnlyComponent from '@ember/component/template-only';

interface LabelSignature {
  Element: HTMLLabelElement;
  Args: {};
  Blocks: { default: [] };
}

const LabelComponent = templateOnlyComponent<LabelSignature>();

export default LabelComponent;

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    Label: typeof LabelComponent;
  }
}
