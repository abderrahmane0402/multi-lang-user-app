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
import { authOptions } from "@/lib/options"
import { PermissionManager, pageAcces } from "@/lib/userPermission"
import { PenSquare, Trash2 } from "lucide-react"
import { getServerSession } from "next-auth"
import { redirect } from "next/navigation"

export default async function GestionCondidatPage() {
  const session = await getServerSession(authOptions)
  const result = pageAcces(session!.user.role, "/admin/condidat")
  if (!result.acces) redirect("/sign-in")

  // get user permission
  const permission = PermissionManager(
    session!.user.role,
    "/admin/condidat",
    result.index!
  )
  console.log(permission)

  const condidats = permission?.read ? await readCondidats() : null

  const data = {
    header: ["id", "cin", "email", "adresse"],
    rows: condidats?.map((condidat) => {
      return {
        cells: [
          `${condidat.id}`,
          condidat.cin,
          condidat.personne?.email,
          condidat.adresse,
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
        <CardTitle>Tableau des condidats</CardTitle>
        <CardDescription>
          affichage de toute les condidats enregistrer pour passer un concours
        </CardDescription>
      </CardHeader>
      <CardContent className='border'>
        <DataTable caption='tableau des condidats' data={data} />
      </CardContent>
    </Card>
  )
}
