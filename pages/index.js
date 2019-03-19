import Link from 'next/link'
import getConfig from 'next/config'

const { publicRuntimeConfig } = getConfig()

const Index = () => (
  <div>
    <h1>Page One</h1>
    <p>Check out page 2 though.</p>
    <Link href="/two">
      <a>Page Two</a>
    </Link>
    <br />
    {publicRuntimeConfig.githubSha ? (
      <p>Last commit: {`${publicRuntimeConfig.githubSha}`}</p>
    ) : null}
  </div>
)

export default Index
