import { prisma } from "@/lib/prisma"
import { hash } from "bcrypt"

export async function GET(req: Request) {
  // const user = await prisma.personne.create({
  //   data: {
  //     id: 4,
  //     email: "agent@gmail.com",
  //     password: await hash("sa12344321sa", 10),
  //     role: {
  //       connect: {
  //         libelle: "agent de scholarite",
  //       },
  //     },
  //   },
  // })
  const string = "/admin/employer"

  return Response.json({ message: string.includes("/admin") })
}
