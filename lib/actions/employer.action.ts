import { prisma } from "../prisma"

export function readEmployers() {
  try {
    return prisma.personne.findMany({
      select: {
        id: true,
        libelle: true,
        email: true,
      },
      where: {
        condidat: null,
      },
      orderBy: {
        id: "asc",
      },
    })
  } catch (error) {}
}
