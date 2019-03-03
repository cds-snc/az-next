import Link from 'next/link'

const Three = () => (
  <div>
    <h1>Page 3</h1>
    <p>Way better than page 2, right?</p>
    <Link href="/two">
      <a>Back to Page Two</a>
    </Link>
  </div>
)

export default Three
