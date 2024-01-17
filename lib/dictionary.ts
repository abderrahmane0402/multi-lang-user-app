
import "server-only";
import { Locale, i18n } from "@/i18n-config";

const dictionaries = {
  arb: () => import("@/dictionaries/arb.json").then((module) => module.default),
  eng: () => import("@/dictionaries/eng.json").then((module) => module.default),
  fre: () => import("@/dictionaries/fre.json").then((module) => module.default),
};

export const getDictionary = async (locale: string) => {
  // @ts-ignore
  return dictionaries[locale]();
};
