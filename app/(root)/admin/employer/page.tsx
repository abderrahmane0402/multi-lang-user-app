import DataTable from "@/components/shared/Table"
import { Button } from "@/components/ui/button"
import {
  Card,
  CardContent,
  CardDescription,
  CardHeader,
  CardTitle,
} from "@/components/ui/card"
import { readCondidats } from "@/lib/actions/condidat.action"
import { readEmployers } from "@/lib/actions/employer.action"
import { authOptions } from "@/lib/options"
import { PermissionManager, pageAcces } from "@/lib/userPermission"
import { PenSquare, Trash2 } from "lucide-react"
import { getServerSession } from "next-auth"
import { redirect } from "next/navigation"

export default async function GestionCondidatPage() {
  const session = await getServerSession(authOptions)
  const result = pageAcces(session!.user.role, "/admin/employer")
  if (!result.acces) redirect("/sign-in")

  const permission = PermissionManager(
    session!.user.role,
    "/admin/employer",
    result.index!
  )
  console.log(permission)
  const employers = permission?.read ? await readEmployers() : null

  const data = {
    header: ["id", "email", "libelle"],
    rows: employers?.map((employer) => {
      return {
        cells: [
          `${employer.id}`,
          employer.email,
          employer.libelle,
          <div className='flex items=center justify-center'>
            {permission?.update && (
              <Button size={"icon"} variant={"ghost"} className='rounded-full'>
                <PenSquare className='stroke-muted-foreground' />
              </Button>
            )}
            {permission?.delete && (
              <Button size={"icon"} variant={"ghost"} className='rounded-full'>
                <Trash2 className='stroke-muted-foreground' />
              </Button>
            )}
          </div>,
        ],
      }
    }),
  }
  return (
    <Card className='wrapper border-none'>
      <CardHeader>
        <CardTitle>Tableau des employers</CardTitle>
        <CardDescription>
          affichage de toute les employer qui a une acces a cette application
        </CardDescription>
      </CardHeader>
      <CardContent className='border'>
        <DataTable caption='tableau des employers' data={data} />
      </CardContent>
    </Card>
  )
}
