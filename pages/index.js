import Link from 'next/link'

const Index = () => (
  <div>
    <h1>Page One</h1>
    <p>Check out page 2 though.</p>
    <Link href="/two">
      <a>Page Two</a>
    </Link>
    <br />
    <p>Last updated: Sat, 16 Mar 2019 20:31:00 GMT</p>
  </div>
)

export default Index
