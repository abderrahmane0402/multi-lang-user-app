import { authOptions } from "@/lib/options"
import { pageAcces } from "@/lib/userPermission"
import { getServerSession } from "next-auth"
import { redirect } from "next/navigation"

export default async function AdminPage() {
  const session = await getServerSession(authOptions)
  const result = pageAcces(session!.user.role, "/admin")
  if (!result.acces) redirect("/sign-in")
  return (
    <div className='wrapper text-center'>
      <h1 className='text-4xl tracking-wide font-bold underline'>
        Bonjour Monsieur {session!.user.role.libelle}
      </h1>
    </div>
  )
}
