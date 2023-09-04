import ErrorMessage from '@components/error-message';
import Label from '@components/label';
import type { TOC } from '@ember/component/template-only';
import type { FormidableError } from 'ember-formidable';

const Textarea: TOC<{
  Element: HTMLElement;
  Args: {
    errors?: FormidableError[];
    label?: string;
    id?: string;
  };
  Blocks: { default: [] };
}> = <template>
  {{#if @label}}
    <Label for={{@id}}>
      {{#if (has-block 'label')}}
        {{yield to='label'}}
      {{else if @label}}
        {{@label}}
      {{/if}}
    </Label>
  {{/if}}
  <div class='mt-2.5'>
    <textarea
      id={{@id}}
      class='block w-full rounded-md border-0 px-3.5 py-2 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-primary sm:text-sm sm:leading-6
        {{if @errors "ring-important"}}'
      ...attributes
    ></textarea>
  </div>
  {{#if @errors}}
    <div>
      <ErrorMessage @errors={{@errors}} />
    </div>
  {{/if}}
</template>;

export default Textarea;

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'F::Textarea': typeof Textarea;
    'f/textarea': typeof Textarea;
  }
}
