import type { TOC } from '@ember/component/template-only';

const SectionTitle: TOC<{
  Element: HTMLElement;
  Args: {};
  Blocks: { default: [] };
}> = <template>
  <h3 class='mt-3 text-lg font-semibold leading-6 text-accent' ...attributes>
    {{yield}}
  </h3>
</template>;

export default SectionTitle;

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    SectionTitle: typeof SectionTitle;
  }
}
