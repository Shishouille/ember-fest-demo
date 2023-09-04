import ErrorMessage from '@components/error-message';
import Label from '@components/label';

import type { TOC } from '@ember/component/template-only';
import type { FormidableError } from 'ember-formidable';

const Select: TOC<{
  Element: HTMLElement;
  Args: {
    errors?: FormidableError[];
    label?: string;
    id?: string;
    options: Array<{ value: any; label: string }>;
  };
  Blocks: { default: [] };
}> = <template>
  {{#if @label}}
    <Label for='switch-1-label' class='sr-only'>
      {{#if (has-block 'label')}}
        {{! @glint-expect-error: don't know how to type named blocks :( }}
        {{yield to='label'}}
      {{else if @label}}
        {{@label}}
      {{/if}}
    </Label>
  {{/if}}
  <select
    id={{@id}}
    class='h-full rounded-md border-0 bg-transparent bg-none py-0 pl-4 pr-9 text-gray-400 focus:ring-2 focus:ring-inset focus:ring-primary sm:text-sm
      {{if @errors "ring-important"}}'
    ...attributes
  >
    {{#each @options as |o|}}
      <option value={{o.value}}>{{o.label}}</option>
    {{/each}}
  </select>
  {{#if @errors}}
    <div>
      <ErrorMessage @errors={{@errors}} />
    </div>
  {{/if}}
</template>;

export default Select;

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'F::Select': typeof Select;
    'f/select': typeof Select;
  }
}
