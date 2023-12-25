import AccesRefuse from "@/components/accesRefuse"
import { getServerSession } from "next-auth"

export default async function AdminPage() {
  const session = await getServerSession()
  if (!session?.user) return <AccesRefuse />

  return <div className='text-center'>je suis un administrateur</div>
}
