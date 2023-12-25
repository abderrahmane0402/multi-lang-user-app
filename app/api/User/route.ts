import { prisma } from "@/lib/prisma"
import { hash } from "bcrypt"

export async function GET(req: Request) {
  const user = await prisma.personne.create({
    data: {
      id: 2,
      email: "hello2@gmail.com",
      password: await hash("sa12344321sa", 10),
      condidat: {
        create: {
          adresse: "hello",
          cin: "mc312787",
        },
      },
    },
  })
  return Response.json({ message: "success" })
}
