export const i18n = {
    defaultLocale: 'arb',
    locales: ['eng', 'arb', 'fre'],
  } as const
  
  export type Locale = (typeof i18n)['locales'][number]


