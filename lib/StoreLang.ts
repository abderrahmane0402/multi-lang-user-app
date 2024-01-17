import { create } from 'zustand'

type LangStore = {
    Lang: any,
    setLang: (Lang :any) => void,
}

export const useLangtStore = create<LangStore>((set) => ({
    Lang: null  ,
    setLang: (Lang :any) => set({Lang }),
    
}));



