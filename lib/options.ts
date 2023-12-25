import { NextAuthOptions, User } from "next-auth"
import CredentialsProvider from "next-auth/providers/credentials"
import { Auth } from "./actions/Auth.action"
import { PrismaAdapter } from "@next-auth/prisma-adapter"
import { prisma } from "./prisma"
import { compare } from "bcrypt"

export const authOptions: NextAuthOptions = {
  pages: {
    signIn: "/sign-in",
  },
  secret: process.env.NEXTAUTH_SECRET,
  session: {
    strategy: "jwt",
  },
  adapter: PrismaAdapter(prisma),
  providers: [
    CredentialsProvider({
      name: "Credentials",
      credentials: {
        email: { label: "email", type: "email" },
        password: { label: "password", type: "password" },
      },
      async authorize(credentials) {
        if (!credentials || !credentials.email || !credentials.password)
          return null
        const user = await Auth(credentials.email)
        if (!user) return null
        const passwordMatch = await compare(credentials.password, user.password)

        if (!passwordMatch) return null

        return {
          id: `${user.id}`,
          email: `${user.email}`,
          role: user.role!,
        }
      },
    }),
  ],
  callbacks: {
    async jwt({ token, user }) {
      if (user)
        return {
          ...token,
          role: user.role,
        }
      return token
    },
    async session({ session, token }) {
      return {
        ...session,
        user: {
          ...session.user,
          role: token.role,
        },
      }
    },
  },
}
