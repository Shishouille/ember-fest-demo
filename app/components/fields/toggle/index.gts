import { fn } from '@ember/helper';
import { on } from '@ember/modifier';
import { not } from '@ember/object/computed';

import ErrorMessage from '@components/error-message';
import Label from '@components/label';

import type { TOC } from '@ember/component/template-only';
import type { FormidableError } from 'ember-formidable';

const Toggle: TOC<{
  Element: HTMLElement;
  Args: {
    errors?: FormidableError[];
    label?: string;
    toggled: boolean;
    onToggle: () => void;
  };
  Blocks: { default: [] };
}> = <template>
  <div class='flex gap-x-4 sm:col-span-2'>
    <div class='flex h-6 items-center'>
      <button
        type='button'
        class='{{if @toggled "bg-primary" "bg-gray-200"}}
          bg-gray-200 flex w-8 flex-none cursor-pointer rounded-full p-px ring-1 ring-inset ring-gray-900/5 transition-colors duration-200 ease-in-out focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600
          {{if @errors "ring-important"}}'
        role='switch'
        aria-checked={{@toggled}}
        {{! @glint-expect-error: Said it's a string when it's a boolean? }}
        {{on 'click' (fn @onToggle (not @toggled))}}
        ...attributes
      >
        <span class='sr-only'>{{@label}}</span>

        <span
          aria-hidden='true'
          class='{{if @toggled "translate-x-3.5" "translate-x-0"}}
            translate-x-0 h-4 w-4 transform rounded-full bg-white shadow-sm ring-1 ring-gray-900/5 transition duration-200 ease-in-out'
        ></span>
      </button>
    </div>

    <Label for='switch-1-label'>
      {{#if (has-block 'label')}}
        {{! @glint-expect-error: don't know how to type named blocks :( }}
        {{yield to='label'}}
      {{else if @label}}
        {{@label}}
      {{/if}}
    </Label>

  </div>
  {{#if @errors}}
    <div>
      <ErrorMessage @errors={{@errors}} />
    </div>
  {{/if}}
</template>;

export default Toggle;

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'F::Toggle': typeof Toggle;
    'f/toggle': typeof Toggle;
  }
}
