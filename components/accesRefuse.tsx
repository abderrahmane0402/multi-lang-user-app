"use client"

import { useRouter } from "next/navigation"

export default function AccesRefuse() {
  const router = useRouter()
  router.back()
  return <></>
}
