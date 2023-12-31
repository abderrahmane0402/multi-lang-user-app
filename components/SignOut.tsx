"use client"

import { signOut } from "next-auth/react"
import { Button } from "./ui/button"
import { useRouter } from "next/navigation"

export default function SignOut() {
  const router = useRouter()
  return (
    <Button
      onClick={() => {
        signOut({ redirect: false })
        router.push("/sign-in")
      }}
    >
      Sign out
    </Button>
  )
}
