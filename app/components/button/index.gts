import type { TOC } from '@ember/component/template-only';

const Button: TOC<{
  Element: HTMLButtonElement;
  Args: {};
  Blocks: { default: [] };
}> = <template>
  <button
    type='button'
    class='block w-full rounded-md bg-primary px-3.5 py-2.5 text-center text-sm font-semibold text-white shadow-sm hover:bg-primary-hover focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-primary'
    ...attributes
  >
    {{yield}}
  </button>
</template>;

export default Button;

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    Button: typeof Button;
  }
}
