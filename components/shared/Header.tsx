import Image from "next/image"
import Link from "next/link"
import SignOut from "../SignOut"
import Navbar from "./Nav"
import { ModeToggle } from "./ModeToggle"

export default function Header() {
  return (
    <header className='w-full border-b border-border'>
      <div className='wrapper flex items-center justify-between gap-5'>
        <Link href={"/"}>
          <Image src={"/logo.png"} alt='logo' width={150} height={28} />
        </Link>
        <nav className='flex gap-2 items-center'>
          <Navbar />
        </nav>
        <div className='flex justify-end w-[150px] gap-4'>
          <ModeToggle />
          <SignOut />
        </div>
      </div>
    </header>
  )
}
