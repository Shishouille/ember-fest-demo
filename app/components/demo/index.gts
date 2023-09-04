import Component from '@glimmer/component';
import { tracked } from '@glimmer/tracking';
import { hash } from '@ember/helper';
import { array } from '@ember/helper';
import { fn } from '@ember/helper';
import { on } from '@ember/modifier';
import { action } from '@ember/object';

import Button from '@components/button';
import ErrorMessage from '@components/error-message';
import Checkbox from '@components/fields/checkbox';
import Fieldset from '@components/fields/fieldset';
import Input from '@components/fields/input';
import Select from '@components/fields/select';
import Textarea from '@components/fields/textarea';
import Toggle from '@components/fields/toggle';
import Header from '@components/header';
import SectionTitle from '@components/section-title';
import Subheader from '@components/subheader';
import { Formidable, yupValidator } from 'ember-formidable';
import CodeBlock from 'ember-shiki/components/code-block';
import queue from 'node_modules/backburner.js/dist/backburner/queue';
import * as Yup from 'yup';

export interface Signature {
  Element: HTMLAnchorElement;
  Args: {};
  Blocks: {
    default: [];
  };
}

const schema = Yup.object().shape({
  lastName: Yup.string().required('Last name is required'),
  firstName: Yup.string().required('First name is required'),
  phone: Yup.object().shape({
    country: Yup.string().oneOf(['ES', 'FR', 'US']).required('Phone country is required'),
    number: Yup.string().required('Phone number is required'),
  }),
  birthday: Yup.string().required('Birthday is required'),
  email: Yup.string().email('Invalid email').required('Email is required'),
  talk: Yup.object().shape({
    title: Yup.string().required('Talk title is required'),
    description: Yup.string().required('Talk description is required'),
  }),
  agreed: Yup.boolean().required('You must agree'),
  reviewers: Yup.array()
    .of(Yup.string().oneOf(['joschka', 'balint', 'marco']))
    .required('At least one reviewer is required'),
});

class Demo extends Component<Signature> {
  @tracked updatedData?: string;

  @action
  logData(data: object) {
    this.updatedData = JSON.stringify(data, null, 2);
  }

  validator = yupValidator(schema);

  <template>
    <Formidable @handler={{this.logData}} @validator={{this.validator}} as |api values|>
      <div class='isolate bg-secondary i-background px-6 py-24 sm:py-32 lg:px-8'>
        <div
          class='absolute inset-x-0 top-[-10rem] -z-10 transform-gpu overflow-hidden blur-3xl sm:top-[-20rem]'
          aria-hidden='true'
        >
          {{! template-lint-disable no-inline-styles }}
          {{! <div
        class="relative left-1/2 -z-10 aspect-[1155/678] w-[36.125rem] max-w-none -translate-x-1/2 rotate-[30deg] bg-gradient-to-tr from-[#ea473b] to-[#08175e] opacity-30 sm:left-[calc(50%-40rem)] sm:w-[72.1875rem]"
        style="clip-path: polygon(74.1% 44.1%, 100% 61.6%, 97.5% 26.9%, 85.5% 0.1%, 80.7% 2%, 72.5% 32.5%, 60.2% 62.4%, 52.4% 68.1%, 47.5% 58.3%, 45.2% 34.5%, 27.5% 76.7%, 0.1% 64.9%, 17.9% 100%, 27.6% 76.8%, 76.1% 97.7%, 74.1% 44.1%)"
      ></div> }}

        </div>
        <div class='md:flex gap-10 place-content-center mx-auto'>
          <div>
            <div class='max-w-2xl text-center border-b border-accent pb-5 sm:pb-10'>
              <Header>Add a talk</Header>
              <Subheader class='mt-3'>Want to raise your voice in front of the audience? Add your
                infos here!</Subheader>
            </div>
            <form class='mt-16 max-w-xl sm:mt-20' {{on 'submit' api.onSubmit}}>
              <div class='grid grid-cols-1 gap-x-8 gap-y-6 sm:grid-cols-2'>
                <div class='sm:col-span-2'>
                  <SectionTitle>General informations</SectionTitle>
                </div>
                <div>
                  <Input
                    @id='first-name'
                    @label='First name'
                    autocomplete='given-name'
                    type='text'
                    @errors={{api.errors.firstName}}
                    {{api.register 'firstName'}}
                  />
                </div>
                <div>
                  <Input
                    @id='last-name'
                    @label='Last name'
                    autocomplete='family-name'
                    type='text'
                    @errors={{api.errors.lastName}}
                    {{api.register 'lastName'}}
                  />
                </div>
                <div class='sm:col-span-2'>
                  <Input
                    @id='company'
                    @label='Company'
                    autocomplete='organization'
                    type='text'
                    {{api.register 'company'}}
                  />
                </div>
                <div class='sm:col-span-2'>
                  <Input
                    @id='email'
                    @label='Email'
                    autocomplete='organization'
                    type='email'
                    @errors={{api.errors.email}}
                    {{api.register 'email'}}
                  />
                </div>
                <div class='sm:col-span-2'>
                  <label
                    for='phone-number'
                    class='block text-sm font-semibold leading-6 text-gray-900'
                  >Phone number</label>
                  <div class='relative mt-2.5'>
                    <div class='absolute inset-y-0 left-0 flex items-center'>
                      <Select
                        @id='country'
                        @options={{array
                          (hash value='' label='+??')
                          (hash value='ES' label='🇪🇸 +34')
                          (hash value='FR' label='🇫🇷 +33')
                          (hash value='US' label='🇺🇸 +1')
                        }}
                        name='phone.country'
                        {{api.register}}
                      />
                      <svg
                        class='pointer-events-none absolute right-3 top-0 h-full w-5 text-gray-400'
                        viewBox='0 0 20 20'
                        fill='currentColor'
                        aria-hidden='true'
                      >
                        <path
                          fill-rule='evenodd'
                          d='M5.23 7.21a.75.75 0 011.06.02L10 11.168l3.71-3.938a.75.75 0 111.08 1.04l-4.25 4.5a.75.75 0 01-1.08 0l-4.25-4.5a.75.75 0 01.02-1.06z'
                          clip-rule='evenodd'
                        />
                      </svg>
                    </div>
                    <Input
                      type='tel'
                      @id='phone-number'
                      autocomplete='tel'
                      class='block w-full border-0 px-3.5 py-2 pl-28'
                      name='phone-number'
                      {{api.register}}
                    />

                  </div>
                  <ErrorMessage @errors={{api.getError 'phone.number'}} />
                  <ErrorMessage @errors={{api.getError 'phone.country'}} />
                </div>
                <div class='sm:col-span-2'>
                  <Input
                    @id='birthday'
                    @label='Birthday'
                    autocomplete='bday'
                    type='date'
                    @errors={{api.errors.birthday}}
                    {{api.register 'birthday'}}
                  />
                </div>
              </div>
              <div
                class='grid grid-cols-1 gap-x-8 gap-y-6 sm:grid-cols-2 border-t border-accent pt-10 mt-10 sm:pt-10'
              >
                <SectionTitle>Your talk</SectionTitle>
                <div class='sm:col-span-2'>

                  <Input
                    @label='Talk title'
                    @id='talk-title'
                    @errors={{api.getError 'talk.title'}}
                    {{api.register 'talk.title'}}
                  />
                </div>
                <div class='sm:col-span-2'>
                  <Textarea
                    @id='talk-description'
                    @label='Talk description'
                    @errors={{api.getError 'talk.description'}}
                    {{api.register 'talk.description'}}
                  />
                </div>
                <Toggle
                  @toggled={{values.agreed}}
                  {{! @glint-expect-error: No types yet }}
                  @onToggle={{queue
                    (fn api.setValue 'agreed')
                    (if api.isSubmitted (fn api.validate 'agreed'))
                  }}
                  @errors={{api.errors.agreed}}
                >
                  {{! @glint-expect-error: don't know how to type named blocks :( }}
                  <:label>
                    By selecting this, you agree to our
                    <a href='#' class='font-semibold text-primary'>privacy&nbsp;policy</a>.
                  </:label>
                </Toggle>
                <div class='sm:col-span-2'>
                  <Fieldset @legend='Select your reviewers!' @errors={{api.errors.reviewers}}>
                    <Checkbox
                      @id='joschka'
                      @label='Joschka'
                      @avatar='https://avatars.githubusercontent.com/u/1042339?v=4'
                      {{api.register 'reviewers'}}
                      value='joschka'
                    />
                    <Checkbox
                      @id='balint'
                      @label='Balint'
                      @avatar='https://balinterdi.com/images/avatar-balint-300x275-gray.jpg'
                      {{api.register 'reviewers'}}
                      value='balint'
                    />
                    <Checkbox
                      @id='marco'
                      @label='Marco'
                      @avatar='https://emberfest.eu/images/speakers/marcoow.jpg'
                      {{api.register 'reviewers'}}
                      value='marco'
                    />
                  </Fieldset>
                </div>
              </div>
              <div class='mt-10'>
                <Button type='submit'>
                  Send the talk!
                </Button>
              </div>
            </form>
          </div>
          <div class='max-w-2xl w-full mt-16 md:mt-0'>

            <div class='max-w-2xl text-center border-b border-accent pb-5 sm:pb-10'>
              <Header>Submitted result</Header>
              <Subheader class='mt-3'>{{if
                  this.updatedData
                  "Congratulations! You've succeeded to fill your
            form 😄"
                  'Submit proper data to see the results!'
                }}
              </Subheader>
            </div>
            {{#if this.updatedData}}
              <div class='mt-16 max-w-xl sm:mt-20'>
                <CodeBlock @code={{this.updatedData}} @language='json5' @theme='vitesse-dark' />
              </div>
            {{/if}}</div>
        </div>
      </div>
    </Formidable>
  </template>
}

export default Demo;
