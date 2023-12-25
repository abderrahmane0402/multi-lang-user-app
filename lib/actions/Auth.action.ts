"use server"

import { prisma } from "../prisma"
import { handleError } from "../utils"

export async function Auth(email: string) {
  try {
    return await prisma.personne.findUnique({
      where: {
        email,
      },
      include: {
        role: {
          include: {
            asso_11: {
              select: {
                url: true,
                droitacces: true,
              },
            },
          },
        },
      },
    })
  } catch (error) {
    handleError(error)
  }
}
