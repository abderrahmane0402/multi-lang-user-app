"use server"

import { prisma } from "../prisma"
import { handleError } from "../utils"

export function Auth(email: string) {
  try {
    return prisma.personne.findUnique({
      where: {
        email,
      },
    })
  } catch (error) {
    handleError(error)
  }
}
