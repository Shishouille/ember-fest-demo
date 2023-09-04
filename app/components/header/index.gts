import type { TOC } from '@ember/component/template-only';

const Header: TOC<{
  Element: HTMLElement;
  Args: {};
  Blocks: { default: [] };
}> = <template>
  <h2 class='text-4xl font-title tracking-tight text-primary sm:text-5xl' ...attributes>{{yield}}
  </h2>
</template>;

export default Header;

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    Header: typeof Header;
  }
}
