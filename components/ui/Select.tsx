'use client'

import { usePathname } from 'next/navigation'
import { Locale, i18n } from '@/i18n-config'
import { useRouter } from 'next/navigation'

export default function LocaleSwitcher() {
  const router = useRouter();
  const pathName = usePathname()
  const redirectedPathName = (locale: string) => {
    if (!pathName) return '/'
    const segments = pathName.split('/')
    segments[1] = locale
    return segments.join('/')
  }
  const handleLanguageChange = (locale: Locale) => {
    // Update the language in the URL and trigger a page reload
    router.push(redirectedPathName(locale));
  };

  return (
    <div>
          <div className="flex justify-end items-end px-36">
      {i18n.locales.map((locale: Locale) => (
        <button
          key={locale}
          onClick={() => handleLanguageChange(locale)}
          className="px-4 py-2 mx-2 text-gray-800 hover:bg-gray-200 bg-orange-400 rounded-lg"
        >
          {locale}
        </button>
      ))}
    </div>


  
</div>
    
  )
}
