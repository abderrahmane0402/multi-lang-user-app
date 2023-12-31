"use client"
import { pageAcces } from "@/lib/userPermission"
import { useSession } from "next-auth/react"
import { useRouter } from "next/navigation"

export default function CondidatPage() {
  const router = useRouter()
  const session = useSession()
  if (!session.data?.user) {
    router.push("/sign-in")
    return <></>
  }
  const result = pageAcces(session.data!.user.role, "/condidature")
  if (!result.acces) {
    router.push("/sign-in")
    return <></>
  }

  return (
    <div className='text-center'>
      je suis un {session.data!.user.role.libelle}
      <p>{session.data!.user.email}</p>
    </div>
  )
}
