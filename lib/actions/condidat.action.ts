import { prisma } from "../prisma"
import { handleError } from "../utils"

export function readCondidats() {
  try {
    return prisma.condidat.findMany({
      select: {
        id: true,
        cin: true,
        adresse: true,
        personne: {
          select: {
            email: true,
          },
        },
      },
    })
  } catch (error) {
    handleError(error)
  }
}
