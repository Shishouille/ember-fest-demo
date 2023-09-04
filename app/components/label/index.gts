import type { TOC } from '@ember/component/template-only';

const Label: TOC<{
  Element: HTMLLabelElement;
  Args: {};
  Blocks: { default: [] };
}> = <template>
  <label class='text-sm leading-6 text-accent' ...attributes>
    {{yield}}
  </label>
</template>;

export default Label;

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    Label: typeof Label;
  }
}
