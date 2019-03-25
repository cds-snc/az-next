import Link from 'next/link'
import Head from 'next/head'

const Two = () => (
  <main>
    <Head>
      <title>Page Two</title>
    </Head>
    <h1>Page Two</h1>
    <p>Way better than page 1, right?</p>
    <Link href="/">
      <a>Back to Page One</a>
    </Link>
  </main>
)

export default Two
