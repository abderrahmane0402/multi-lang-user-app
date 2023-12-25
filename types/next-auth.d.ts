import NextAuth from "next-auth"

declare type role = {
  asso_11: {
    url: string
    droitacces: string | null
  }[]
  libelle: string
  libelle_1: string | null
}

declare module "next-auth" {
  interface User {
    role: role
  }
  interface Session {
    user: User & {
      role: role
    }
    token: {
      role: role
    }
  }
}
