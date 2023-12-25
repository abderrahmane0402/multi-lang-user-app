"use client"

import { Button } from "@/components/ui/button"
import {
  Form,
  FormControl,
  FormDescription,
  FormField,
  FormItem,
  FormLabel,
  FormMessage,
} from "@/components/ui/form"
import { Input } from "@/components/ui/input"
import { UserAcces } from "@/lib/actions/Acces.action"
import { zodResolver } from "@hookform/resolvers/zod"
import { signIn, useSession } from "next-auth/react"
import { useRouter } from "next/navigation"
import { useForm } from "react-hook-form"
import * as z from "zod"

const formSchema = z.object({
  email: z.string().email({ message: "invalid email" }),
  password: z
    .string()
    .min(8, { message: "password must be at least 8 characters" }),
})

export default function SignInForm() {
  const router = useRouter()
  const form = useForm<z.infer<typeof formSchema>>({
    resolver: zodResolver(formSchema),
  })

  // 2. Define a submit handler.
  async function onSubmit(values: z.infer<typeof formSchema>) {
    const res = await signIn("credentials", {
      redirect: false,
      email: values.email,
      password: values.password,
    })

    if (!res?.ok && res?.error === "CredentialsSignin")
      console.log({ message: "Bad email or password !" })

    if (res?.ok) {
      const url = await UserAcces()
      if (url) router.push(url)
    }
  }

  return (
    <Form {...form}>
      <form onSubmit={form.handleSubmit(onSubmit)} className='space-y-5'>
        <FormField
          control={form.control}
          name='email'
          render={({ field }) => (
            <FormItem>
              <FormLabel>Email</FormLabel>
              <FormControl>
                <Input placeholder='Exemple@gmail.com' {...field} />
              </FormControl>
              <FormMessage />
            </FormItem>
          )}
        />
        <FormField
          control={form.control}
          name='password'
          render={({ field }) => (
            <FormItem>
              <FormLabel>Password</FormLabel>
              <FormControl>
                <Input type='password' {...field} />
              </FormControl>
              <FormMessage />
            </FormItem>
          )}
        />
        <Button type='submit'>Submit</Button>
      </form>
    </Form>
  )
}
