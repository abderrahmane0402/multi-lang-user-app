"use server"

import { getServerSession } from "next-auth"
import { authOptions } from "../options"

export async function UserAcces() {
  const session = await getServerSession(authOptions)
  if (!session?.user) return null
  if (!session.user.role.asso_11.at(0)?.url) return null
  return session.user.role.asso_11.at(0)?.url
}
