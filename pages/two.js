import Link from 'next/link'

const Two = () => (
  <div>
    <h1>Page Two</h1>
    <p>Way better than page 1, right?</p>
    <Link href="/">
      <a>Back to Page One</a>
    </Link>
    <br />
    <br />
    <Link href="/three">
      <a>Actually, I want to see Page Three</a>
    </Link>
  </div>
)

export default Two
