import ErrorMessage from '@components/error-message';
import Label from '@components/label';

import type { TOC } from '@ember/component/template-only';
import type { FormidableError } from 'ember-formidable';

const Input: TOC<{
  Element: HTMLInputElement;
  Args: { errors?: FormidableError[]; label?: string; id?: string };
  Blocks: { default: [] };
}> = <template>
  {{#if @label}}
    <Label for={{@id}}>
      {{#if (has-block 'label')}}
        {{! @glint-expect-error: don't know how to type named blocks :( }}
        {{yield to='label'}}
      {{else if @label}}
        {{@label}}
      {{/if}}
    </Label>
  {{/if}}
  <div class={{if @label 'mt-2.5'}}>
    <input
      id={{@id}}
      class='block w-full rounded-md border-0 px-3.5 py-2 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-primary
        {{if @errors "ring-important"}}
        sm:text-sm sm:leading-6'
      ...attributes
    />
  </div>
  {{#if @errors}}
    <div>
      <ErrorMessage @errors={{@errors}} />
    </div>
  {{/if}}
</template>;

export default Input;

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'F::Input': typeof Input;
    'f/input': typeof Input;
  }
}
