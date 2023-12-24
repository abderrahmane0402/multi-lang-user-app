import SignInForm from "@/components/forms/SignInForm"
import {
  Card,
  CardContent,
  CardDescription,
  CardHeader,
  CardTitle,
} from "@/components/ui/card"

const SignInPage = () => {
  return (
    <Card className='w-[500px]'>
      <CardHeader>
        <CardTitle className='tracking-wide'>Authentifier</CardTitle>
        <CardDescription>
          entrer vos information pour connecter a l'application
        </CardDescription>
      </CardHeader>
      <CardContent>
        <SignInForm />
      </CardContent>
    </Card>
  )
}

export default SignInPage
