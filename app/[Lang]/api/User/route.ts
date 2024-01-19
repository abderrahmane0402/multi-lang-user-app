import { prisma } from "@/lib/prisma"
import { hash } from "bcrypt"

export async function GET(req: Request) {
  const user = await prisma.personne.create({
    data: {
      id: 4,
      email: "agent@gmail.com",
      password: await hash("12345678", 10),
      role: {
        connect: {
          libelle: "admin",
        },
      },
    },
  })
  const string = "/admin/employer"

  return Response.json({ message: string.includes("/admin") })
}
