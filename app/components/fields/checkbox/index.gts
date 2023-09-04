import ErrorMessage from '@components/error-message';

import type { TOC } from '@ember/component/template-only';
import type { FormidableError } from 'ember-formidable';

const Checkbox: TOC<{
  Element: HTMLElement;
  Args: { errors?: FormidableError[]; avatar?: string; label?: string; id?: string };
  Blocks: { default: [] };
}> = <template>
  <div class='mt-6 space-y-6'>
    <div class='relative flex gap-x-3'>
      <div class='flex h-6 items-center'>
        <input
          type='checkbox'
          id={{@id}}
          class='h-4 w-4 rounded border-gray-300 text-primary focus:ring-primary
            {{if @errors "ring-important"}}
            mr-2 cursor-pointer'
          ...attributes
        />

        <label class='cursor-pointer flex h-6 items-center ml-2' for={{@id}}>
          {{#if @avatar}}
            <img src={{@avatar}} alt='' class='h-8 w-8 flex-shrink-0 rounded-full' />
          {{/if}}
          {{#if @label}}
            <span class='font-normal ml-2 block truncate text-accent'>{{@label}}</span>
          {{/if}}
        </label>
      </div>
    </div>
    {{#if @errors}}
      <div>
        <ErrorMessage @errors={{@errors}} />
      </div>
    {{/if}}
  </div>
</template>;

export default Checkbox;

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'F::Checkbox': typeof Checkbox;
    'f/checkbox': typeof Checkbox;
  }
}
