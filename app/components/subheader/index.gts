import type { TOC } from '@ember/component/template-only';

const Subheader: TOC<{
  Element: HTMLElement;
  Args: {};
  Blocks: { default: [] };
}> = <template><p class='mt-2 text-lg leading-8 text-accent' ...attributes>{{yield}}</p></template>;

export default Subheader;

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    Subheader: typeof Subheader;
  }
}
