import templateOnlyComponent from '@ember/component/template-only';

interface SectionTitleSignature {
  Element: HTMLElement;
  Args: {};
  Blocks: { default: [] };
}

const SectionTitleComponent = templateOnlyComponent<SectionTitleSignature>();

export default SectionTitleComponent;

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    SectionTitle: typeof SectionTitleComponent;
  }
}
