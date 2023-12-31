import Component from '@glimmer/component';
import { tracked } from '@glimmer/tracking';
import { action } from '@ember/object';

import { yupValidator } from 'ember-formidable';
import * as Yup from 'yup';

interface DemoSignature {
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
  agreed: Yup.boolean().required('You must agree').isTrue('You must agree'),
  reviewers: Yup.array()
    .of(Yup.string().oneOf(['joschka', 'balint', 'marco']))
    .required('At least one reviewer is required'),
});

interface IFormData {
  lastName: string;
  firstName: string;
  phone: { country: string; number: string };
  birthday: string;
  email: string;
  talk: { title: string; description: string };
  agreed: boolean;
  reviewers: string[];
  company?: string;
}

class DemoComponent extends Component<DemoSignature> {
  @tracked updatedData?: string;

  @action
  logData(data: IFormData) {
    this.updatedData = JSON.stringify(data, null, 2);
  }

  validator = yupValidator(schema) as any;
}

export default DemoComponent;

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    Demo: typeof DemoComponent;
  }
}
