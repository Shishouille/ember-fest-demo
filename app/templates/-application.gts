import Demo from '@components/demo';

import type { TOC } from '@ember/component/template-only';

const Application: TOC<{
  Element: HTMLElement;
  Args: {};
  Blocks: { default: [] };
}> = <template>
  <Demo />
  {{outlet}}
</template>;

export default Application;
