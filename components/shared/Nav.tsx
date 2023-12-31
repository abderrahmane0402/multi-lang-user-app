"use client"
import Link from "next/link"
import { Button } from "../ui/button"
import { usePathname } from "next/navigation"
import { pageAcces } from "@/lib/userPermission"
import { useSession } from "next-auth/react"

export default function Navbar() {
  const path = usePathname()
  const session = useSession()
  if (session.status == "loading") return <></>
  return (
    <>
      {pageAcces(session.data?.user.role!, "/condidature").acces && (
        <Button
          className={`${path != "/condidature" && "text-muted-foreground"}`}
          variant={"link"}
          asChild
        >
          <Link href={"/condidature"}>mes informations</Link>
        </Button>
      )}

      {pageAcces(session.data?.user.role!, "/admin/condidat").acces && (
        <Button
          className={`${path != "/admin/condidat" && "text-muted-foreground"}`}
          variant={"link"}
          asChild
        >
          <Link href={"/admin/condidat"}>les Condidats</Link>
        </Button>
      )}
      {pageAcces(session.data?.user.role!, "/admin/employer").acces && (
        <Button
          className={`${path != "/admin/employer" && "text-muted-foreground"}`}
          variant={"link"}
          asChild
        >
          <Link href={"/admin/employer"}>les employers</Link>
        </Button>
      )}
    </>
  )
}
