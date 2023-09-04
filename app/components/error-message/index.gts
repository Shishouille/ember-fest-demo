import type { TOC } from '@ember/component/template-only';
import type { FormidableError } from 'ember-formidable';

const ErrorMessage: TOC<{
  Element: HTMLDivElement;
  Args: { errors: FormidableError[] };
  Blocks: { default: [] };
}> = <template>
  {{#each @errors as |e|}}
    <span class='flex items-center font-medium tracking-wide text-important text-xs mt-1 ml-1'>
      {{e.message}}
    </span>
  {{/each}}
</template>;

export default ErrorMessage;

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    ErrorMessage: typeof ErrorMessage;
  }
}
