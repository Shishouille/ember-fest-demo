import ErrorMessage from '@components/error-message';

import type { TOC } from '@ember/component/template-only';
import type { FormidableError } from 'ember-formidable';

const Fieldset: TOC<{
  Element: HTMLElement;
  Args: { errors: FormidableError[]; legend?: string };
  Blocks: { default: [] };
}> = <template>
  <fieldset>
    {{#if @legend}}
      <legend class='text-sm font-semibold leading-6'>{{@legend}}</legend>
    {{/if}}
    <div class='mt-2 space-y-6 lg:flex items-center place-content-between'>
      {{yield}}
    </div>
    {{#if @errors}}
      <div>
        <ErrorMessage @errors={{@errors}} />
      </div>
    {{/if}}
  </fieldset>
</template>;

export default Fieldset;

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'F::Fieldset': typeof Fieldset;
    'f/fieldset': typeof Fieldset;
  }
}
