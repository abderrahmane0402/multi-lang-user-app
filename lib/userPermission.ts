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
    create: Boolean(parseInt(droitacces?.at(0) || "0")),
    read: Boolean(parseInt(droitacces?.at(1) || "0")),
    update: Boolean(parseInt(droitacces?.at(2) || "0")),
    delete: Boolean(parseInt(droitacces?.at(3) || "0")),
  }
}

export function pageAcces(userRole: role, currentPage: string) {
  console.log(userRole)
  for (let index = 0; index < userRole.asso_11.length; index++) {
    if (currentPage.endsWith(userRole.asso_11[index].url)) {
      return {
        index: index,
        acces: true,
      }
    }
  }
  return {
    index: null,
    acces: false,
  }
}

export function PermissionManager(
  userRole: role,
  currentPage: string,
  index?: number
): permission | null | undefined {
  if (index === undefined) {
    let i = pageAcces(userRole, currentPage)
    if (i.acces) {
      return toPermission(userRole.asso_11[i.index!].droitacces)
    }
  } else {
    return toPermission(userRole.asso_11[index].droitacces)
  }
}
