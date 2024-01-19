import Footer from "@/components/shared/Footer"
import Header from "@/components/shared/Header"
import { authOptions } from "@/lib/options"
import { getServerSession } from "next-auth"
import { redirect } from "next/navigation"

export default async function RootLayout({
  children,
}: {
  children: React.ReactNode
}) {
  const session = await getServerSession(authOptions)
  if (!session?.user) redirect("/sign-in")
  return (
    <div className='min-h-screen flex flex-col'>
      <Header />
      <div className='flex-1'>{children}</div>
      <Footer />
    </div>
  )
}
