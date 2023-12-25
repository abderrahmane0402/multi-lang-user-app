import { role } from "@/types/next-auth"

type permission = {
  create: boolean
  read: boolean
  update: boolean
  delete: boolean
}

function toPermission(droitacces: String | null): permission | null {
  if (!droitacces) return null
  return {
    create: Boolean(droitacces?.at(0)),
    read: Boolean(droitacces?.at(1)),
    update: Boolean(droitacces?.at(2)),
    delete: Boolean(droitacces?.at(3)),
  }
}

export function PermissionManager(
  userRole: role,
  currentPage: string
): permission | null {
  for (let index = 0; index < userRole.asso_11.length; index++) {
    if (currentPage.includes(userRole.asso_11[index].url)) {
      return toPermission(userRole.asso_11[index].droitacces)
    }
  }

  return null
}


